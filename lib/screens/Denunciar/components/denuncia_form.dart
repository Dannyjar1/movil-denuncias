import 'dart:io';
//import 'dart:ui';
import 'package:movil_denuncias/Services/shared_preferences.dart';
import 'package:movil_denuncias/components/botones.dart';
import 'package:movil_denuncias/components/widget_alerts.dart';
import 'package:movil_denuncias/components/widget_btn.dart';
import 'package:movil_denuncias/constants.dart';
import 'package:movil_denuncias/helper/keyboard.dart';
import 'package:movil_denuncias/screens/MapBox/mapbox_view.dart';
import 'package:movil_denuncias/size_config.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:location/location.dart' as loc;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../controller/controller_denuncias.dart';
import 'dart:convert';
import 'package:path/path.dart' as path;

class FormDenuncia extends StatefulWidget {
  static String routName = '/denuncia-form';

  @override
  _FormDenunciaState createState() => _FormDenunciaState();
}

class _FormDenunciaState extends State<FormDenuncia> {
  var imagenes = [];
  var enviarimagenes = [];

  File? imagen;
  String? _hour, _minute, _time;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  loc.Location location = loc.Location();
  TextEditingController editTituloDenuncia = TextEditingController();
  TextEditingController editDescripcion = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _ubicacionController = TextEditingController();
  Map? ubicacionDenuncia;
  String? categoriaSeleccionada;
  List<String> categorias = [
    'Agua Potable, Alcantarillado Sanitario, Alcantarillado Pluvial',
    'Recolección de Desechos y Saneamiento Ambiental',
    'Movilidad Urbana: Bacheo de Calles, Frecuencias, Obstrucciones de aceras, etc.',
    'Obstrucción de vías por construcciones, ornato, permisos de construcción'
  ];

  void onUbicacionSelected(Map ubicacion) {
    setState(() {
      ubicacionDenuncia = ubicacion;
      _ubicacionController.text =
          "${ubicacion['calles']}, ${ubicacion['referencia']}";
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = selectedDate.year.toString() +
            "-" +
            selectedDate.month.toString() +
            "-" +
            selectedDate.day.toString();
        print('DATE $selectedDate');
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour! + ':' + _minute!;
        _timeController.text = _time!;
      });
  }

// nuevo codigo
  Future<Map<dynamic, dynamic>?> obtenerUbicacion() async {
    var denuncia = await obtenerUbicacionDenuncia();
    if (denuncia != null) {
      ubicacionDenuncia = json.decode(denuncia);

      // Usar el operador de acceso condicional ?. y el operador de afirmación de no null !.
      _ubicacionController.text =
          ubicacionDenuncia?['calles'] ?? 'Valor por defecto';

      print('UBICACION DEL MAPA $ubicacionDenuncia');
      setState(() {
        // Actualiza el estado para reflejar los cambios
      });
      return ubicacionDenuncia;
    }
    return null;
  }

// antiguo
//  Future<Map<dynamic, dynamic>?> obtenerUbicacion() async {
//   var denuncia = await obtenerUbicacionDenuncia();
//   if (denuncia != null) {
//     ubicacionDenuncia = json.decode(denuncia);
//     _ubicacionController.text = ubicacionDenuncia?['calles'];
//     print('UBICACION DEL MAPA $ubicacionDenuncia');
//     setState(() {
//       // No puedes devolver un valor aquí en un método void
//       // Si necesitas usar este valor en otro lugar, puedes hacerlo en el código que llama a esta función.
//     });
//     return ubicacionDenuncia;
//   }
//   return null; // Devuelve null en caso de que denuncia sea null.
// }

  @override
  void initState() {
    imagenes.length = 0;
    checkGps();
    super.initState();
  }

