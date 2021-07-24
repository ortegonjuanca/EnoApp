import 'dart:io';
import 'package:enoapp/ShowFortSaved.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:enoapp/Fort.dart';
import 'package:enoapp/db_enoapp.dart';
import 'package:page_transition/page_transition.dart';

import 'FortWine.dart';
import 'HidrVinegar.dart';
import 'HistHidrVinegar.dart';

void showSnackbar(String text, Color color, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color,
    action: SnackBarAction(
      label: 'Cerrar',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class HistFortWine extends StatefulWidget {

  HistFortWine({Key key}) : super(key: key);

  @override
  _HistFortWineState createState() => _HistFortWineState();
}

class _HistFortWineState extends State<HistFortWine> {

  List<Fort> forts;

  @override
  void initState() {
    loadForts();
    super.initState();
  }

  void loadForts() {
    DBEnoApp.forts().then((value) => forts = value).whenComplete(() => setState((){}));
  }

  Widget buildList() => forts == null
      ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
      itemCount: forts.length,
      itemBuilder: (context, index) {
        final item = forts[index];
        return Dismissible(
            direction: DismissDirection.endToStart,
            key: UniqueKey(),
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: AlignmentDirectional.centerEnd,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            confirmDismiss: (direction) => deleteFort(forts[index].title, context),
            child: Card(
                shadowColor: Colors.black,
                elevation: 25,
                color: Color(0xfff4eea4),
                margin: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  title: Text(forts[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(forts[index].note, maxLines: 1),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xfff4eea4),
                    child: const Icon(Icons.wine_bar_outlined, color: Color(0xff6f0000), size: 30,),
                  ),
                  trailing: Text(forts[index].date),
                  onTap: () {

                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.rightToLeft, child: ShowFortSaved(fort: forts[index])),
                    ).then((val) {
                      if (val == 'updateList') loadForts();
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
        title: Text('Historial Fortificaciones'),
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
                    leading: Icon(Icons.calculate_outlined, color: Color(0xff6f0000)),
                    title: Text('Fortificar Vino', style: TextStyle(fontSize: 15),),
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
                    title: Text('Historial Fortificaciones', style: TextStyle(fontSize: 15),),
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    trailing: Icon(Icons.chevron_right, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Divider(thickness: 1,),
                  ),
                  ListTile(
                    leading: Icon(Icons.calculate_outlined, color: Color(0xff6f0000)),
                    title: Text('Hidratar Vinagre', style: TextStyle(fontSize: 15),),
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
                    title: Text('Historial Hidrataciones', style: TextStyle(fontSize: 15),),
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

Future<bool> deleteFort(String title, BuildContext context) async {

  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: new Text("¿Estás seguro que desea eliminar '$title'?"),
          content: new Text("Esta acción es irreversible"),
          actions: <Widget>[
            TextButton(
              child: const Text('Si', style: TextStyle(color: Colors.blue, fontSize: 18)),
              onPressed: () async {
                await DBEnoApp.deleteFort(title);
                Navigator.of(context).pop(true);

                showSnackbar("'$title' ha sido eliminado correctamente", Colors.green, context);
              },
            ),
            TextButton(
              child: const Text('No', style: TextStyle(color: Colors.red, fontSize: 18),),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        )
    ) ??

        false;
  }

  return showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: new Text("¿Estás seguro que desea eliminar '$title'?"),
        content: new Text("Esta acción es irreversible"),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () async {
              await DBEnoApp.deleteFort(title);
              Navigator.of(context).pop(true);

              showSnackbar("'$title' ha sido eliminado correctamente", Colors.green, context);
            },
            child: Text("Si"),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("No", style: TextStyle(color: Colors.red)),
          )
        ],
      )
  ) ??
      false;
}