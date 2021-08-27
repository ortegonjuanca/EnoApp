library enoapp.globals;

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showSnackbar(String text, Color color, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color,
    action: SnackBarAction(
      label: AppLocalizations.of(context).snackbar_cerrar,
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Future<bool> show_dialog_acept_cancel(String title, BuildContext context){

  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: new Text(AppLocalizations.of(context).seguro_eliminar(title)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children : <Widget>[
              Expanded(
                child: Text(
                  AppLocalizations.of(context).accion_irreversible,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 50,
          backgroundColor: Colors.white,
          actions: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                      ),
                    ),
                    child: Text(AppLocalizations.of(context).cancelar, style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                      ),
                    ),
                    child: Text(AppLocalizations.of(context).aceptar, style: TextStyle(fontSize: 18)),
                  ),
                ]
            )
          ],
        )
    ) ??

        false;
  }
  else {
    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            CupertinoAlertDialog(
              title: new Text(AppLocalizations.of(context).seguro_eliminar(title)),
              content: new Text(AppLocalizations.of(context).accion_irreversible),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () async {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(AppLocalizations.of(context).cancelar, style: TextStyle(color: Colors.red)),
                ),
                CupertinoDialogAction(
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(AppLocalizations.of(context).aceptar),
                ),
              ],
            )
    ) ??
        false;
  }
}