  @override
  void dispose() {
    removeObtenerUbicacion();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKeyDenunciar,
          child: Column(
            children: <Widget>[
              // ListTile(
              //   leading: IconButton(
              //       icon: SvgPicture.asset("assets/icons/calendario.svg",
              //           width: 35),
              //       onPressed: () {
              //         _selectDate(context);
              //       }),
              //   title: TextFormField(
              //       style: TextStyle(fontSize: 18),
              //       textAlign: TextAlign.center,
              //       keyboardType: TextInputType.text,
              //       controller: _dateController,
              //       enabled: false,
              //       onChanged: (String val) {
              //         setState(() {
              //           _dateController.text = val.toString();
              //         });
              //       },
              //       decoration: InputDecoration(
              //         labelText: 'Fecha',
              //         floatingLabelBehavior: FloatingLabelBehavior.always,
              //       )),
              // ),
              // ListTile(
              //   leading: IconButton(
              //       icon: SvgPicture.asset("assets/icons/cronometro.svg",
              //           width: 35),
              //       onPressed: () {
              //         _selectTime(context);
              //       }),
              //   title: TextFormField(
              //     style: TextStyle(fontSize: 15),
              //     textAlign: TextAlign.center,
              //     onChanged: (String val) {
              //       setState(() {
              //         _timeController.text = val.toString();
              //       });
              //     },
              //     onTap: () {
              //       _selectTime(context);
              //     },
              //     enabled: false,
              //     keyboardType: TextInputType.text,
              //     controller: _timeController,
              //     decoration: InputDecoration(
              //         labelText: 'Hora',
              //         floatingLabelBehavior: FloatingLabelBehavior.always),
              //   ),
              // ),
// nuevo codigo
// Campo para el título de la denuncia
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: editTituloDenuncia,
                  decoration: InputDecoration(
                    labelText: "Título de la denuncia",
                    prefixIcon: Icon(Icons.title),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(10.0),
              //   child: DropdownButtonFormField(
              //     value: categoriaSeleccionada,
              //     decoration: InputDecoration(
              //       labelText: 'Categoría',
              //       prefixIcon: Icon(Icons.category),
              //       floatingLabelBehavior: FloatingLabelBehavior.always,
              //     ),
              //     items:
              //         categorias.map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (String? newValue) {
              //       setState(() {
              //         categoriaSeleccionada = newValue;
              //       });
              //     },
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      // Usa Flexible en lugar de Expanded
                      child: DropdownButtonFormField(
                        isExpanded:
                            true, // Asegúrate de que el dropdown se expanda
                        value: categoriaSeleccionada,
                        decoration: InputDecoration(
                          labelText: 'Categoría',
                          prefixIcon: Icon(Icons.category),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        items: categorias
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            categoriaSeleccionada = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

// fin nuevo codigo
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  readOnly: true, // Hace que el campo sea de solo lectura
                  controller: _ubicacionController,
                  decoration: InputDecoration(
                    labelText: 'Ubicación',
                    prefixIcon: Icon(Icons.location_on), // Icono de ubicación
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onTap: () async {
                    var status = await Permission.location.status;
                    if (status.isGranted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapaScreen(
                            onUbicacionSelected: onUbicacionSelected,
                          ),
                        ),
                      );
                    } else {
                      mostrarMensaje(
                          'Habilita los permisos de ubicación para continuar',
                          context,
                          3);
                      pedirPersmisos();
                    }
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: editDescripcion,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Descripción",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: BtnC(
                  title: "Añadir imagenes",
                  onTap: () {
                    alertMessage(
                      context,
                      message: "Selecciona una opción:",
                      titleBtnAgree: "Galería",
                      titleBtnCancel: "Cámara",
                      onTap: () => selectImageType(ImageSource.gallery),
                      onTapCancel: () => selectImageType(ImageSource.camera),
                    );
                    // selectImageType(ImageSource.gallery);
                  },
                ),
              ),

              mostrarImagenes(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: BtnC(
                  title: "Denunciar",
                  onTap: () {
                    KeyboardUtil.hideKeyboard(context);
                    obtnerDatosDenuncia();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectImageType(ImageSource type) async {
    Navigator.pop(context);
    if (imagenes.length < imagenesPermitidas) {
      mostrarLoading(context);
      var status = await Permission.storage.status;
      if (status.isGranted) {
        await selectImageGallery(type);
        Navigator.pop(context);
      } else {
        mostrarMensaje('Habilita los permisos de almacenamiento para continuar',
            context, 3);
        await pedirPersmisos();
        Navigator.pop(context);
      }
    } else {
      mostrarMensaje(
          'Número de imagenes permitidas $imagenesPermitidas \nPresiona sobre la imagen para eliminar',
          context,
          3);
    }
  }

  selectImageGallery(ImageSource type) async {
    try {
      final img = await ImagePicker().pickImage(source: type, imageQuality: 40);
      if (img != null) {
        setState(() {
          imagen = File(img.path);
          imagenes.add(imagen);
          var extension = path.extension(imagen!.path);
          enviarimagenes.add({'imagen': imagen?.path, 'extension': extension});
        });
      }
    } catch (e) {
      print('Error al seleccionar imagen: $e');
    }
  }

  mostrarImagenes() {
    return ListView.builder(
      itemCount: imagenes.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  preguntarEliminarImagen(i);
                },
                child: Image.file(imagenes[i],
                    height: getProportionateScreenHeight(150),
                    width: getProportionateScreenWidth(350)),
              )
            ],
          ),
        );
      },
    );
  }

  preguntarEliminarImagen(int i) async {
    try {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('¿Esta seguro de eliminar la imagen?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.pop(context);
                    KeyboardUtil.hideKeyboard(context);
                  },
                ),
                TextButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    setState(() {
                      imagenes.removeAt(i);
                      enviarimagenes.removeAt(i);
                      Navigator.pop(context);
                      KeyboardUtil.hideKeyboard(context);
                    });
                  },
                )
              ],
            );
          });
    } on AssertionError catch (e) {
      print(e);
    }
  }

  obtnerDatosDenuncia() async {
    try {
      if (ubicacionDenuncia != null && enviarimagenes.length > 0) {
        mostrarLoading(context);
        Map<String, String> denuncia = {
          'tituloDenuncia': editTituloDenuncia.text.trim(),
          'descripcion': editDescripcion.text.trim(),
          // 'latitud': ubicacionDenuncia?['latitud'],
          // 'longitud': ubicacionDenuncia?['longitud']
          "ubicacion":
              "${ubicacionDenuncia?['latitud']}, ${ubicacionDenuncia?['longitud']}",
          'categoria': categoriaSeleccionada ?? "",
        };
        await enviarDenuncia(denuncia, enviarimagenes, context);
      } else {
        mostrarMensaje('Agrega la información correspondiente', context, 2);
      }
    } on Exception catch (e) {
      print('Error: $e');
      mostrarMensaje('Vuelve a intentarloo', context, 2);
      Navigator.pop(context);
    }
  }

