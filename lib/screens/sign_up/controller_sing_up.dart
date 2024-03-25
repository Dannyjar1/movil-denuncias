import 'dart:convert';

import 'package:movil_denuncias/Api/api_persona.dart';
import 'package:movil_denuncias/Services/shared_preferences.dart';
import 'package:movil_denuncias/components/botones.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movil_denuncias/screens/profile/profile_screen.dart';

enviarCuenta(data, context) async {
  try {
    http.Response response = await crearPersona(data);
    Navigator.pop(context);

    var respuestaRegister = json.decode(response.body);
    print(respuestaRegister);

    Navigator.pop(context);
    if (response.statusCode == 200 && respuestaRegister['ok'] == 1) {
      await guardarPerfil(respuestaRegister['identificador']);
      Navigator.popAndPushNamed(context, ProfileScreen.routeName);
    } else {
      mostrarMensaje(respuestaRegister['message'], context, 3);
    }
  } on Exception catch (e) {
    print('Error: $e');
    Navigator.pop(context);
    mostrarMensaje('Vuelve a intentarlo', context, 3);
  }
}
