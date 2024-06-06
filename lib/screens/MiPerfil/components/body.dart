// //import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:movil_denuncias/screens/VerDenuncias/controller_verdenuncias.dart';
// import 'package:movil_denuncias/size_config.dart';

// class VerPerfilBody extends StatefulWidget {
//   @override
//   _VerPerfilState createState() => _VerPerfilState();
// }

// class _VerPerfilState extends State<VerPerfilBody> {
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


//   mostrarPerfil() {
//   if (denuncias.isNotEmpty) {
//     return ListView.builder(
//       itemCount: denuncias.length,
//       itemBuilder: (context, int i) {
//         var denuncia = denuncias[i];
//         return Card(
//           elevation: 4,
//           margin: EdgeInsets.all(8),
//           child: Padding(
//             padding: EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   denuncia['tituloDenuncia'], 
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text('Denunciante: ${denuncia['nombreDenunciante']}'),
//                 SizedBox(height: 5),
//                 Text('Descripción: ${denuncia['descripcion']}'),
//                 SizedBox(height: 5),
//                 Text('Categoría: ${denuncia['categoria']}'),
//                 SizedBox(height: 5),
//                 Text('Estado: ${denuncia['estado']}'),
//                 SizedBox(height: 5),
//                 denuncia['evidencia'] != null
//                     ? Image.network(
//                         denuncia['evidencia'],
//                         height: 150,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       )
//                     : Container(),
//                 SizedBox(height: 5),
//                 Text(
//                   'Ubicación: ${denuncia['ubicacion']}',
//                 ),
//                 SizedBox(height: 5),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   } else {
//     return Center(child: Text('Aún no hay denuncias'));
//   }
// }

// @override
//   void initState() {
//     getDenuncias();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // getDenuncias();
//     return Padding(
//       padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
//       child: Card(elevation: 4, child: mostrarPerfil()),
//     );
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movil_denuncias/Api/api_persona.dart';
import 'package:movil_denuncias/Services/shared_preferences.dart';
import 'package:movil_denuncias/components/botones.dart';

Future<Map<String, dynamic>> buscarPerfil(BuildContext context) async {
  try {
    String idPersona = await obtenerPerfil();
    http.Response response = await filtrarPerfil(idPersona);
    if (response.statusCode == 200) {
      var datosUsuario = json.decode(response.body);
      if (datosUsuario != null && datosUsuario['data'] != null) {
        return datosUsuario['data'];
      } else {
        throw Exception("No se encontraron datos del usuario.");
      }
    } else {
      throw Exception("Error al obtener datos del usuario: ${response.statusCode}");
    }
  } catch (e) {
    print(e);
    Navigator.pop(context);
    mostrarMensaje('No se pudo obtener el perfil, por favor intente nuevamente', context, 3);
    return {};
  }
}



class VerPerfilBody extends StatefulWidget {
  @override
  _VerPerfilState createState() => _VerPerfilState();
}

class _VerPerfilState extends State<VerPerfilBody> {
  Map<String, dynamic> datosUsuario = {};

  Future<void> getDatosUsuario() async {
    try {
      final resultado = await buscarPerfil(context);
      if (mounted) {
        setState(() {
          datosUsuario = resultado;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Widget mostrarPerfil() {
    if (datosUsuario.isNotEmpty) {
      return ListView(
        children: [
          ListTile(title: Text('Nombre: ${datosUsuario['nombreCompleto']}')),
          ListTile(title: Text('Cédula: ${datosUsuario['cedula']}')),
          ListTile(title: Text('Teléfono: ${datosUsuario['numTelefono']}')),
          ListTile(title: Text('Email: ${datosUsuario['email']}')),
          ListTile(title: Text('Número de denuncias realizadas: ${datosUsuario['numDenunciasRealizadas']}')),
          datosUsuario['photo'] != null
              ? Image.network(datosUsuario['photo'])
              : SizedBox(),
        ],
      );
    } else {
      return Center(child: Text('No hay datos disponibles'));
    }
  }

  @override
  void initState() {
    super.initState();
    getDatosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        child: mostrarPerfil(),
      ),
    );
  }
}
