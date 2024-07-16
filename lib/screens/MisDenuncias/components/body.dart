// //import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:movil_denuncias/components/modal.dart';
// import 'package:movil_denuncias/screens/MisDenuncias/controller_misdenuncias.dart';
// import 'package:movil_denuncias/size_config.dart';

// class MisDenunciasBody extends StatefulWidget {
//   @override
//   _MisDenunciasState createState() => _MisDenunciasState();
// }

// class _MisDenunciasState extends State<MisDenunciasBody> {
//   var denuncias = [];

//   Future<List<dynamic>> getDenuncias() async {
//     try {
//       final result = await buscarDenuncias(context);
//       if (mounted) {
//         setState(() {
//           denuncias = result ?? [];
//         });
//         return denuncias;
//       } else {
//         throw Exception("Widget is not mounted");
//       }
//     } on Exception catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }

//   // Codigo funcional pero sin iconos
// //   mostrarDenuncias() {
// //   if (denuncias.isNotEmpty) {
// //     return ListView.builder(
// //       itemCount: denuncias.length,
// //       itemBuilder: (context, int i) {
// //         var denuncia = denuncias[i];
// //         return Card(
// //           elevation: 4,
// //           margin: EdgeInsets.all(8),
// //           child: Padding(
// //             padding: EdgeInsets.all(8),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 Text(
// //                   denuncia['tituloDenuncia'],
// //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text('Denunciante: ${denuncia['nombreDenunciante']}'),
// //                 SizedBox(height: 5),
// //                 Text('Descripción: ${denuncia['descripcion']}'),
// //                 SizedBox(height: 5),
// //                 Text('Categoría: ${denuncia['categoria']}'),
// //                 SizedBox(height: 5),
// //                 Text('Estado: ${denuncia['estado']}'),
// //                 SizedBox(height: 5),
// //                 denuncia['evidencia'] != null
// //                     ? Image.network(
// //                         denuncia['evidencia'],
// //                         height: 150,
// //                         width: double.infinity,
// //                         fit: BoxFit.cover,
// //                       )
// //                     : Container(),
// //                 SizedBox(height: 5),
// //                 Text(
// //                   'Ubicación: ${denuncia['ubicacion']}',
// //                 ),
// //                 SizedBox(height: 5),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   } else {
// //     return Center(child: Text('Aún no hay denuncias'));
// //   }
// // }

// /////////////////////////////////////////////////////////////////////////////////////////

