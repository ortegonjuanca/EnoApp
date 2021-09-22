import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:enoapp/FortWine/Fort.dart';
import 'package:enoapp/db_enoapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../HidrVinegar/HidrVinegar.dart';
import '../main.dart';
import 'HistFortWine.dart';
import '../HidrVinegar/HistHidrVinegar.dart';
import '../MyTextFieldDatePicker.dart';
import 'package:enoapp/Globals.dart' as globals;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var formatter;

TextEditingController _volumen_vino_alcoholizar = TextEditingController();
TextEditingController _grado_vino_alcoholizar = TextEditingController();
TextEditingController _grado_vino_deseado = TextEditingController();
TextEditingController _grado_alcohol_dispone = TextEditingController();

Decimal decimal_volumen_vino_alcoholizar = Decimal.parse("0");
Decimal decimal_grado_vino_alcoholizar = Decimal.parse("0");
Decimal decimal_grado_vino_deseado = Decimal.parse("0");
Decimal decimal_grado_alcohol_dispone = Decimal.parse("0");
Decimal decimal_volumen_alcohol_necesario = Decimal.parse("0");

class FortWine extends StatefulWidget {
  FortWine({Key key}) : super(key: key);

  @override
  _FortWineState createState() => _FortWineState();
}

class _FortWineState extends State<FortWine> {

  var _isVisible;
  Color _colorBottomIcon;

  @override
  initState() {
    super.initState();
    _isVisible = false;
    _colorBottomIcon = Colors.grey;
  }

