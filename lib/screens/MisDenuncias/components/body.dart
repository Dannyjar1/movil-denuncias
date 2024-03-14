//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movil_denuncias/screens/MisDenuncias/controller_misdenuncias.dart';
import 'package:movil_denuncias/size_config.dart';

class MisDenunciasBody extends StatefulWidget {
  @override
  _MisDenunciasState createState() => _MisDenunciasState();
}

class _MisDenunciasState extends State<MisDenunciasBody> {
  var denuncias = [];

// Future<List<dynamic>> getDenuncias() async {
//   try {
//     final result = await buscarDenuncias(context);
//     if (mounted) {
//       setState(() {
//         denuncias = result;
//       });
//       return denuncias;
//     } else {
//       throw Exception("Widget is not mounted");
//     }
//   } on Exception catch (e) {
//      print('Error: $e');
    
//     return []; 
//   }
// }


Future<List<dynamic>> getDenuncias() async {
  try {
    final result = await buscarDenuncias(context);
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




  // mostrarDenuncias() {
  //   //if (denuncias != null && denuncias.length > 0) {
  //   if (denuncias.length > 0) {
  //     return ListView.builder(
  //       itemCount:denuncias.length,
  //       itemBuilder: (context, int i) {
  //         return Row(
  //           children: <Widget>[
  //             Container(
  //                 height: 120,
  //                 child: Image.network(denuncias[i]['imagenes'][0]) // Edit this
  //                 ),
  //             Expanded(
  //               child: Container(
  //                 height: 150,
  //                 padding: const EdgeInsets.all(12),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(denuncias[i]['descripcion'], // Edit this
  //                         style: TextStyle(
  //                             fontSize: 13, fontWeight: FontWeight.bold)),
  //                     SizedBox(height: 10),
  //                     Expanded(
  //                         child: Text(denuncias[i]['fecha'] +
  //                             " " +
  //                             denuncias[i]['hora'])) // Edit this
  //                   ],
  //                 ),
  //               ),
  //             )
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     return Center(child: Text('Aun no has denunciado'));
  //   }
  // }


  mostrarDenuncias() {
  if (denuncias.isNotEmpty) {
    return ListView.builder(
      itemCount: denuncias.length,
      itemBuilder: (context, int i) {
        var denuncia = denuncias[i];
        return Card(
          elevation: 4,
          margin: EdgeInsets.all(8),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  denuncia['tituloDenuncia'], 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),


                
                SizedBox(height: 5),
                Text('Denunciante: ${denuncia['nombreDenunciante']}'),
                SizedBox(height: 5),
                Text('Descripción: ${denuncia['descripcion']}'),
                SizedBox(height: 5),
                Text('Categoría: ${denuncia['categoria']}'),
                SizedBox(height: 5),
                Text('Estado: ${denuncia['estado']}'),
                SizedBox(height: 5),
                denuncia['evidencia'] != null
                    ? Image.network(
                        denuncia['evidencia'],
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(),
                SizedBox(height: 5),
                Text(
                  'Ubicación: ${denuncia['ubicacion']}',
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        );
      },
    );
  } else {
    return Center(child: Text('Aún no hay denuncias'));
  }
}

@override
  void initState() {
    getDenuncias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getDenuncias();
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
      child: Card(elevation: 4, child: mostrarDenuncias()),
    );
  }
}