//   mostrarDenuncias() {
//     if (denuncias.isNotEmpty) {
//       return ListView.builder(
//         itemCount: denuncias.length,
//         itemBuilder: (context, int i) {
//           var denuncia = denuncias[i];
//           return Card(
//             elevation: 4,
//             margin: EdgeInsets.all(8),
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     denuncia['tituloDenuncia'],
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Icon(Icons.person),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Denunciante: ${denuncia['nombreDenunciante']}',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Icon(Icons.description),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Descripción: ${denuncia['descripcion']}',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Icon(Icons.category),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Categoría: ${denuncia['categoria']}',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Ubicación: ${denuncia['ubicacion']}',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Icon(Icons.check_circle),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Estado: ${denuncia['estado']}',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   denuncia['evidencia'] != null
//                       ? Image.network(
//                           denuncia['evidencia'],
//                           height: 200,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         )
//                       : Container(),
//                   SizedBox(height: 5),
//                 ],
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
//     getDenuncias();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // getDenuncias();
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             showModalBottomSheet(
//               context: context,
//               builder: (BuildContext context) {
//                 return FilterModal(
//                   onFilter: (filterValues) {

//                     // Implementa tu lógica de filtrado aquí
//                     // filterValues será un mapa con las categorías y estados seleccionados

//                     print(filterValues);
//                     Navigator.pop(context);
//                   },
//                 );
//               },
//             );
//           },
//           child: Text('Filtrar Denuncias'),

//         ),

//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
//             child: Card(elevation: 4, child: mostrarDenuncias()),
//           ),
//         )
//       ],
//     );
//   }
// }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:movil_denuncias/components/modal.dart';
// import 'package:movil_denuncias/screens/MisDenuncias/controller_misdenuncias.dart';
// import 'package:movil_denuncias/size_config.dart';

// class MisDenunciasBody extends StatefulWidget {
//   @override
//   _MisDenunciasState createState() => _MisDenunciasState();
// }

// class _MisDenunciasState extends State<MisDenunciasBody> {
//   var denuncias = [];

//   Future<List<dynamic>> getDenuncias() async {
//     try {
//       final result = await buscarDenuncias(context);
//       if (mounted) {
//         setState(() {
//           denuncias = result ?? [];
//         });
//         return denuncias;
//       } else {
//         throw Exception("Widget is not mounted");
//       }
//     } on Exception catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }

// Map<String, dynamic> _getColorForState(String estado) {
//   Map<String, dynamic> colors; // Diccionario para almacenar colores de icono, fondo y borde

//   switch (estado) {
//     case 'Atendida':
//       colors = {
//         'icon': Colors.green,
//         'background': Colors.green,
//         'border': Colors.green, // Color del borde más oscuro
//       };
//       break;
//     case 'En proceso':
//       colors = {
//         'icon': Colors.yellow,
//         'background': Colors.yellow,
//         'border': Colors.yellow // Color del borde más oscuro
//       };
//       break;
//     case 'En revisión':
//       colors = {
//         'icon': Colors.red,
//         'background': Colors.red,
//         'border': Colors.red // Color del borde más oscuro
//       };
//       break;
//     default:
//       colors = {
//         'icon': Colors.grey,
//         'background': Colors.grey[200],
//         'border': Colors.grey[500] // Color del borde más oscuro
//       };
//       break;
//   }

//   return colors;
// }

//   Widget mostrarDenuncias() {
//     if (denuncias.isNotEmpty) {
//       return ListView.builder(
//         itemCount: denuncias.length,
//         itemBuilder: (context, int index) {
//           var denuncia = denuncias[index];
//           var stateColors = _getColorForState(denuncia['estado']);
//           return Card(
//             elevation: 4,
//             margin: EdgeInsets.all(8),
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Row(
//                     children: [
//                       Icon(Icons.warning, color: Colors.green),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Concepto: ${denuncia['tituloDenuncia']}',
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Icon(Icons.person,color: Colors.green),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Denunciante: ${denuncia['nombreDenunciante']}',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Icon(Icons.description, color: Colors.green),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Descripción: ${denuncia['descripcion']}',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Icon(Icons.category, color: Colors.green),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Categoría: ${denuncia['categoria']}',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on,color: Colors.green),
//                       SizedBox(width: 5),
//                       Flexible(
//                         child: Text(
//                           'Ubicación: ${denuncia['ubicacion']}',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                    SizedBox(height: 5),
//                   Row(
//                     children: [
//                       //Icon(Icons.check_circle, color: stateColors['icon']),
//                       SizedBox(width: 5),
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: stateColors['background'],
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                             color: stateColors['border'], // Color del borde más oscuro
//                             width: 2, // Ancho del borde
//                           ),
//                         ),
//                         child: Text(
//                           denuncia['estado'],
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   denuncia['evidencia'] != null
//                       ? Image.network(
//                           denuncia['evidencia'],
//                           height: 200,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         )
//                       : Container(),
//                   SizedBox(height: 5),
//                 ],
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
//           ElevatedButton(
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return FilterModal(
//                     onFilter: (filterValues) {
//                       // Implementa tu lógica de filtrado aquí
//                       // filterValues será un mapa con las categorías y estados seleccionados
//                       print(filterValues);
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
//               child: mostrarDenuncias(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////opcion 1 ///////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:movil_denuncias/components/modal.dart';
// import 'package:movil_denuncias/screens/MisDenuncias/controller_misdenuncias.dart';
// import 'package:movil_denuncias/size_config.dart';

// class MisDenunciasBody extends StatefulWidget {
//   @override
//   _MisDenunciasState createState() => _MisDenunciasState();
// }

// class _MisDenunciasState extends State<MisDenunciasBody> {
//   var denuncias = [];

//   Future<List<dynamic>> getDenuncias() async {
//     try {
//       final result = await buscarDenuncias(context);
//       if (mounted) {
//         setState(() {
//           denuncias = result ?? [];
//         });
//         return denuncias;
//       } else {
//         throw Exception("Widget is not mounted");
//       }
//     } on Exception catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }

//   Map<String, dynamic> _getColorForState(String estado) {
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

//   void showDetailDialog(dynamic denuncia) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(denuncia['tituloDenuncia']),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('Descripción: ${denuncia['descripcion']}'),
//                 Text('Denunciante: ${denuncia['nombreDenunciante']}'),
//                 Text('Estado: ${denuncia['estado']}'),
//                 Text('Categoría: ${denuncia['categoria']}'),
//                 Text('Ubicación: ${denuncia['ubicacion']}'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cerrar'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget mostrarDenuncias() {
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
//                         Icon(Icons.warning, color: stateColors['icon']),
//                         SizedBox(width: 5),
//                         Flexible(
//                           child: Text(
//                             'Concepto: ${denuncia['tituloDenuncia']}',
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.person, color: stateColors['icon']),
//                         SizedBox(width: 5),
//                         Flexible(
//                           child: Text(
//                             'Denunciante: ${denuncia['nombreDenunciante']}',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.description, color: stateColors['icon']),
//                         SizedBox(width: 5),
//                         Flexible(
//                           child: Text(
//                             'Descripción: ${denuncia['descripcion']}',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.category, color: stateColors['icon']),
//                         SizedBox(width: 5),
//                         Flexible(
//                           child: Text(
//                             'Categoría: ${denuncia['categoria']}',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.location_on, color: stateColors['icon']),
//                         SizedBox(width: 5),
//                         Flexible(
//                           child: Text(
//                             'Ubicación: ${denuncia['ubicacion']}',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         SizedBox(width: 5),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: stateColors['background'],
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                               color: stateColors['border'], // Color del borde más oscuro
//                               width: 2, // Ancho del borde
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
//   void initState() {
//     super.initState();
//     getDenuncias();
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
//                       print(filterValues);
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
//               child: mostrarDenuncias(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

///////////////////////////////////////////////////////////////////////////////////////////////////
///

// import 'package:flutter/material.dart';
// import 'package:movil_denuncias/components/modal.dart';
// import 'package:movil_denuncias/screens/MisDenuncias/controller_misdenuncias.dart';
// import 'package:movil_denuncias/size_config.dart';

// class MisDenunciasBody extends StatefulWidget {
//   @override
//   _MisDenunciasState createState() => _MisDenunciasState();
// }

// class _MisDenunciasState extends State<MisDenunciasBody> {
//   var denuncias = [];

//   Future<List<dynamic>> getDenuncias() async {
//     try {
//       final result = await buscarDenuncias(context);
//       if (mounted) {
//         setState(() {
//           denuncias = result ?? [];
//         });
//         return denuncias;
//       } else {
//         throw Exception("Widget is not mounted");
//       }
//     } on Exception catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }

//   Map<String, dynamic> _getColorForState(String estado) {
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

//   void showDetailDialog(dynamic denuncia) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(denuncia['tituloDenuncia']),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('Descripción: ${denuncia['descripcion']}'),
//                 Text('Denunciante: ${denuncia['nombreDenunciante']}'),
//                 Text('Estado: ${denuncia['estado']}'),
//                 Text('Categoría: ${denuncia['categoria']}'),
//                 Text('Ubicación: ${denuncia['ubicacion']}'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cerrar'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget mostrarDenuncias() {
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
//                         Icon(Icons.warning, color: Colors.green),
//                         SizedBox(width: 5),
//                         Flexible(
//                           child: Text(
//                             'Contexto:  ${denuncia['tituloDenuncia']}',
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
//                         Flexible(
//                           child: Text(
//                             'Denunciante: ${denuncia['nombreDenunciante']}',
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
//                         Flexible(
//                           child: Text(
//                             'Descripción: ${denuncia['descripcion']}',
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
//                         Flexible(
//                           child: Text(
//                             'Categoría: ${denuncia['categoria']}',
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
//                         Flexible(
//                           child: Text(
//                             'Ubicación: ${denuncia['ubicacion']}',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Icon(Icons.check_circle, color: stateColors['icon']),
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
//           ElevatedButton(
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return FilterModal(
//                     onFilter: (filterValues) {
//                       print(filterValues);
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
//               child: mostrarDenuncias(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ////////////////////////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:movil_denuncias/components/modal.dart';
// import 'package:movil_denuncias/screens/MisDenuncias/controller_misdenuncias.dart';
// import 'package:movil_denuncias/size_config.dart';

// class MisDenunciasBody extends StatefulWidget {
//   @override
//   _MisDenunciasState createState() => _MisDenunciasState();
// }

// class _MisDenunciasState extends State<MisDenunciasBody> {
//   var denuncias = [];

//   Future<List<dynamic>> getDenuncias() async {
//     try {
//       final result = await buscarDenuncias(context);
//       if (mounted) {
//         setState(() {
//           denuncias = result ?? [];
//         });
//         return denuncias;
//       } else {
//         throw Exception("Widget is not mounted");
//       }
//     } on Exception catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }

//   Map<String, dynamic> _getColorForState(String estado) {
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
//                     TextSpan(text: 'Denunciante: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     TextSpan(text: denuncia['nombreDenunciante']),
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
//               RichText(
//                 text: TextSpan(
//                   style: DefaultTextStyle.of(context).style,
//                   children: <TextSpan>[
//                     TextSpan(text: 'Estado: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     TextSpan(text: denuncia['estado']),
//                   ],
//                 ),
//               ),
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

//   Widget mostrarDenuncias() {
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
//           ElevatedButton(
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return FilterModal(
//                     onFilter: (filterValues) {
//                       print(filterValues);
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
//               child: mostrarDenuncias(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

























//////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:movil_denuncias/components/modal.dart';
import 'package:movil_denuncias/screens/MisDenuncias/controller_misdenuncias.dart';
import 'package:movil_denuncias/size_config.dart';

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

// void showDetailDialog(dynamic denuncia) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         //title: Text('Contexto: ${denuncia['tituloDenuncia']}'),
//         title: Text(denuncia['tituloDenuncia'],textAlign: TextAlign.center),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('Denunciante: ${denuncia['nombreDenunciante']}'),
//               Text('Descripción: ${denuncia['descripcion']}'),
//               Text('Categoría: ${denuncia['categoria']}'),
//               Text('Ubicación: ${denuncia['ubicacion']}'),
//               Text('Estado: ${denuncia['estado']}'),
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
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

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
                    TextSpan(text: 'Denunciante: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: denuncia['nombreDenunciante']),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Descripción: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: denuncia['descripcion']),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Categoría: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: denuncia['categoria']),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Ubicación: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: denuncia['ubicacion']),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Estado: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: denuncia['estado']),
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
              Navigator.of(context). pop();
            },
          ),
        ],
      );
    },
  );
}

  Widget mostrarDenuncias() {
    if (denuncias.isNotEmpty) {
      return ListView.builder(
        itemCount: denuncias.length,
        itemBuilder: (context, int index) {
          var denuncia = denuncias[index];
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
                        Icon(Icons.person),
                        SizedBox(width: 5),
                        Text('Denunciante: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Flexible(
                          child: Text(
                            denuncia['nombreDenunciante'],
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
                        //Icon(Icons.check_circle, color: stateColors['icon']),
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
      return Center(child: Text('Aún no hay denuncias'));
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
          // ElevatedButton(
          //   onPressed: () {
          //     // showModalBottomSheet(
          //     //   context: context,
          //     //   builder: (BuildContext context) {
          //     //     return FilterModal(
          //     //       onFilter: (filterValues) {
          //     //         print(filterValues);
          //     //         Navigator.pop(context);
          //     //       },
          //     //     );
          //     //   },
          //     // );
          //   },
          //   child: Text('Filtrar Denuncias'),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
              child: mostrarDenuncias(),
            ),
          ),
        ],
      ),
    );
  }
}






