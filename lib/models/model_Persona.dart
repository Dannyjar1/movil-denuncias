// import 'dart:convert';

// Persona userFromJson(String str) => Persona.fromJson(json.decode(str));

// String userToJson(Persona data) => json.encode(data.toJson());
 
// Persona loginFromJson(String str) => Persona.fromJson(json.decode(str));

// String loginToJson(Login data) => json.encode(data.toJson());
// class Persona {
//   String? password;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? photo;
//   int? type;
//   String? nombreCompleto;  // Campo agregado

//   Persona({this.password, this.email, this.firstName, this.lastName, this.photo, this.type}) {
//     // Calcular y asignar nombreCompleto al momento de crear la instancia
//     nombreCompleto = '${firstName ?? ""} ${lastName ?? ""}'.trim();
//   }

//   factory Persona.fromJson(Map<String, dynamic> json) => Persona(
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         password: json["password"],
//         email: json["email"],
//         photo: json["photo"],
//         // No es necesario asignar nombreCompleto aquí ya que se asignará en el constructor
//       );

//   Map<String, dynamic> toJson() => {
//         "first_name": firstName,
//         "last_name": lastName,
//         "nombre_completo": nombreCompleto, // Agregar el nombre completo al JSON
//         "password": password,
//         "email": email,
//         "photo": photo
//       };
// }

// class Login{

//   String? password;
//   String? email;
//   Login({this.password,this.email});
  
//   factory Login.fromJson(Map<String, dynamic> json) => Login(
//         email:  json['email'],
//         password: json["password"],
//       );

//   Map<String, dynamic> toJson() => {
//         "email":email,
//         "password": password,
//       };
// }




// import 'dart:convert';

// Persona userFromJson(String str) => Persona.fromJson(json.decode(str));

// String userToJson(Persona data) => json.encode(data.toJson());
// Persona loginFromJson(String str) => Persona.fromJson(json.decode(str));

// String loginToJson(Login data) => json.encode(data.toJson());
// class Persona{

//   String? password;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? photo;
//   String? cellPhone;
//   int? type;
//   Persona({this.password,this.email,this.firstName,this.lastName,this.photo,this.type,this.cellPhone});

//  //String get nombreCompleto => '${firstName ?? ""} ${lastName ?? ""}'.trim();
  
//   factory Persona.fromJson(Map<String, dynamic> json) => Persona(
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         password: json["password"],
//         email: json["email"],
//         photo: json['photo'],
//         cellPhone: json["cell_phone"]
//       );

//   Map<String, dynamic> toJson() => {
//         "first_name": firstName,
//         "last_name": lastName,
//         "password": password,
//         "email": email,
//         "photo": photo,
//         "cell_phone": cellPhone
//       };
// }

// class Login{

//   String? password;
//   String? email;
//   Login({this.password,this.email});
  
//   factory Login.fromJson(Map<String, dynamic> json) => Login(
//         email:  json['email'],
//         password: json["password"],
//       );

//   Map<String, dynamic> toJson() => {
//         "email":email,
//         "password": password,
//       };
// }




import 'dart:convert';

Persona userFromJson(String str) => Persona.fromJson(json.decode(str));

String userToJson(Persona data) => json.encode(data.toJson());
Persona loginFromJson(String str) => Persona.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());
class Persona{

  String? password;
  String? email;
  String? photo;
  String? numTelefono ;
  String? nombreCompleto;
  String? cedula;
  int? type;
  Persona({this.password,this.email,this.photo,this.type,this.numTelefono, this.cedula,this.nombreCompleto});

 //String get nombreCompleto => '${firstName ?? ""} ${lastName ?? ""}'.trim();
  
factory Persona.fromJson(Map<String, dynamic> json) => Persona(
      password: json["password"],
      email: json["email"],
      photo: json['photo'],
      numTelefono: json["cell_phone"],
      nombreCompleto: json["nombreCompleto"],
      cedula: json ["cedula"]
    );

Map<String, dynamic> toJson() => {
    "nombreCompleto": nombreCompleto,
    "cedula": cedula,
    "numTelefono": numTelefono,
    "email": email,
    "password": password
};
}

class Login{

  String? password;
  String? email;
  Login({this.password,this.email});
  
  factory Login.fromJson(Map<String, dynamic> json) => Login(
        email:  json['email'],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email":email,
        "password": password,
      };
}