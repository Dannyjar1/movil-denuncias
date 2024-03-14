import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

String session = 'perfil';
String ubicacionDenuncia = 'denuncia';
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

guardarPerfil(String id) async {
  final shared = await _prefs;
  shared.setString(session, id);
}

obtenerPerfil() async {
  final shared = await _prefs;
  print (shared.getString(session));
  return shared.getString(session);
}
removePerfil() async {
  final shared = await _prefs;
  return shared.remove(session);
}

//antiguo 
// guardarUbicacionDenuncia(Map ubicacion) async {
//   final shared = await _prefs;
//   shared.setString(ubicacionDenuncia, json.encode(ubicacion));
// }
// obtenerUbicacionDenuncia() async {
//   final shared = await _prefs;
//   return shared.getString(ubicacionDenuncia);
// }

// nuevo codigo 

guardarUbicacionDenuncia(Map ubicacion) async {
  final shared = await _prefs;
  await shared.setString(ubicacionDenuncia, json.encode(ubicacion));
  // Agregar esta línea para depurar
  print("Ubicación guardada: ${json.encode(ubicacion)}");
}

obtenerUbicacionDenuncia() async {
  final shared = await _prefs;
  var ubicacion = shared.getString(ubicacionDenuncia);
  // Agregar esta línea para depurar
  print("Ubicación obtenida: $ubicacion");
  return ubicacion;
}

removeObtenerUbicacion() async {
  final shared = await _prefs;
  return shared.remove(ubicacionDenuncia);
}
