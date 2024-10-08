import 'package:movil_denuncias/Services/shared_preferences.dart';
import 'package:movil_denuncias/components/botones.dart';
import 'package:movil_denuncias/screens/Denunciar/denuncia_view.dart';
import 'package:movil_denuncias/screens/MiPerfil/components/body.dart';
import 'package:movil_denuncias/screens/MiPerfil/miperfil_screen.dart';
import 'package:movil_denuncias/screens/MisDenuncias/misdenuncias_screen.dart';
import 'package:movil_denuncias/screens/VerDenuncias/verdenuncias_screen.dart';
import 'package:movil_denuncias/screens/complete_profile/complete_profile_screen.dart';
import 'package:movil_denuncias/screens/otp/otp_screen.dart';
// import 'package:movil_denuncias/screens/profile/profile_screen.dart';
import 'package:movil_denuncias/screens/sign_in/sign_in_screen.dart';
import 'package:movil_denuncias/size_config.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          //ProfilePic(),
          // ProfileMenu(
          //   text: "Mi perfil",
          //   icon: "assets/icons/User Icon.svg",
          //   press: () =>{
          //     // Navigator.pushNamed(context, CompleteProfileScreen.routeName)
          //     Navigator.pushNamed(context, VerPerfil.routName)
          //     },
          // ),
          ProfileMenu(
            text: "Ver Denuncias",
            icon: "assets/icons/location.svg",
            press: () => {
              // Navigator.pushNamed(context, VerDenuncias.routName)
              Navigator.pushNamed(context, VerDenuncias.routName)
            },
          ),
          ProfileMenu(
            text: "Denunciar",
            icon: "assets/icons/denunciar.svg",
            press: () {
              Navigator.pushNamed(context, DenunciaView.routeName);
            },
          ),
          // ProfileMenu(
          //   text: "Ayuda",
          //   icon: "assets/icons/Question mark.svg",
          //   press: () {
          //     Navigator.pushNamed(context,OtpScreen.routeName);
          //   },
          // ),
          ProfileMenu(
            text: "Mis Denuncias",
            icon: "assets/icons/misdenuncias.svg",
            press: () {
              Navigator.pushNamed(context, MisDenuncias.routName);
            },
          ),
          // ProfileMenu(
          //   text: "Cerrar Sesión",
          //   icon: "assets/icons/Log out.svg",
          //   press: () async {
          //     mostrarLoading(context);
          //     await removePerfil();
          //     Navigator.pop(context);
          //     await Navigator.of(context).pushNamedAndRemoveUntil(
          //         SignInScreen.routeName, (Route<dynamic> route) => false);
          //   },
          // ),
          // SizedBox(height: getProportionateScreenHeight(115)),
          // Image.asset(
          //   'assets/images/logo1.png',
          //   height: getProportionateScreenHeight(150),
          //   width: getProportionateScreenWidth(180),
          //   // height: getProportionateScreenHeight(120),
          //   // width: getProportionateScreenWidth(150),
          // ),
          ProfileMenu(
            text: "Cerrar Sesión",
            icon: "assets/icons/Log out.svg",
            press: () async {
              mostrarLoading(context);
              await removePerfil();
              Navigator.pop(context);
              await Navigator.of(context).pushNamedAndRemoveUntil(
                  SignInScreen.routeName, (Route<dynamic> route) => false);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(115)),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/logo1.png',
              height: getProportionateScreenHeight(150),
              width: getProportionateScreenWidth(180),
              // height: getProportionateScreenHeight(120),
              // width: getProportionateScreenWidth(150),
            ),
          ),
        ],
      ),
    );
  }
}
