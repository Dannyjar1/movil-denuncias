import 'package:flutter/material.dart';
import 'package:movil_denuncias/components/widget_btn.dart';

alertMessage(
  BuildContext context, {
  String? message,
  String? title,
  String? image,
  Widget? imageHeader,
  String? titleBtnAgree,
  String? titleBtnCancel,
  bool barrierDismissible = false,
  bool isActions = false,
  Color borderColor = Colors.transparent,
  Function? onTap,
  bool isOnWillPop = true,
  Function? onTapCancel,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          if (onTap != null && isOnWillPop) {
            onTap();
          } else {
            Navigator.pop(context);
          }
          return false;
        },
        child: AlertDialog(
          contentPadding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: borderColor,
              width: 2.5,
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  imageHeader ?? Container(),
                  if (title != null) ...[
                    Container(
                      alignment: Alignment.center,
                      child: Text(title),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                  if (message != null) ...[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ),
                  ],
                  if (image != null) ...[
                    const SizedBox(height: 20.0),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(image, height: 100.0),
                    ),
                  ],
                  if (!isActions) ...[
                    const SizedBox(height: 20.0),
                    Container(
                      margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                      alignment: Alignment.center,
                      child: BtnC(
                        title: titleBtnAgree ?? 'Aceptar',
                        onTap: () {
                          if (onTap == null) {
                            Navigator.pop(context);
                          } else {
                            onTap();
                          }
                        },
                      ),
                    ),
                    if (titleBtnCancel != null) ...[
                      const SizedBox(height: 20.0),
                      Container(
                        margin: const EdgeInsets.only(right: 15.0, left: 15.0),
                        child: BtnC(
                        title: titleBtnCancel,
                          onTap: () {
                            if (onTapCancel == null) {
                              Navigator.pop(context);
                            } else {
                              onTapCancel();
                            }
                          },
                        ),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.end,
          actions: !isActions
              ? []
              : [
                  if (titleBtnCancel != null) ...[
                    BtnText(
                      titleBtnCancel,
                      onTap: () {
                        if (onTapCancel == null) {
                          Navigator.pop(context);
                        } else {
                          onTapCancel();
                        }
                      },
                    ),
                  ],
                  BtnText(
                    titleBtnAgree ?? 'Aceptar',
                    onTap: () {
                      if (onTap == null) {
                        Navigator.pop(context);
                      } else {
                        onTap();
                      }
                    },
                  ),
                ],
        ),
      );
    },
  );
}

alertChild(
  BuildContext context, {
  bool barrierDismissible = true,
  Widget? child,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: child ?? Container(),
          ),
        ),
      );
    },
  );
}