import 'dart:convert';
import 'package:movil_denuncias/constants.dart';
import 'package:http/http.dart' as http;
import 'package:movil_denuncias/models/model_Persona.dart';

apiLogin(data){  
  return http.post(Uri.parse('$urlServicio/auth/login'), body: loginToJson(data),headers: headers);
}
crearPersona(persona){
  return http.post(Uri.parse('$urlServicio/auth/register'), body: userToJson(persona),headers: headers);
}
filtrarDenuncias(persona){
  return http.post(Uri.parse('$urlServicio/filtrar-denuncias'),body: {'id_persona':persona});
}
crearLoginFacebook(facebook){
  return http.post(Uri.parse('$urlServicio/crear-login-facebook'), body: json.encode(facebook),headers: headers);
}