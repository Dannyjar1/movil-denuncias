import 'package:flutter/material.dart';
import 'package:movil_denuncias/size_config.dart';

//const kPrimaryColor = Color(4282079640);
const kPrimaryColor= Color(0xFF23A338);
const kPrimaryLightColor = Color(0xFFFFECDF);
const colorapp = 4282079640;
int imagenesPermitidas = 1;
String ipServicio = '172.208.72.155';
int puertoServicio = 3085;
String urlServicio = 'http://$ipServicio:$puertoServicio';
//String urlServicio = 'https://api-denuncias.herokuapp.com/api-denuncias';
//String urlServicio ='https://0066-45-164-66-53.ngrok-free.app';
var headers = { 'content-type': 'application/json', 'auth' : 'Authorization' };
var headers2 = {'content-type': 'multipart/form-data'};

final colorLoading = AlwaysStoppedAnimation<Color>(Color(colorapp));
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF23A338), Color(0xFF23A338)],
  // colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
//const kTextColor = Color.fromARGB(255, 0, 0, 0);
const kTextColor = Color(0xFF757575);
//const kTextColor =  Color(0xFF23A338);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Ingresa tu correo";
const String kInvalidEmailError = "Ingresa un correo valido";
const String kPassNullError = "Ingresa tu contraseña";
const String kShortPassError = "La contraseña es demasiado corta";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Ingresa tu nombre";
const String kPhoneNumberNullError = "Ingresa tu número de teléfono";
const String kAddressNullError = "Ingresa tu ubicación";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}