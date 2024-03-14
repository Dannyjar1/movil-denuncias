import 'package:flutter/material.dart';
import 'package:movil_denuncias/screens/MisDenuncias/components/body.dart';
import 'package:movil_denuncias/screens/VerDenuncias/components/body.dart';

class VerDenuncias extends StatelessWidget {
  static String routName = '/ver_denuncias';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerDenunciasBody(),
    );
  }
}