import 'package:movil_denuncias/screens/MapBox/components/body.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// codigo antiguo 
// class MapaScreen extends StatelessWidget {
//   static String routeName= '/registrar_ubicacion';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BodyMapa(),
//     );
//   }
// }

// codigo nuevo 
class MapaScreen extends StatelessWidget {
  static String routeName = '/registrar_ubicacion';
  final Function(Map) onUbicacionSelected;

  MapaScreen({required this.onUbicacionSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyMapa(
        onUbicacionSelected: onUbicacionSelected,
      ),
    );
  }
}