  @override
  Widget build(BuildContext context) {

    if(AppLocalizations.of(context).language == "Español") {
      formatter = NumberFormat("###,###.0#", "es_ES");
    }
    else{
      formatter = NumberFormat("###,###.0#", "en_EN");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).fortificar_vino),
        backgroundColor: Color(0xff6f0000),
        leading: IconButton (
            icon:Icon(Icons.arrow_back),
            onPressed: () {Navigator.pop(context);}
            ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            tooltip: AppLocalizations.of(context).historial_fortificaciones,
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(type: PageTransitionType.rightToLeft, child: HistFortWine()),
              );
            },
          ),
          new Visibility(
            visible: _isVisible,
            child: IconButton(
              icon: const Icon(Icons.delete_forever),
              tooltip: AppLocalizations.of(context).tooltip_eliminar_calculo,
              onPressed: () {
                setState(() {
                  _isVisible = false;
                  _colorBottomIcon = Colors.grey;
                });
              },
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
            ),
          ),
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    new Visibility(
                        visible: !_isVisible,
                        child: Container(
                          child: new Image.asset(
                            'images/logo.png',
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                    new Visibility(
                      visible: _isVisible,
                      child: Container(
                        width: double.infinity,
                        child: Card(
                          shadowColor: Colors.black,
                          elevation: 25,
                          color: Color(0xfff4eea4),
                          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15),
                                      child: Text(AppLocalizations.of(context).volumen_vino_alcoholizar,
                                        style: TextStyle(fontSize: 16)),
                                    )
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: VerticalDivider(
                                      thickness: 0.5,
                                      color: Colors.grey,
                                    )
                                  ),
                                  Flexible(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15),
                                        child: Text(formatter.format(decimal_volumen_vino_alcoholizar.toDouble()) + " L",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                                    )
                                  )
                                ]
                            )
                          )
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                    ),
                    new Visibility(
                        visible: _isVisible,
                        child: Container(
                            width: double.infinity,
                            child: Card(
                              shadowColor: Colors.black,
                              elevation: 25,
                              color: Color(0xfff4eea4),
                              margin: EdgeInsets.only(left: 20, right: 20),
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                              child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15),
                                          child: Text(AppLocalizations.of(context).grado_vino,
                                              style: TextStyle(fontSize: 16)),
                                        )
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                                          child: VerticalDivider(
                                            thickness: 0.5,
                                            color: Colors.grey,
                                          )
                                      ),
                                      Flexible(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15),
                                            child: Text(formatter.format(decimal_grado_vino_alcoholizar.toDouble()) + "º GL",
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                                          )
                                      )
                                  ]
                              )
                            )
                            )
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                    ),
                    new Visibility(
                        visible: _isVisible,
                        child: Container(
                            width: double.infinity,
                            child: Card(
                                shadowColor: Colors.black,
                                elevation: 25,
                                color: Color(0xfff4eea4),
                                margin: EdgeInsets.only(left: 20, right: 20),
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Flexible(
                                          flex: 3,
                                          child: Padding(
                                              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15),
                                              child: Text(AppLocalizations.of(context).grado_deseado,
                                                  style: TextStyle(fontSize: 16))
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                                            child: VerticalDivider(
                                              thickness: 0.5,
                                              color: Colors.grey,
                                            )
                                        ),
                                        Flexible(
                                            flex: 2,
                                            child: Padding(
                                                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15),
                                                child: Text(formatter.format(decimal_grado_vino_deseado.toDouble()) + "º GL",
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                                              )
                                        )
                                    ]
                                )
                            )
                            )
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                    ),
                    new Visibility(
                        visible: _isVisible,
                        child: Container(
                            width: double.infinity,
                            child: Card(
                                shadowColor: Colors.black,
                                elevation: 25,
                                color: Color(0xfff4eea4),
                                margin: EdgeInsets.only(left: 20, right: 20),
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Flexible(
                                          flex: 3,
                                          child: Padding(
                                              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15),
                                              child: Text(AppLocalizations.of(context).grado_alcohol_dispone,
                                                  style: TextStyle(fontSize: 16,))
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                                            child: VerticalDivider(
                                              thickness: 0.5,
                                              color: Colors.grey,
                                            )
                                        ),
                                        Flexible(
                                            flex: 2,
                                            child: Padding(
                                                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15),
                                                child: Text(formatter.format(decimal_grado_alcohol_dispone.toDouble()) + "º GL",
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                                              )
                                        )
                                    ]
                                )
                            )
                            )
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                    ),
                    new Visibility(
                        visible: _isVisible,
                        child: Container(
                            width: double.infinity,
                            child: Card(
                                shadowColor: Colors.black,
                                elevation: 25,
                                color: Color(0xfff4eea4),
                                margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: IntrinsicHeight(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Flexible(
                                              flex: 3,
                                              child: Padding(
                                                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15),
                                                  child: Text(AppLocalizations.of(context).volumen_alcohol_necesario,
                                                      style: TextStyle(fontSize: 16,))
                                              )
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                                              child: VerticalDivider(
                                                thickness: 0.5,
                                                color: Colors.grey,
                                              )
                                          ),
                                          Flexible(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15),
                                                child: Text(formatter.format(decimal_volumen_alcohol_necesario.toDouble()) + " L",
                                                    style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff6f0000))),
                                              )
                                          )
                                        ]
                                    )
                                )
                            )
                        )
                    ),
                  ]
              ),
            )
        )
      ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xfff4eea4),
          shape: CircularNotchedRectangle(),
          notchMargin: 0,
          child: Row( //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(),
                child: IconButton(
                  icon: Icon(Icons.edit, color: _colorBottomIcon),
                  onPressed: () async {
                    if(_isVisible) {
                      _volumen_vino_alcoholizar.text = decimal_volumen_vino_alcoholizar.toString();
                      _grado_vino_alcoholizar.text = decimal_grado_vino_alcoholizar.toString();
                      _grado_vino_deseado.text = decimal_grado_vino_deseado.toString();
                      _grado_alcohol_dispone.text = decimal_grado_alcohol_dispone.toString();

                      bool is_valid = await Navigator.push(
                        context,
                        PageRouteBuilder<bool>(
                          pageBuilder: (context, animation, secondaryAnimation) => DialogNewCalculation(),
                          fullscreenDialog: true,
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );

                      if(is_valid == null) is_valid = false;

                      if(is_valid){

                        decimal_volumen_alcohol_necesario = decimal_volumen_vino_alcoholizar * ((decimal_grado_vino_deseado - decimal_grado_vino_alcoholizar) / (decimal_grado_alcohol_dispone - decimal_grado_vino_deseado));

                        setState(() {
                          _isVisible = true;
                          _colorBottomIcon = Color(0xff6f0000);
                        });
                      }
                    }
                  },
                  tooltip: AppLocalizations.of(context).tooltip_editar_calculo,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  height: 50,
                  child: VerticalDivider(thickness: 0.5 ,color: Colors.grey)
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: IconButton(
                  icon: Icon(Icons.add, color: Color(0xff6f0000)),
                  onPressed: () async {
                    _volumen_vino_alcoholizar.text = "";
                    _grado_vino_alcoholizar.text = "";
                    _grado_vino_deseado.text = "";
                    _grado_alcohol_dispone.text = "";

                    bool is_valid = await Navigator.push(
                      context,
                      PageRouteBuilder<bool>(
                        pageBuilder: (context, animation, secondaryAnimation) => DialogNewCalculation(),
                        fullscreenDialog: true,
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );

                    if(is_valid == null) is_valid = false;

                    if(is_valid){

                      decimal_volumen_alcohol_necesario = decimal_volumen_vino_alcoholizar * ((decimal_grado_vino_deseado - decimal_grado_vino_alcoholizar) / (decimal_grado_alcohol_dispone - decimal_grado_vino_deseado));

                      setState(() {
                        _isVisible = true;
                        _colorBottomIcon = Color(0xff6f0000);
                      });
                    }
                  },
                  tooltip: AppLocalizations.of(context).tooltip_nuevo_calculo,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  height: 50,
                  child: VerticalDivider(thickness: 0.5 ,color: Colors.grey)
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: IconButton(
                  icon: Icon(Icons.save, color: _colorBottomIcon),
                  onPressed: () async {
                    if(_isVisible) {
                      bool is_valid = await Navigator.push(
                        context,
                        PageRouteBuilder<bool>(
                          pageBuilder: (context, animation, secondaryAnimation) => DialogSave(),
                          fullscreenDialog: true,
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );

                      if (is_valid == null) is_valid = false;

                      if (is_valid) {
                        globals.showSnackbar(
                            AppLocalizations.of(context).calculo_anadido_bbdd,
                            Colors.green, context);
                      }
                    }
                  },
                  tooltip: AppLocalizations.of(context).tooltip_guardar_calculo,
                ),
              ),
            ],
          ),
        ),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color(0xfff4eea4),
            ),
            child: Drawer(
              elevation: 40,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff6f0000),
                    ),
                    child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/logo.png"),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        )
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home_outlined, color: Color(0xff6f0000)),
                    title: Text(AppLocalizations.of(context).appbar_menu, style: TextStyle(fontSize: 15),),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(type: PageTransitionType.rightToLeft, child: MyHomePage()),
                      );
                    },
                    trailing: Icon(Icons.chevron_right, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Divider(thickness: 1,),
                  ),
                  ListTile(
                    leading: Icon(Icons.calculate_outlined, color: Color(0xff6f0000)),
                    title: Text(AppLocalizations.of(context).fortificar_vino, style: TextStyle(fontSize: 15),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    trailing: Icon(Icons.chevron_right, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Divider(thickness: 1,),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today_outlined, color: Color(0xff6f0000)),
                    title: Text(AppLocalizations.of(context).historial_fortificaciones, style: TextStyle(fontSize: 15),),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(type: PageTransitionType.rightToLeft, child: HistFortWine()),
                      );
                    },
                    trailing: Icon(Icons.chevron_right, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Divider(thickness: 1,),
                  ),
                  ListTile(
                    leading: Icon(Icons.calculate_outlined, color: Color(0xff6f0000)),
                    title: Text(AppLocalizations.of(context).hidratar_vinagre, style: TextStyle(fontSize: 15),),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(type: PageTransitionType.rightToLeft, child: HidrVinegar()),
                      );
                    },
                    trailing: Icon(Icons.chevron_right, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Divider(thickness: 1,),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today_outlined, color: Color(0xff6f0000)),
                    title: Text(AppLocalizations.of(context).historial_hidrataciones, style: TextStyle(fontSize: 15),),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(type: PageTransitionType.rightToLeft, child: HistHidrVinegar()),
                      );
                    },
                    trailing: Icon(Icons.chevron_right, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Divider(thickness: 1,),
                  ),
                ],
              ),
            )
        )
    );
  }
}

