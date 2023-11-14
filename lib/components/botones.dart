//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movil_denuncias/components/widget_alerts.dart';
//import 'package:toast/toast.dart';

import '../constants.dart';

mostrarLoading(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(strokeWidth: 1, valueColor: colorLoading),
        Container(margin: EdgeInsets.only(left: 5), child: Text("Cargando...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

mostrarMensaje(String msg, context, int duracion) {
  alertMessage(
    context,
    message: msg,
    barrierDismissible: true,
    isActions: true,
  );
  //return Toast.show(msg, duration: duracion);
}
