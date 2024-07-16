////////////////////////////////////////////en este codigo se traen todas las denuncias de todas las categorias sin nombre del denunciante 

// //import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:movil_denuncias/components/modal.dart';

// import 'package:movil_denuncias/screens/VerDenuncias/controller_verdenuncias.dart';
// import 'package:movil_denuncias/size_config.dart';

// class VerDenunciasBody extends StatefulWidget {
//   @override
//   _VerDenunciasState createState() => _VerDenunciasState();
// }

// class _VerDenunciasState extends State<VerDenunciasBody> {
//   var denuncias = [];



// Future<List<dynamic>> getDenuncias() async {
//   try {
//     final result = await buscarDenunciasTodas(context);
//     if (mounted) {
//       setState(() {
//         denuncias = result ?? [];
//       });
//       return denuncias;
//     } else {
//       throw Exception("Widget is not mounted");
//     }
//   } on Exception catch (e) {
//     print('Error: $e');
//     return [];
//   }
// }

// Map<String, dynamic> _getColorForState(String estado) {
//     Color color = Colors.grey; // Default color
//     switch (estado) {
//       case 'Atendida':
//         color = Colors.green;
//         break;
//       case 'En proceso':
//         color = Colors.yellow;
//         break;
//       case 'En revisión':
//         color = Colors.red;
//         break;
//       default:
//         break;
//     }

//     return {
//       'icon': color,
//       'background': color,
//       'border': color
//     };
//   }

  


// // void showDetailDialog(dynamic denuncia) {
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         //title: Text('Contexto: ${denuncia['tituloDenuncia']}'),
// //         title: Text(denuncia['tituloDenuncia'],textAlign: TextAlign.center),
// //         content: SingleChildScrollView(
// //           child: ListBody(
// //             children: <Widget>[
// //               Text('Denunciante: ${denuncia['nombreDenunciante']}'),
// //               Text('Descripción: ${denuncia['descripcion']}'),
// //               Text('Categoría: ${denuncia['categoria']}'),
// //               Text('Ubicación: ${denuncia['ubicacion']}'),
// //               Text('Estado: ${denuncia['estado']}'),
// //               if (denuncia['evidencia'] != null)
// //                 FractionallySizedBox(
// //                   widthFactor: 0.9, // Ajusta esto según el espacio disponible
// //                   child: AspectRatio(
// //                     aspectRatio: 16 / 9, // Asume una relación de aspecto común
// //                     child: Image.network(
// //                       denuncia['evidencia'],
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         ),
// //         actions: <Widget>[
// //           TextButton(
// //             child: Text('Cerrar'),
// //             onPressed: () {
// //               Navigator.of(context).pop();
// //             },
// //           ),
// //         ],
// //       );
// //     },
// //   );
// // }

// void showDetailDialog(dynamic denuncia) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(
//           denuncia['tituloDenuncia'],
//           textAlign: TextAlign.center,
//         ),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               RichText(
//                 text: TextSpan(
//                   style: DefaultTextStyle.of(context).style,
//                   children: <TextSpan>[
//                     // TextSpan(text: 'Denunciante: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     // TextSpan(text: denuncia['nombreDenunciante']),
//                   ],
//                 ),
//               ),
//               RichText(
//                 text: TextSpan(
//                   style: DefaultTextStyle.of(context).style,
//                   children: <TextSpan>[
//                     TextSpan(text: 'Descripción: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     TextSpan(text: denuncia['descripcion']),
//                   ],
//                 ),
//               ),
//               RichText(
//                 text: TextSpan(
//                   style: DefaultTextStyle.of(context).style,
//                   children: <TextSpan>[
//                     TextSpan(text: 'Categoría: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     TextSpan(text: denuncia['categoria']),
//                   ],
//                 ),
//               ),
//               RichText(
//                 text: TextSpan(
//                   style: DefaultTextStyle.of(context).style,
//                   children: <TextSpan>[
//                     TextSpan(text: 'Ubicación: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     TextSpan(text: denuncia['ubicacion']),
//                   ],
//                 ),
//               ),
//               // RichText(
//               //   text: TextSpan(
//               //     style: DefaultTextStyle.of(context).style,
//               //     children: <TextSpan>[
//               //       TextSpan(text: 'Estado: ', style: TextStyle(fontWeight: FontWeight.bold)),
//               //       TextSpan(text: denuncia['estado']),
//               //     ],
//               //   ),
//               // ),
              
