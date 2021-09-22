import 'dart:io';
import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:enoapp/Globals.dart' as globals;

import '../FortWine/FortWine.dart';
import '../main.dart';
import 'Hidr.dart';
import 'HidrVinegar.dart';
import '../FortWine/HistFortWine.dart';
import 'HistHidrVinegar.dart';
import '../MyTextFieldDatePicker.dart';
import '../db_enoapp.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var formatter;

class ShowHidrSaved extends StatefulWidget {

  Hidr hidr;

  ShowHidrSaved({Key key, @required this.hidr}) : super(key: key);

  @override
  _ShowHidrSavedState createState() => _ShowHidrSavedState(this.hidr);
}

class _ShowHidrSavedState extends State<ShowHidrSaved> {

  Hidr hidr;
  String note;
  TextAlign textAlign_note;
  Decimal decimal_volumen_vinagre_hidratar = Decimal.parse("0");
  Decimal decimal_grado_vinagre_hidratar = Decimal.parse("0");
  Decimal decimal_grado_vinagre_deseado = Decimal.parse("0");
  Decimal decimal_volumen_agua_necesaria = Decimal.parse("0");

  _ShowHidrSavedState(Hidr hidr){
    this.hidr = hidr;

    decimal_volumen_vinagre_hidratar = Decimal.parse(hidr.volumen_vinagre_hidratar);
    decimal_grado_vinagre_hidratar = Decimal.parse(hidr.grado_vinagre);
    decimal_grado_vinagre_deseado = Decimal.parse(hidr.grado_deseado);
    decimal_volumen_agua_necesaria = Decimal.parse(hidr.volumen_agua_necesaria);
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(AppLocalizations.of(context).language == "Español") {
      formatter = NumberFormat("###,###.0#", "es_ES");
    }
    else{
      formatter = NumberFormat("###,###.0#", "en_EN");
    }

    if(this.hidr.note.isEmpty){
      note = AppLocalizations.of(context).no_observaciones;
      textAlign_note = TextAlign.center;
    }
    else{
      note = this.hidr.note;
      textAlign_note = TextAlign.start;
    }

    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, 'updateList');
          },
        child: Scaffold(
            appBar: AppBar(
                title: Text(this.hidr.date + " - " + this.hidr.title),
                backgroundColor: Color(0xff6f0000),
                leading: IconButton (
                    icon:Icon(Icons.arrow_back),
                    onPressed: () {Navigator.pop(context, 'updateList');}
                ),
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
                              Container(
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
                                                      child: Text(AppLocalizations.of(context).volumen_vinagre_hidratar,
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
                                                      child: Text(formatter.format(decimal_volumen_vinagre_hidratar.toDouble()) + " L",
                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                              ),
                              Container(
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
                                                      child: Text(AppLocalizations.of(context).grado_vinagre,
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
                                                      child: Text(formatter.format(decimal_grado_vinagre_hidratar.toDouble()) + "º Ac",
                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                              ),
                              Container(
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
                                                        child: Text(AppLocalizations.of(context).grado_vinagre_deseado,
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
                                                      child: Text(formatter.format(decimal_grado_vinagre_deseado.toDouble()) + "º Ac",
                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,)),
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                              ),
                              Container(
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
                                                        child: Text(AppLocalizations.of(context).volumen_agua_necesaria,
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
                                                      child: Text(formatter.format(decimal_volumen_agua_necesaria.toDouble()) + " L",
                                                          style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff6f0000))),
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: Divider(thickness: 1,),
                              ),
                              Container(
                                  width: double.infinity,
                                  child: Card(
                                      shadowColor: Colors.black,
                                      elevation: 25,
                                      color: Color(0xfff4eea4),
                                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 15),
                                      shape: ContinuousRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                                        child: Text(note, style: new TextStyle(fontSize: 16,), textAlign: textAlign_note,),
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
                        icon: Icon(Icons.edit, color: Color(0xff6f0000)),
                        onPressed: () async {
                          bool is_valid = await Navigator.push(
                            context,
                            PageRouteBuilder<bool>(
                              pageBuilder: (context, animation, secondaryAnimation) => DialogSave(hidr),
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

                          setState(() {
                            if(this.hidr.note.isEmpty){
                              note = AppLocalizations.of(context).no_observaciones;
                              textAlign_note = TextAlign.center;
                            }
                            else{
                              note = this.hidr.note;
                              textAlign_note = TextAlign.start;
                            }
                          });

                          if(is_valid){
                            globals.showSnackbar(AppLocalizations.of(context).editado_correctamente, Colors.green, context);
                          }
                        },
                        tooltip: AppLocalizations.of(context).tooltip_editar_hidratacion,
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
                        icon: Icon(Icons.delete, color: Color(0xff6f0000)),
                        onPressed: () async {
                          bool delete = await deleteHidr(hidr.title, context);

                          if(delete == true) {
                            String title = hidr.title;
                            await DBEnoApp.deleteHidr(title);
                            globals.showSnackbar(AppLocalizations.of(context).calculo_eliminado_bbdd(title), Colors.green, context);

                            Navigator.pop(context, 'updateList');
                          }
                        },
                        tooltip: AppLocalizations.of(context).tooltip_eliminar_hidratacion,
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
                                    image: AssetImage("assets/images/logo.png"),
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
                            Navigator.push(
                              context,
                              PageTransition(type: PageTransitionType.rightToLeft, child: FortWine()),
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
                          title: Text(AppLocalizations.of(context).historial_fortificaciones, style: TextStyle(fontSize: 15),),
                          onTap: () async {
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
          )
    );
  }
}

Future<bool> deleteHidr(String title, BuildContext context) async {
  return await globals.show_dialog_acept_cancel(title, context);
}

class DialogSave extends StatelessWidget {

  Hidr hidr;

  TextEditingController _title = TextEditingController();
  String original_title;
  String _day = DateTime.now().day.toString();
  String _month = DateTime.now().month.toString();
  String _year = DateTime.now().year.toString();
  TextEditingController _note = TextEditingController();

  DialogSave(Hidr hidr){
    this.hidr = hidr;

    _title.text = hidr.title;
    original_title = hidr.title;
    _note.text = hidr.note;

    String date = hidr.date;

    _day = date.split("/")[0];
    _month = date.split("/")[1];
    _year = date.split("/")[2];
  }

  Future<bool> checkForm(BuildContext context) async {

    String title = _title.text.trim();

    if(title.isEmpty){
      globals.showSnackbar(AppLocalizations.of(context).titulo_requerido, Color(0xff6f0000), context);

      return false;
    }
    else if(original_title != title){

      bool exist = await DBEnoApp.exist_hidr(title);

      if(!exist) return true;

      globals.showSnackbar(AppLocalizations.of(context).hidratacion_existente, Color(0xff6f0000), context);

      return false;
    }

    return true;
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
                              initialDate: DateTime.parse(_year+"-"+_month+"-"+_day),
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

                                      this.hidr.title = _title.text.trim();
                                      this.hidr.date = date;
                                      this.hidr.note = _note.text;

                                      await DBEnoApp.updateHidr(this.hidr, original_title);

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
      ),
    );
  }
}