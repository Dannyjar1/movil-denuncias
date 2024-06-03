import 'package:flutter/material.dart';
import 'package:movil_denuncias/screens/MiPerfil/components/body.dart';

class VerPerfil extends StatelessWidget {
  static String routName = '/ver_perfil';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
      ),
      body: VerPerfilBody(),
    );
  }
}