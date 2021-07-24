import 'dart:ui';
import 'package:enoapp/HistFortWine.dart';
import 'package:enoapp/HistHidrVinegar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:enoapp/FortWine.dart';
import 'package:enoapp/HidrVinegar.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Menú Principal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6f0000),
          title: Text(widget.title),
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
            child: Card(
              shadowColor: Colors.black,
              elevation: 25,
              color: Color(0xfff4eea4),
              margin: EdgeInsets.only(top:20, bottom: 20, left: 20, right: 20),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 10, left: 50, right: 50),
                      child: SizedBox(
                        width: 400,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(type: PageTransitionType.rightToLeft, child: FortWine()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff6f0000)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                            ),
                          ),
                          child: const Text("Fortificar Vino", style: TextStyle(fontSize: 18, fontFeatures: [FontFeature.enable('smcp')]),),
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20, left: 50, right: 50),
                    child: SizedBox(
                      width: 400,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(type: PageTransitionType.rightToLeft, child: HistFortWine()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xff6f0000)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                          ),
                        ),
                        child: const Text("Historial Fortificaciones", style: TextStyle(fontSize: 18, fontFeatures: [FontFeature.enable('smcp')]),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(thickness: 1,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10, left: 50, right: 50),
                    child: SizedBox(
                      width: 400,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(type: PageTransitionType.rightToLeft, child: HidrVinegar()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xff6f0000)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                          ),
                        ),
                        child: const Text("Hidratar Vinagre", style: TextStyle(fontSize: 18, fontFeatures: [FontFeature.enable('smcp')]),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40, left: 50, right: 50),
                    child: SizedBox(
                      width: 500,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(type: PageTransitionType.rightToLeft, child: HistHidrVinegar()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xff6f0000)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                          ),
                        ),
                        child: const Text("Historial Hidrataciones", style: TextStyle(fontSize: 18, fontFeatures: [FontFeature.enable('smcp')]),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
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
                            PageTransition(type: PageTransitionType.rightToLeft, child: FortWine())
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
                        Navigator.push(
                            context,
                            PageTransition(type: PageTransitionType.rightToLeft, child: HistFortWine())
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
                      title: Text('Hidratar Vinagre', style: TextStyle(fontSize: 15),),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(type: PageTransitionType.rightToLeft, child: HidrVinegar())
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
                            PageTransition(type: PageTransitionType.rightToLeft, child: HistHidrVinegar())
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