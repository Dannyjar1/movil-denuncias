// import 'package:flutter/material.dart';
// //import 'package:movil_denuncias/components/botones.dart';
// import 'package:movil_denuncias/components/custom_surfix_icon.dart';
// import 'package:movil_denuncias/components/widget_btn.dart';
// import 'package:movil_denuncias/components/form_error.dart';
// import 'package:movil_denuncias/helper/keyboard.dart';
// import 'package:movil_denuncias/models/model_Persona.dart';
// //import 'package:movil_denuncias/screens/complete_profile/complete_profile_screen.dart';
// import 'package:movil_denuncias/screens/sign_up/controller_sing_up.dart';

// import '../../../constants.dart';
// import '../../../size_config.dart';

// class SignUpForm extends StatefulWidget {
//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   final _formKey = GlobalKey<FormState>();
//   var _persona = Persona();
//   bool remember = false;
//   final List<String> errors = [];

//   void addError({String? error}) {
//     if (!errors.contains(error!)) {
//       setState(() {
//         errors.add(error);
//       });
//     }
//   }

//   void removeError({String? error}) {
//     if (errors.contains(error)) {
//       setState(() {
//         errors.remove(error!);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           buildFirstNameFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildLastNameFormField(),
//           // SizedBox(height: getProportionateScreenHeight(30)),
//           // buildCedulaFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildCellFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildEmailFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildPasswordFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
          
//           SizedBox(height: getProportionateScreenHeight(30)),
//           FormError(errors: errors),
//           SizedBox(height: getProportionateScreenHeight(40)),
//           BtnC(
//             title: "Continuar",
//             onTap: () {
//               if (_formKey.currentState!.validate()) {
//                 _formKey.currentState?.save();
//                 KeyboardUtil.hideKeyboard(context);
//                 enviarCuenta(_persona, context);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   TextFormField buildPasswordFormField() {
//     return TextFormField(
//       obscureText: true,
//       onSaved: (newValue) => _persona.password = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kPassNullError);
//         } else if (value.length >= 8) {
//           removeError(error: kShortPassError);
//         }
//         _persona.password = value;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kPassNullError);
//           return "";
//         } else if (value.length < 8) {
//           addError(error: kShortPassError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Contraseña",
//         hintText: "Ingresa la contraseña",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
//       ),
//     );
//   }

