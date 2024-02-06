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
  // print("$urlServicio/getAllDenuncias");
  return http.get(Uri.parse('$urlServicio/denuncias/getDenunciasUser'),headers: {'Authorization': 	 "Bearer ${persona}"});
}


filtrarDenunciasTodos(persona){
  // print("$urlServicio/getAllDenuncias");
  return http.get(Uri.parse('$urlServicio/denuncias/getAllDenuncias/'),headers: {'Authorization': 	 "Bearer ${persona}"});
}
crearLoginFacebook(facebook){
  return http.post(Uri.parse('$urlServicio/crear-login-facebook'), body: json.encode(facebook),headers: headers);
}