//   Future<void> obtnerDatosDenuncia() async {
//   try {
//     if (ubicacionDenuncia != null && enviarimagenes.length > 0) {
//       mostrarLoading(context); // Asegúrate de que esta función muestre un indicador de carga apropiado

//       Map<String, dynamic> denuncia = {
//         'id_persona': await obtenerPerfil(), // Asegúrate de que esta función devuelva el ID del perfil correctamente
//         'referencia': ubicacionDenuncia?['referencia'],
//         'calles': ubicacionDenuncia?['calles'],
//         'hora': _timeController.text, // Verifica si es necesario enviar la hora
//         'fecha': _dateController.text, // Verifica si es necesario enviar la fecha
//         'descripcion': descripcion,
//         'latitud': ubicacionDenuncia?['latitud'],
//         'longitud': ubicacionDenuncia?['longitud'],
//         // Asegúrate de que los datos de las imágenes se estén formateando correctamente
//         'imagenes': enviarimagenes.map((imagen) => {
//           'path': imagen['imagen'],
//           'extension': imagen['extension']
//         }).toList(),
//       };

//       await enviarDenuncia(denuncia, enviarimagenes, context); // Asegúrate de que enviarDenuncia maneje los datos correctamente
//     } else {
//       mostrarMensaje('Agrega la información correspondiente', context, 2);
//     }
//   } catch (e) {
//     print('Error: $e');
//     mostrarMensaje('Vuelve a intentarlo', context, 2);
//     Navigator.pop(context);
//   }
// }

  Future checkGps() async {
    try {
      if (!await location.serviceEnabled()) {
        await location.requestService();
      }
    } on Exception catch (e) {
      print('ERROR $e');
    }
  }

  final _formKeyDenunciar = GlobalKey<FormState>();
}
