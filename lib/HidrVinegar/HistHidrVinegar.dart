import 'dart:io';
import 'package:enoapp/FortWine/HistFortWine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:enoapp/Globals.dart' as globals;

import '../FortWine/FortWine.dart';
import '../main.dart';
import 'Hidr.dart';
import 'HidrVinegar.dart';
import 'ShowHidrSaved.dart';
import '../db_enoapp.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistHidrVinegar extends StatefulWidget {

  HistHidrVinegar({Key key}) : super(key: key);

  @override
  _HistHidrVinegarState createState() => _HistHidrVinegarState();
}

class _HistHidrVinegarState extends State<HistHidrVinegar> {

  List<Hidr> hidrs;

  @override
  void initState() {
    loadHidrs();
    super.initState();
  }

  void loadHidrs() {
    DBEnoApp.hidrs().then((value) => hidrs = value).whenComplete(() => setState((){}));
  }

  Widget buildList() => hidrs == null
      ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6f0000))),)
      : ListView.builder(
      itemCount: hidrs.length,
      itemBuilder: (context, index) {
        return Slidable(
            actionPane: SlidableDrawerActionPane(),
            key: UniqueKey(),
            secondaryActions: <Widget>[
              IconSlideAction(
                  icon: Icons.delete,
                  color: Colors.red,
                  onTap: () async {
                    bool delete = await deleteHidr(hidrs[index].title, context);

                    if(delete == true) {
                      String title = hidrs[index].title;
                      await DBEnoApp.deleteHidr(title);
                      globals.showSnackbar(AppLocalizations.of(context).calculo_eliminado_bbdd(title), Colors.green, context);

                      setState(() {
                        hidrs.removeAt(index);
                      });
                    }
                  }
              ),
            ],
            child: Card(
                shadowColor: Colors.black,
                elevation: 25,
                color: Color(0xfff4eea4),
                margin: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  title: Text(hidrs[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(hidrs[index].note, maxLines: 1),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff4eea4),
                    child: const Icon(Icons.wine_bar_outlined, color: Color(0xff6f0000), size: 30,),
                  ),
                  trailing: Text(hidrs[index].date),
                  onTap: () {

                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.rightToLeft, child: ShowHidrSaved(hidr: hidrs[index])),
                    ).then((val) {
                      if (val == 'updateList') loadHidrs();
                    });

                  },
                )
            )
        );
      });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).historial_hidrataciones),
          backgroundColor: Color(0xff6f0000),
          leading: IconButton (
              icon:Icon(Icons.arrow_back),
              onPressed: () {Navigator.pop(context);}
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: buildList()
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
                      Navigator.pop(context);
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

Future<bool> deleteHidr(String title, BuildContext context) async {
  return await globals.show_dialog_acept_cancel(title, context);
}