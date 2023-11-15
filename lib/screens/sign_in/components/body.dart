import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movil_denuncias/components/no_account_text.dart';
import 'package:movil_denuncias/components/socal_card.dart';
import 'package:movil_denuncias/models/model_Persona.dart';
import '../../../size_config.dart';
import 'sign_form.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Persona persona = new Persona();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                Image.asset(
                  'assets/images/mi barrio.jpeg',
                  height: getProportionateScreenHeight(150),
                  width: getProportionateScreenWidth(250),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.06),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight! * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      size: Size(45.0, 45.0), press: () {},

                      // press: () async {
                      //   mostrarLoading(context);
                      //   Map facebookprofile = await FacebookAuth.login();
                      //   Map persona = {
                      //     'email':facebookprofile['email'],
                      //     'first_name':facebookprofile['first_name'],
                      //     'last_name':facebookprofile['last_name'],
                      //     'foto':facebookprofile['picture']['data']['url']
                      //   };

                      //   if(facebookprofile != null){

                      //     await enviarFacebook(persona,context);
                      //   }
                      // },
                    ),
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      size: Size(45.0, 45.0),
                      press: () {},
                    )
                    
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset("assets/icons/google-icon.svg"),
      iconSize: 45.0,
      onPressed: () {
        _handleSignInWithGoogle(context);
      },
    );
  }

  Future<void> _handleSignInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // El usuario canceló la operación
        return;
      }

      // Aquí puedes realizar acciones con el usuario de Google, como registrarlo en tu aplicación.
      // Puedes acceder a la información del usuario con googleUser.email, googleUser.displayName, etc.

      // Después de obtener la información que necesitas, puedes redirigir a otra pantalla o realizar otras acciones según tu aplicación.
      // Navigator.pushReplacement(...);
    } catch (error) {
      print("Error al iniciar sesión con Google: $error");
      // Manejar el error según tus necesidades.
    }
  }
}