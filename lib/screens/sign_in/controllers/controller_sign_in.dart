import 'dart:convert';

import 'package:movil_denuncias/Api/api_persona.dart';
import 'package:movil_denuncias/Services/shared_preferences.dart';
import 'package:movil_denuncias/components/botones.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movil_denuncias/screens/profile/profile_screen.dart';

enviarLogin(data, context) async {
  try {
    http.Response response = await apiLogin(data);
    var respuestaLogin = json.decode(response.body);
    Navigator.pop(context);
    
    if (response.statusCode == 200 && respuestaLogin['code'] == 200 && respuestaLogin['data'] != null) {
      await guardarPerfil(respuestaLogin['data']["token"]);
      Navigator.popAndPushNamed(context, ProfileScreen.routeName);
    } else {
      // Mostrar mensaje de error usando el campo 'message' del backend
      mostrarMensaje(respuestaLogin['message'] ?? "Error desconocido", context, 3);
    }
  } on Exception catch (e) {
    print(e);
    Navigator.pop(context);
    mostrarMensaje('Vuelve a intentarlo', context, 3);
  }
}
// enviarFacebook(data,context) async {
//   try {
//     http.Response response = await crearLoginFacebook(data);
//     var respuestaLogin = json.decode(response.body);
//     Navigator.pop(context);
//     if(response.statusCode == 200 && respuestaLogin['ok'] == 1){
//       await guardarPerfil(respuestaLogin['identificador']);
//       Navigator.popAndPushNamed(context, ProfileScreen.routeName);
//     } 
//     else{
//       mostrarMensaje(respuestaLogin['mensaje'], context, 3);
//     }
//   } on Exception catch (e) {
//     print(e);
//     Navigator.pop(context);
//     mostrarMensaje('Vuelve a intentarlo', context, 3);
//   }
// }