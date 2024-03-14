import 'dart:convert';
import 'package:movil_denuncias/Api/api_persona.dart';
import 'package:movil_denuncias/Services/shared_preferences.dart';
import 'package:movil_denuncias/components/botones.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



buscarDenunciasTodas(context) async {
  try {
    String idpersona = await obtenerPerfil();
    http.Response response = await filtrarDenunciasTodas(idpersona);
    print(response.statusCode);
    print(response.body);
    //if (response != null && response.statusCode == 200) {
    if (response.statusCode == 200) {
      var denuncias = json.decode(response.body);
      if (denuncias != null && denuncias['data'] != null) {
        return denuncias['data'];
      }
    }
  } on Exception catch (e) {
    print(e);
    Navigator.pop(context);
    mostrarMensaje('Vuelve a intentarlo', context, 3);
  }
}