class DialogNewCalculation extends StatelessWidget {

  bool checkForm(BuildContext context){

    String volumen_vino_alcoholizar = _volumen_vino_alcoholizar.text;
    String grado_vino_alcoholizar = _grado_vino_alcoholizar.text;
    String grado_vino_deseado = _grado_vino_deseado.text;
    String grado_alcohol_dispone = _grado_alcohol_dispone.text;

    if(volumen_vino_alcoholizar.isEmpty){

      globals.showSnackbar(AppLocalizations.of(context).fortificacion_error1, Color(0xff6f0000), context);

      return false;
    }

    if(grado_vino_alcoholizar.isEmpty){

      globals.showSnackbar(AppLocalizations.of(context).fortificacion_error2, Color(0xff6f0000), context);

      return false;
    }

    if(grado_vino_deseado.isEmpty){

      globals.showSnackbar(AppLocalizations.of(context).fortificacion_error3, Color(0xff6f0000), context);

      return false;
    }

    if(grado_alcohol_dispone.isEmpty){

      globals.showSnackbar(AppLocalizations.of(context).fortificacion_error4, Color(0xff6f0000), context);

      return false;
    }

    decimal_volumen_vino_alcoholizar = Decimal.parse(volumen_vino_alcoholizar);
    decimal_grado_vino_alcoholizar = Decimal.parse(grado_vino_alcoholizar);
    decimal_grado_vino_deseado = Decimal.parse(grado_vino_deseado);
    decimal_grado_alcohol_dispone = Decimal.parse(grado_alcohol_dispone);

    if(decimal_volumen_vino_alcoholizar.compareTo(Decimal.parse("0")) == 0){

      globals.showSnackbar(AppLocalizations.of(context).fortificacion_error5, Color(0xff6f0000), context);

      return false;

    }

    if(decimal_grado_vino_alcoholizar.compareTo(decimal_grado_vino_deseado) == 0){

      globals.showSnackbar(AppLocalizations.of(context).fortificacion_error6(decimal_grado_vino_deseado.toString()), Color(0xff6f0000), context);

      return false;

    }

    if(decimal_grado_vino_deseado.compareTo(decimal_grado_vino_alcoholizar) < 0){

      globals.showSnackbar(AppLocalizations.of(context).fortificacion_error7, Color(0xff6f0000), context);

      return false;

    }

    if(decimal_grado_alcohol_dispone.compareTo(decimal_grado_vino_deseado) <= 0){

      globals.showSnackbar(AppLocalizations.of(context).fortificacion_error8, Color(0xff6f0000), context);

      return false;

    }

    return true;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6f0000),
          title: Text(AppLocalizations.of(context).datos_fortificacion),
        ),
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
            ),
          ),
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 40, left: 15, right: 15, top: 15),
                      child: Text(AppLocalizations.of(context).introduce_datos,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontFeatures: [FontFeature.enable('smcp')]))
                  ),
                  Card(
                    shadowColor: Colors.black,
                    elevation: 25,
                    color: Color(0xfff4eea4),
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                  flex: 4,
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 20, bottom: 12, left: 15, right: 6),
                                      child: Text(AppLocalizations.of(context).volumen_vino_alcoholizar,
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                                  )
                              ),
                              Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20, bottom: 12, right: 15, left: 6),
                                    child: TextField(
                                      controller: _volumen_vino_alcoholizar,
                                      onTap: () => _volumen_vino_alcoholizar.selection = TextSelection(baseOffset: 0, extentOffset: _volumen_vino_alcoholizar.value.text.length),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          borderSide: BorderSide(width: 2, color: Color(0xff6f0000)),
                                        ),
                                      ),
                                    ),
                                  )
                              )
                            ]
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                  flex: 4,
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 6),
                                      child: Text(AppLocalizations.of(context).grado_vino,
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                                  )
                              ),
                              Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12, bottom: 12, right: 15, left: 6),
                                    child: TextField(
                                      controller: _grado_vino_alcoholizar,
                                      onTap: () => _grado_vino_alcoholizar.selection = TextSelection(baseOffset: 0, extentOffset: _grado_vino_alcoholizar.value.text.length),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          borderSide: BorderSide(width: 2, color: Color(0xff6f0000)),
                                        ),
                                      ),
                                    ),
                                  )
                              )
                            ]
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                  flex: 4,
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 6),
                                      child: Text(AppLocalizations.of(context).grado_deseado,
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                                  )
                              ),
                              Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12, bottom: 12, right: 15, left: 6),
                                    child: TextField(
                                      controller: _grado_vino_deseado,
                                      onTap: () => _grado_vino_deseado.selection = TextSelection(baseOffset: 0, extentOffset: _grado_vino_deseado.value.text.length),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          borderSide: BorderSide(width: 2, color: Color(0xff6f0000)),
                                        ),
                                      ),
                                    ),
                                  )
                              )
                            ]
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                  flex: 4,
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 6),
                                      child: Text(AppLocalizations.of(context).grado_alcohol_dispone,
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                                  )
                              ),
                              Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12, bottom: 12, right: 15, left: 6),
                                    child: TextField(
                                      controller: _grado_alcohol_dispone,
                                      onTap: () => _grado_alcohol_dispone.selection = TextSelection(baseOffset: 0, extentOffset: _grado_alcohol_dispone.value.text.length),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          borderSide: BorderSide(width: 2, color: Color(0xff6f0000)),
                                        ),
                                      ),
                                    ),
                                  )
                              )
                            ]
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 8),
                            child: SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  bool is_valid = checkForm(context);

                                  if(is_valid){
                                    Navigator.of(context).pop(is_valid);
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0xff6f0000)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                                  ),
                                ),
                                child: Text(AppLocalizations.of(context).calcular, style: TextStyle(fontFeatures: [FontFeature.enable('smcp')]),),
                              ),
                            )
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),
          ),
        )
    );
  }
}


