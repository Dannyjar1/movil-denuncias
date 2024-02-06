//import 'dart:io';
import 'package:movil_denuncias/Services/shared_preferences.dart';
import 'package:movil_denuncias/components/widget_alerts.dart';
import 'package:movil_denuncias/screens/profile/profile_screen.dart';
import 'package:http_parser/http_parser.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:movil_denuncias/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:movil_denuncias/components/botones.dart';

pedirPersmisos() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
  ].request();
  return statuses;
}

enviarDenuncia(Map<String, String> denuncia, List imagenes, context) async {
  try {
    print(imagenes);
    var req = http.MultipartRequest(
        'POST', Uri.parse('$urlServicio/denuncias/nuevaDenuncia'));
    print('$urlServicio/denuncias/nuevaDenuncia');
    req.fields.addAll(denuncia);
    for (var i = 0; i < imagenes.length; i++) {
      req.files.add(await http.MultipartFile.fromPath(
        'evidencia',
        imagenes[i]['imagen'],
        contentType: MediaType('image', imagenes[i]['extension']),
      ));
    }
    req.headers.addAll({
        "Authorization": "Bearer " + await obtenerPerfil(),
    });

    print(req.headers);
    print(req.fields);

    http.StreamedResponse res = await req.send();
    var responseData = await res.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(res.statusCode);
    print(responseString);
    var respuesta = json.decode(responseString);
    Navigator.of(context).pop();
    var message = respuesta['error'] ?? respuesta['message'];
    
    if (respuesta['status'] == "success") {
      await removeObtenerUbicacion();
      alertMessage(context,message: message,  onTap: (){
        Navigator.popAndPushNamed(context, ProfileScreen.routeName);
      });
      

    }
  else{
    mostrarMensaje(message, context, 3);

  }
  } on Exception catch (e) {
    print(e);
    mostrarMensaje('Vuelve a intentarlo', context, 2);
    Navigator.pop(context);
  }
}
