//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movil_denuncias/components/modal.dart';
import 'package:movil_denuncias/screens/MisDenuncias/controller_misdenuncias.dart';
import 'package:movil_denuncias/size_config.dart';
import 'package:movil_denuncias/components/coustom_filter_process.dart';
import 'package:movil_denuncias/components/coustom_filter_category.dart';

class MisDenunciasBody extends StatefulWidget {
  @override
  _MisDenunciasState createState() => _MisDenunciasState();
}

class _MisDenunciasState extends State<MisDenunciasBody> {
  var denuncias = [];

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

  // Codigo funcional pero sin iconos
//   mostrarDenuncias() {
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
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          'Denunciante: ${denuncia['nombreDenunciante']}',
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
                      Flexible(
                        child: Text(
                          'Descripción: ${denuncia['descripcion']}',
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
                      Flexible(
                        child: Text(
                          'Categoría: ${denuncia['categoria']}',
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
                      Flexible(
                        child: Text(
                          'Ubicación: ${denuncia['ubicacion']}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.check_circle),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          'Estado: ${denuncia['estado']}',
                          overflow: TextOverflow.ellipsis,
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
    return Column(
      children: [
        // CustomDropdownButton(
        //   initialValue: 'Todas las Categorías',
        //   onChanged: (String newValue) {
        //     print('Categoría seleccionada: $newValue');
        //     // Aquí puedes realizar las acciones necesarias con la nueva categoría seleccionada
        //   },
        // ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return FilterModal(
                  onFilter: (filterValues) {
                    // Implementa tu lógica de filtrado aquí
                    // filterValues será un mapa con las categorías y estados seleccionados
                    print(filterValues);
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
          child: Text('Filtrar Denuncias'),
        ),
        // ActionButton(category: ActionCategory.todo, onPressed: (val) {}),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
            child: Card(elevation: 4, child: mostrarDenuncias()),
          ),
        )
      ],
    );
  }
}