class DialogSave extends StatelessWidget {

  TextEditingController _title = TextEditingController();
  String _day = DateTime.now().day.toString();
  String _month = DateTime.now().month.toString();
  String _year = DateTime.now().year.toString();
  TextEditingController _note = TextEditingController();

  Future<bool> checkForm(BuildContext context) async {

    String title = _title.text.trim();

    if(title.isEmpty){
      globals.showSnackbar(AppLocalizations.of(context).titulo_requerido, Color(0xff6f0000), context);

      return false;
    }
    else{
      bool exist = await DBEnoApp.exist_fort(title);

      if(!exist) return true;

      globals.showSnackbar(AppLocalizations.of(context).fortificacion_existente, Color(0xff6f0000), context);

      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6f0000),
          title: Text(AppLocalizations.of(context).tooltip_guardar_calculo),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 15, right: 15, top: 15),
                        child: Text(AppLocalizations.of(context).introduce_datos,
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic))
                    ),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 25,
                      color: Color(0xfff4eea4),
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 5, left: 15, right: 6),
                              child: Text(
                                  AppLocalizations.of(context).titulo,
                                  style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold))
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
                              child: TextField(
                                controller: _title,
                                onTap: () => _title.selection = TextSelection(baseOffset: 0, extentOffset: _title.value.text.length),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                                cursorColor: Color(0xff6f0000),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(4)),
                                    borderSide: BorderSide(width: 2,
                                        color: Color(0xff6f0000)),
                                  ),
                                ),
                              ),
                            ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 5, left: 15, right: 6),
                              child: Text(
                                  AppLocalizations.of(context).fecha,
                                  style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold))
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
                            child: MyTextFieldDatePicker(
                              labelText: AppLocalizations.of(context).fecha,
                              prefixIcon: Icon(Icons.date_range, color: Color(0xff6f0000),),
                              suffixIcon: Icon(Icons.arrow_drop_down, color: Color(0xff6f0000),),
                              initialDate: DateTime.now(),
                              onDateChanged: (selectedDate) {
                                _day = selectedDate.day.toString();
                                _month = selectedDate.month.toString();
                                _year = selectedDate.year.toString();
                              },
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 5, left: 15, right: 6),
                              child: Text(
                                  AppLocalizations.of(context).observaciones,
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
                            child: TextField(
                              maxLines: 5,
                              controller: _note,
                              style: TextStyle(fontSize: 18),
                              cursorColor: Color(0xff6f0000),
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Color(0xff6f0000)),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(width: 2, color: Color(0xff6f0000)),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 15, top: 8),
                              child: SizedBox(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    bool is_valid = await checkForm(context);

                                    if(is_valid){

                                      if(_day.length == 1){
                                        _day = "0" + _day;
                                      }

                                      if(_month.length == 1){
                                        _month = "0" + _month;
                                      }

                                      if(_year.length == 1){
                                        _year = "000" + _year;
                                      }
                                      else if(_year.length == 2){
                                        _year = "00" + _year;
                                      }
                                      else if(_year.length == 3){
                                        _year = "0" + _year;
                                      }

                                      String date = _day + "/" + _month + "/" + _year;

                                      Fort fort = Fort(
                                        title: _title.text.trim(),
                                        date: date,
                                        note: _note.text,
                                        volumen_vino_alcoholizar: decimal_volumen_vino_alcoholizar.toString(),
                                        grado_vino: decimal_grado_vino_alcoholizar.toString(),
                                        grado_deseado: decimal_grado_vino_deseado.toString(),
                                        grado_alcohol_dispone: decimal_grado_alcohol_dispone.toString(),
                                        volumen_alcohol_necesario: decimal_volumen_alcohol_necesario.toString(),
                                      );

                                      await DBEnoApp.insertFort(fort);

                                      Navigator.of(context).pop(is_valid);
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color(0xff6f0000)),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                                  ),
                                  child: Text(AppLocalizations.of(context).guardar, style: TextStyle(fontFeatures: [FontFeature.enable('smcp')]),),
                                ),
                              )
                          ),
                        ]
                      ),
                    )
                  ],
                )
            ),
          ),
        )
    );
  }
}