//               SizedBox(height: 10),
//               if (denuncia['evidencia'] != null)
//                 FractionallySizedBox(
//                   widthFactor: 0.9, // Ajusta esto según el espacio disponible
//                   child: AspectRatio(
//                     aspectRatio: 16 / 9, // Asume una relación de aspecto común
//                     child: Image.network(
//                       denuncia['evidencia'],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Cerrar'),
//             onPressed: () {
//               Navigator.of(context). pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }



//   Widget mostrarDenunciasTodas() {
//     if (denuncias.isNotEmpty) {
//       return ListView.builder(
//         itemCount: denuncias.length,
//         itemBuilder: (context, int index) {
//           var denuncia = denuncias[index];
//           var stateColors = _getColorForState(denuncia['estado']);
//           return GestureDetector(
//             onTap: () => showDetailDialog(denuncia),
//             child: Card(
//               elevation: 4,
//               margin: EdgeInsets.all(8),
//               child: Padding(
//                 padding: EdgeInsets.all(8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Row(
//                       children: [
//                         Icon(Icons.warning, color: Colors.black),
//                         SizedBox(width: 5),
//                         Text('Concepto: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                         Flexible(
//                           child: Text(
//                             denuncia['tituloDenuncia'],
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     // SizedBox(height: 5),
//                     // Row(
//                     //   children: [
//                     //     Icon(Icons.person),
//                     //     SizedBox(width: 5),
//                     //     Text('Denunciante: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     //     Flexible(
//                     //       child: Text(
//                     //         denuncia['nombreDenunciante'],
//                     //         overflow: TextOverflow.ellipsis,
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.description),
//                         SizedBox(width: 5),
//                         Text('Descripción: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                         Flexible(
//                           child: Text(
//                             denuncia['descripcion'],
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.category),
//                         SizedBox(width: 5),
//                         Text('Categoría: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                         Flexible(
//                           child: Text(
//                             denuncia['categoria'],
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.location_on),
//                         SizedBox(width: 5),
//                         Text('Ubicación: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                         Flexible(
//                           child: Text(
//                             denuncia['ubicacion'],
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                     Row(
//                       children: [
//                         //Icon(Icons.check_circle, color: stateColors['icon']),
//                         SizedBox(width: 5),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: stateColors['background'],
//                             borderRadius: BorderRadius.circular(4),
//                             border: Border.all(
//                               color: stateColors['border'],
//                               width: 2,
//                             ),
//                           ),
//                           child: Text(
//                             denuncia['estado'],
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                     ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                     SizedBox(height: 5),
//                     denuncia['evidencia'] != null
//                         ? Image.network(
//                             denuncia['evidencia'],
//                             height: 200,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           )
//                         : Container(),
//                     SizedBox(height: 5),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       return Center(child: Text('Aún no hay denuncias'));
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getDenuncias();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // ElevatedButton(
//           //   onPressed: () {
//           //     showModalBottomSheet(
//           //       context: context,
//           //       builder: (BuildContext context) {
//           //         return FilterModal(
//           //           onFilter: (filterValues) {
//           //             print(filterValues);
//           //             Navigator.pop(context);
//           //           },
//           //         );
//           //       },
//           //     );
//           //   },
//           //   child: Text('Filtrar Denuncias'),
//           // ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
//               child: mostrarDenunciasTodas(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }














//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movil_denuncias/components/modal.dart';

import 'package:movil_denuncias/screens/VerDenuncias/controller_verdenuncias.dart';
import 'package:movil_denuncias/size_config.dart';

class VerDenunciasBody extends StatefulWidget {
  @override
  _VerDenunciasState createState() => _VerDenunciasState();
}

class _VerDenunciasState extends State<VerDenunciasBody> {
  var denuncias = [];

  Future<List<dynamic>> getDenuncias() async {
    try {
      final result = await buscarDenunciasTodas(context);
      if (mounted) {
        setState(() {
          denuncias = result ?? [];
        });
        return denuncias;
      } else {
        throw Exception("Widget is not mounted");
      }
    } on Exception catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Map<String, dynamic> _getColorForState(String estado) {
    Color color = Colors.grey; // Default color
    switch (estado) {
      case 'Atendida':
        color = Colors.green;
        break;
      case 'En proceso':
        color = Colors.yellow;
        break;
      case 'En revisión':
        color = Colors.red;
        break;
      default:
        break;
    }

    return {
      'icon': color,
      'background': color,
      'border': color
    };
  }

  void showDetailDialog(dynamic denuncia) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            denuncia['tituloDenuncia'],
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Descripción: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: denuncia['descripcion']),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Categoría: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: denuncia['categoria']),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Ubicación: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: denuncia['ubicacion']),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                if (denuncia['evidencia'] != null)
                  FractionallySizedBox(
                    widthFactor: 0.9, // Ajusta esto según el espacio disponible
                    child: AspectRatio(
                      aspectRatio: 16 / 9, // Asume una relación de aspecto común
                      child: Image.network(
                        denuncia['evidencia'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget mostrarDenunciasAtendidas() {
    var denunciasAtendidas = denuncias.where((denuncia) => denuncia['estado'] == 'Atendida').toList();

    if (denunciasAtendidas.isNotEmpty) {
      return ListView.builder(
        itemCount: denunciasAtendidas.length,
        itemBuilder: (context, int index) {
          var denuncia = denunciasAtendidas[index];
          var stateColors = _getColorForState(denuncia['estado']);
          return GestureDetector(
            onTap: () => showDetailDialog(denuncia),
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.warning, color: Colors.black),
                        SizedBox(width: 5),
                        Text('Concepto: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Flexible(
                          child: Text(
                            denuncia['tituloDenuncia'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.description),
                        SizedBox(width: 5),
                        Text('Descripción: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Flexible(
                          child: Text(
                            denuncia['descripcion'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.category),
                        SizedBox(width: 5),
                        Text('Categoría: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Flexible(
                          child: Text(
                            denuncia['categoria'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 5),
                        Text('Ubicación: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Flexible(
                          child: Text(
                            denuncia['ubicacion'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: 5),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: stateColors['background'],
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: stateColors['border'],
                              width: 2,
                            ),
                          ),
                          child: Text(
                            denuncia['estado'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    denuncia['evidencia'] != null
                        ? Image.network(
                            denuncia['evidencia'],
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Center(child: Text('Aún no hay denuncias atendidas'));
    }
  }

  @override
  void initState() {
    super.initState();
    getDenuncias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
              child: mostrarDenunciasAtendidas(),
            ),
          ),
        ],
      ),
    );
  }
}

















































































// //////////////////////////////////////////////////Arreglar /////////////////////////////////////////



// import 'package:flutter/material.dart';
// import 'package:movil_denuncias/components/modal.dart';

// import 'package:movil_denuncias/screens/VerDenuncias/controller_verdenuncias.dart';
// import 'package:movil_denuncias/size_config.dart';

// class VerDenunciasBody extends StatefulWidget {
//   @override
//   _VerDenunciasState createState() => _VerDenunciasState();
// }

// class _VerDenunciasState extends State<VerDenunciasBody> {
//   List<dynamic> denuncias = [];
//   Map<String, dynamic> currentFilters = {
//     'selectedCategories': ['Todas las Categorías'],
//     'selectedStates': ['Todo']
//   };

//   Future<void> getDenuncias() async {
//     try {
//       final result = await buscarDenunciasTodas(context);
//       if (mounted) {
//         setState(() {
//           denuncias = result ?? [];
//           applyFilters();  // Aplicar filtros después de obtener los datos
//         });
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void applyFilters() {
//     setState(() {
//       if (currentFilters['selectedCategories'].contains('Todas las Categorías') &&
//           currentFilters['selectedStates'].contains('Todo')) {
//         return;  // No aplica ningún filtro
//       } else {
//         denuncias = denuncias.where((denuncia) {
//           bool categoryMatch = currentFilters['selectedCategories'].contains(denuncia['categoria']);
//           bool stateMatch = currentFilters['selectedStates'].contains(denuncia['estado']);
//           return categoryMatch && stateMatch;
//         }).toList();
//       }
//     });
//   }

//   void showDetailDialog(dynamic denuncia) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(
//           denuncia['tituloDenuncia'] ?? 'No title',
//           textAlign: TextAlign.center,
//         ),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('Denunciante: ${denuncia['nombreDenunciante'] ?? 'No available'}'),
//               Text('Descripción: ${denuncia['descripcion'] ?? 'No description'}'),
//               Text('Categoría: ${denuncia['categoria'] ?? 'No category'}'),
//               Text('Ubicación: ${denuncia['ubicacion'] ?? 'No location'}'),
//               Text('Estado: ${denuncia['estado'] ?? 'No state'}'),
//               if (denuncia['evidencia'] != null)
//                 FractionallySizedBox(
//                   widthFactor: 0.9, // Adjust this based on the available space
//                   child: AspectRatio(
//                     aspectRatio: 16 / 9, // Assume a common aspect ratio
//                     child: Image.network(
//                       denuncia['evidencia'],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Cerrar'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }


//   void updateFilters(Map<String, dynamic> newFilters) {
//     setState(() {
//       currentFilters = newFilters;
//       applyFilters();
//     });
//   }

//   Widget mostrarDenunciasTodas() {
//     if (denuncias.isNotEmpty) {
//       return ListView.builder(
//         itemCount: denuncias.length,
//         itemBuilder: (context, int index) {
//           var denuncia = denuncias[index];
//           return GestureDetector(
//             onTap: () => showDetailDialog(denuncia),
//             child: Card(
//               elevation: 4,
//               margin: EdgeInsets.all(8),
//               child: Padding(
//                 padding: EdgeInsets.all(8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text('Título: ${denuncia['tituloDenuncia'] ?? 'No title'}'),
//                     Row(
//                       children: [
//                         Icon(Icons.warning, color: Colors.black),
//                         SizedBox(width: 5),
//                         Text('Contexto: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                         Flexible(
//                           child: Text(
//                             denuncia['tituloDenuncia'],
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.person),
//                         SizedBox(width: 5),
//                         Text('Denunciante: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                         Flexible(
//                           child: Text(
//                             denuncia['nombreDenunciante'],
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.description),
//                         SizedBox(width: 5),
//                         Text('Descripción: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                         Flexible(
//                           child: Text(
//                             denuncia['descripcion'],
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.category),
//                         SizedBox(width: 5),
//                         Text('Categoría: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                         Flexible(
//                           child: Text(
//                             denuncia['categoria'],
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.location_on),
//                         SizedBox(width: 5),
//                         Text('Ubicación: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                         Flexible(
//                           child: Text(
//                             denuncia['ubicacion'],
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         //Icon(Icons.check_circle, color: stateColors['icon']),
//                         SizedBox(width: 5),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: Colors.green,  // Example color
//                             borderRadius: BorderRadius.circular(4),
//                             border: Border.all(
//                               color: Colors.green,  // Example color
//                               width: 2,
//                             ),
//                           ),
//                           child: Text(
//                             denuncia['estado'],
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     denuncia['evidencia'] != null
//                         ? Image.network(
//                             denuncia['evidencia'],
//                             height: 200,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           )
//                         : Container(),
//                     SizedBox(height: 5),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       return Center(child: Text('Aún no hay denuncias'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return FilterModal(
//                     onFilter: (filterValues) {
//                       updateFilters(filterValues);
//                       Navigator.pop(context);
//                     },
//                   );
//                 },
//               );
//             },
//             child: Text('Filtrar Denuncias'),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
//               child: mostrarDenunciasTodas(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     getDenuncias();
//   }
// }




