//   TextFormField buildEmailFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => _persona.email = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         } else if (emailValidatorRegExp.hasMatch(value)) {
//           removeError(error: kInvalidEmailError);
//         }
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         } else if (!emailValidatorRegExp.hasMatch(value)) {
//           addError(error: kInvalidEmailError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Correo",
//         hintText: "Ingresa tu correo",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
//       ),
//     );
//   }

//   TextFormField buildFirstNameFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => _persona.firstName = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         }
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Nombre",
//         hintText: "Ingresa tus nombres",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//       ),
//     );
//   }

//   TextFormField buildLastNameFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => _persona.lastName = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         }
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Apellidos",
//         hintText: "Ingresa tus apellidos",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//       ),
//     );
//   }

//   TextFormField buildCellFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => _persona.cellPhone = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         }
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Telefono",
//         hintText: "Ingresa tu telefono",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
//       ),
//     );
//   }

//   // TextFormField buildCedulaFormField() {
//   //   return TextFormField(
//   //     keyboardType: TextInputType.emailAddress,
//   //     onSaved: (newValue) => _persona.lastName = newValue!,
//   //     onChanged: (value) {
//   //       if (value.isNotEmpty) {
//   //         removeError(error: kEmailNullError);
//   //       }
//   //     },
//   //     validator: (value) {
//   //       if (value!.isEmpty) {
//   //         addError(error: kEmailNullError);
//   //         return "";
//   //       }
//   //       return null;
//   //     },
//   //     decoration: InputDecoration(
//   //       labelText: "Cedula",
//   //       hintText: "Ingresa tu cedula",
//   //       floatingLabelBehavior: FloatingLabelBehavior.always,
//   //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/IDIcon.svg"),
//   //     ),
//   //   );
//   // }
// }








// import 'package:flutter/material.dart';
// //import 'package:movil_denuncias/components/botones.dart';
// import 'package:movil_denuncias/components/custom_surfix_icon.dart';
// import 'package:movil_denuncias/components/widget_btn.dart';
// import 'package:movil_denuncias/components/form_error.dart';
// import 'package:movil_denuncias/helper/keyboard.dart';
// import 'package:movil_denuncias/models/model_Persona.dart';
// //import 'package:movil_denuncias/screens/complete_profile/complete_profile_screen.dart';
// import 'package:movil_denuncias/screens/sign_up/controller_sing_up.dart';

// import '../../../constants.dart';
// import '../../../size_config.dart';

// class SignUpForm extends StatefulWidget {
//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   final _formKey = GlobalKey<FormState>();
//   var _persona = Persona();
//   bool remember = false;
//   final List<String> errors = [];

//   void addError({String? error}) {
//     if (!errors.contains(error!)) {
//       setState(() {
//         errors.add(error);
//       });
//     }
//   }

//   void removeError({String? error}) {
//     if (errors.contains(error)) {
//       setState(() {
//         errors.remove(error!);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           buildFirstNameFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildLastNameFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           // buildCedulaFormField(),
//           //SizedBox(height: getProportionateScreenHeight(30)),
//           buildCellFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildEmailFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildPasswordFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           FormError(errors: errors),
//           SizedBox(height: getProportionateScreenHeight(40)),
//           BtnC(
//             title: "Continuar",
//             onTap: () {
//               if (_formKey.currentState!.validate()) {
//                 _formKey.currentState?.save();
//                 KeyboardUtil.hideKeyboard(context);
//                 enviarCuenta(_persona, context);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   TextFormField buildPasswordFormField() {
//     return TextFormField(
//       obscureText: true,
//       onSaved: (newValue) => _persona.password = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kPassNullError);
//         } else if (value.length >= 8) {
//           removeError(error: kShortPassError);
//         }
//         _persona.password = value;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kPassNullError);
//           return "";
//         } else if (value.length < 8) {
//           addError(error: kShortPassError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Contraseña",
//         hintText: "Ingresa la contraseña",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
//       ),
//     );
//   }

//   TextFormField buildEmailFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => _persona.email = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         } else if (emailValidatorRegExp.hasMatch(value)) {
//           removeError(error: kInvalidEmailError);
//         }
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         } else if (!emailValidatorRegExp.hasMatch(value)) {
//           addError(error: kInvalidEmailError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Correo",
//         hintText: "Ingresa tu correo",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
//       ),
//     );
//   }

//   TextFormField buildFirstNameFormField() {
//     return TextFormField(
//       onSaved: (newValue) => _persona.firstName = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         }
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Nombre",
//         hintText: "Ingresa tus nombres",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//       ),
//     );
//   }

//   TextFormField buildLastNameFormField() {
//     return TextFormField(
//       onSaved: (newValue) => _persona.lastName = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         }
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Apellidos",
//         hintText: "Ingresa tus apellidos",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//       ),
//     );
//   }

//   TextFormField buildCellFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.phone,
//       onSaved: (newValue) => _persona.cellPhone = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         }
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Telefono",
//         hintText: "Ingresa tu telefono",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
//       ),
//     );
//   }

//   // TextFormField buildCedulaFormField() {
//   //   return TextFormField(
//   //     keyboardType: TextInputType.emailAddress,
//   //     onSaved: (newValue) => _persona.lastName = newValue!,
//   //     onChanged: (value) {
//   //       if (value.isNotEmpty) {
//   //         removeError(error: kEmailNullError);
//   //       }
//   //     },
//   //     validator: (value) {
//   //       if (value!.isEmpty) {
//   //         addError(error: kEmailNullError);
//   //         return "";
//   //       }
//   //       return null;
//   //     },
//   //     decoration: InputDecoration(
//   //       labelText: "Cedula",
//   //       hintText: "Ingresa tu cedula",
//   //       floatingLabelBehavior: FloatingLabelBehavior.always,
//   //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/IDIcon.svg"),
//   //     ),
//   //   );
//   // }
// }








import 'package:flutter/material.dart';
//import 'package:movil_denuncias/components/botones.dart';
import 'package:movil_denuncias/components/custom_surfix_icon.dart';
import 'package:movil_denuncias/components/widget_btn.dart';
import 'package:movil_denuncias/components/form_error.dart';
import 'package:movil_denuncias/helper/keyboard.dart';
import 'package:movil_denuncias/models/model_Persona.dart';
//import 'package:movil_denuncias/screens/complete_profile/complete_profile_screen.dart';
import 'package:movil_denuncias/screens/sign_up/controller_sing_up.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _persona = Persona();
  bool remember = false;
  final List<String> errors = [];
  String? cellPhone;
  String? email;
  String? photo;
  String? password;
  String? nombreCompleto;
  String? cedula;

  void addError({String? error}) {
    if (!errors.contains(error!)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNombreCompletoFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCedulaFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildCellFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          BtnC(
            title: "Continuar",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                KeyboardUtil.hideKeyboard(context);
                enviarCuenta(_persona, context);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _persona.password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        _persona.password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: "Ingresa la contraseña",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _persona.email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Correo",
        hintText: "Ingresa tu correo",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildNombreCompletoFormField() {
    return TextFormField(
      onSaved: (newValue) => _persona.nombreCompleto = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nombres Completos",
        hintText: "Ingresa tus nombres",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildCellFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => _persona.numTelefono = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Telefono",
        hintText: "Ingresa tu telefono",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildCedulaFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => _persona.cedula = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Cedula",
        hintText: "Ingresa tu cedula",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/IDIcon.svg"),
      ),
    );
  }
}