import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:enoapp/FortWine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import 'Hidr.dart';
import 'HistFortWine.dart';
import 'HistHidrVinegar.dart';
import 'MyTextFieldDatePicker.dart';
import 'db_enoapp.dart';

var formatter = NumberFormat("###,###.0#", "es_ES");

TextEditingController _volumen_vinagre_hidratar = TextEditingController();
TextEditingController _grado_vinagre_hidratar = TextEditingController();
TextEditingController _grado_vinagre_deseado = TextEditingController();

Decimal decimal_volumen_vinagre_hidratar = Decimal.parse("0");
Decimal decimal_grado_vinagre_hidratar = Decimal.parse("0");
Decimal decimal_grado_vinagre_deseado = Decimal.parse("0");
Decimal decimal_volumen_agua_necesaria = Decimal.parse("0");

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

class HidrVinegar extends StatefulWidget {
  HidrVinegar({Key key}) : super(key: key);

  @override
  _HidrVinegarState createState() => _HidrVinegarState();
}

class _HidrVinegarState extends State<HidrVinegar> {

  var _isVisible;

  @override
  initState() {
    super.initState();
    _isVisible = false;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Hidratar Vinagre"),
          backgroundColor: Color(0xff6f0000),
          leading: IconButton (
              icon:Icon(Icons.arrow_back),
              onPressed: () {Navigator.pop(context);}
          ),
          actions: <Widget>[
            new Visibility(
              visible: _isVisible,
              child: IconButton(
                icon: const Icon(Icons.delete_forever),
                tooltip: 'Eliminar cálculo',
                onPressed: () {
                  setState(() {
                    _isVisible = false;
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
                                                      child: Text("Volumen de vinagre que se desea hidratar (litros)",
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
                                                    child: Text(formatter.format(decimal_volumen_vinagre_hidratar.toDouble()) + " litros",
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
                                                    child: Text("Grado del vinagre a hidratar (% Vol)",
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
                                                    child: Text(formatter.format(decimal_grado_vinagre_hidratar.toDouble()) + "º",
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
                                                    child: Text("Grado del vinagre que se desea (% Vol)",
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
                                                    child: Text(formatter.format(decimal_grado_vinagre_deseado.toDouble()) + "º",
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
                          padding: const EdgeInsets.all(10),
                        ),
                        new Visibility(
                            visible: _isVisible,
                            child: Container(
                                width: double.infinity,
                                child: Card(
                                    shadowColor: Colors.black,
                                    elevation: 25,
                                    color: Color(0xfff4eea4),
                                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 40),
                                    shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                                      child: RichText(
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(
                                              style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                              ),
                                              children: <TextSpan>[
                                                new TextSpan(text: "El volumen de agua a añadir para obtener un vinagre de " + formatter.format(decimal_grado_vinagre_deseado.toDouble()) + "º es de "),
                                                new TextSpan(text: formatter.format(decimal_volumen_agua_necesaria.toDouble()) + " litros", style: new TextStyle(fontWeight: FontWeight.bold, color: Color(0xff6f0000))),
                                              ]
                                          )
                                      ),
                                    )
                                )
                            )
                        ),
                      ]
                  ),
                )
            )
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Stack(
            children: <Widget>[
              new Visibility(
                  visible: _isVisible,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () async {

                        _volumen_vinagre_hidratar.text = decimal_volumen_vinagre_hidratar.toString();
                        _grado_vinagre_hidratar.text = decimal_grado_vinagre_hidratar.toString();
                        _grado_vinagre_deseado.text = decimal_grado_vinagre_deseado.toString();

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

                          decimal_volumen_agua_necesaria = ((decimal_volumen_vinagre_hidratar * decimal_grado_vinagre_hidratar) / decimal_grado_vinagre_deseado) - decimal_volumen_vinagre_hidratar;

                          setState(() {
                            _isVisible = true;
                          });
                        }
                      },
                      child: const Icon(Icons.edit),
                      backgroundColor: Color(0xff6f0000),
                      tooltip: "Editar valores",
                    ),
                  )
              ),
              new Visibility(
                  visible: _isVisible,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FloatingActionButton(
                        heroTag: null,
                        onPressed: () async {
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

                          if(is_valid == null) is_valid = false;

                          if(is_valid){
                            showSnackbar("El cálculo se ha añadido a la base de datos correctamente", Colors.green, context);
                          }
                        },
                        child: const Icon(Icons.save),
                        backgroundColor: Color(0xff6f0000),
                        tooltip: "Guardar cálculo",
                      )
                  )
              ),
              new Visibility(
                  visible: true,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () async {

                        _volumen_vinagre_hidratar.text = "";
                        _grado_vinagre_hidratar.text = "";
                        _grado_vinagre_deseado.text = "";

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

                          decimal_volumen_agua_necesaria = ((decimal_volumen_vinagre_hidratar * decimal_grado_vinagre_hidratar) / decimal_grado_vinagre_deseado) - decimal_volumen_vinagre_hidratar;

                          setState(() {
                            _isVisible = true;
                          });
                        }
                      },
                      child: const Icon(Icons.add),
                      backgroundColor: Color(0xff6f0000),
                      tooltip: "Nuevo cálculo",
                    ),
                  )
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
                    title: Text('Hidratar Vinagre', style: TextStyle(fontSize: 15),),
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

class DialogNewCalculation extends StatelessWidget {

  bool checkForm(BuildContext context){

    String volumen_vinagre_hidratar = _volumen_vinagre_hidratar.text;
    String grado_vinagre_hidratar = _grado_vinagre_hidratar.text;
    String grado_vinagre_deseado = _grado_vinagre_deseado.text;

    if(volumen_vinagre_hidratar.isEmpty){

      showSnackbar('El valor del volumen de vinagre a hidratar es requerido', Color(0xff6f0000), context);

      return false;
    }

    if(grado_vinagre_hidratar.isEmpty){

      showSnackbar('El valor del grado del vinagre a hidratar es requerido', Color(0xff6f0000), context);

      return false;
    }

    if(grado_vinagre_deseado.isEmpty){

      showSnackbar('El valor del grado del vinagre que se desea es requerido', Color(0xff6f0000), context);

      return false;
    }

    decimal_volumen_vinagre_hidratar = Decimal.parse(volumen_vinagre_hidratar);
    decimal_grado_vinagre_hidratar = Decimal.parse(grado_vinagre_hidratar);
    decimal_grado_vinagre_deseado = Decimal.parse(grado_vinagre_deseado);

    if(decimal_volumen_vinagre_hidratar.compareTo(Decimal.parse("0")) == 0){

      showSnackbar('El valor del volumen de vinagre a hidratar debe ser un número entero mayor que 0', Color(0xff6f0000), context);

      return false;

    }

    if(decimal_grado_vinagre_deseado.compareTo(Decimal.parse("0")) == 0){

      showSnackbar('El valor del grado acético de vinagre deseado debe ser un número entero mayor que 0', Color(0xff6f0000), context);

      return false;

    }

    if(decimal_grado_vinagre_hidratar.compareTo(decimal_grado_vinagre_deseado) == 0){

      showSnackbar('Ya tiene el vinagre a $decimal_grado_vinagre_deseadoº. No debe añadir nada', Color(0xff6f0000), context);

      return false;

    }

    if(decimal_grado_vinagre_deseado.compareTo(decimal_grado_vinagre_hidratar) > 0){

      showSnackbar('El grado acético deseado no puede ser mayor que el grado del vinagre a hidratar', Color(0xff6f0000), context);

      return false;

    }

    return true;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6f0000),
          title: Text('Datos de la Hidratación'),
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
                        child: Text("INTRODUCE LOS SIGUIENTES DATOS",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontFeatures: [FontFeature.enable('smcp')]))
                    ),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 25,
                      color: Color(0xfff4eea4),
                      margin: EdgeInsets.only(left: 20, right: 20),
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
                                        child: Text("Volumen de vinagre que se desea hidratar (litros)",
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                                    )
                                ),
                                Flexible(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20, bottom: 12, right: 15, left: 6),
                                      child: TextField(
                                        controller: _volumen_vinagre_hidratar,
                                        onTap: () => _volumen_vinagre_hidratar.selection = TextSelection(baseOffset: 0, extentOffset: _volumen_vinagre_hidratar.value.text.length),
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
                                        child: Text("Grado del vinagre a hidratar (% Vol)",
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                                    )
                                ),
                                Flexible(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 15, left: 6),
                                      child: TextField(
                                        controller: _grado_vinagre_hidratar,
                                        onTap: () => _grado_vinagre_hidratar.selection = TextSelection(baseOffset: 0, extentOffset: _grado_vinagre_hidratar.value.text.length),
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
                                        child: Text("Grado del vinagre que se desea (% Vol)",
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                                    )
                                ),
                                Flexible(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 15, left: 6),
                                      child: TextField(
                                        controller: _grado_vinagre_deseado,
                                        onTap: () => _grado_vinagre_deseado.selection = TextSelection(baseOffset: 0, extentOffset: _grado_vinagre_deseado.value.text.length),
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
                                  child: const Text("Calcular", style: TextStyle(fontFeatures: [FontFeature.enable('smcp')]),),
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
      showSnackbar("El título es requerido", Color(0xff6f0000), context);

      return false;
    }
    else{
      bool exist = await DBEnoApp.exist_hidr(title);

      if(!exist) return true;

      showSnackbar("Ya existe una hidratación con ese título", Color(0xff6f0000), context);

      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6f0000),
          title: Text('Guardar Cálculo'),
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
                            bottom: 20, left: 15, right: 15, top: 20),
                        child: Text("INTRODUCE LOS SIGUIENTES DATOS",
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic))
                    ),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 25,
                      color: Color(0xfff4eea4),
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 5, left: 15, right: 6),
                                child: Text(
                                    "Título",
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
                                    "Fecha",
                                    style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold))
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 10, right: 15, left: 15),
                              child: MyTextFieldDatePicker(
                                labelText: "Fecha",
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
                                    "Observaciones",
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

                                        if(_month.length == 1){
                                          _month = "0" + _month;
                                        }

                                        String date = _day + "/" + _month + "/" + _year;

                                        Hidr hidr = Hidr(
                                          title: _title.text.trim(),
                                          date: date,
                                          note: _note.text,
                                          volumen_vinagre_hidratar: decimal_volumen_vinagre_hidratar.toString(),
                                          grado_vinagre: decimal_grado_vinagre_hidratar.toString(),
                                          grado_deseado: decimal_grado_vinagre_deseado.toString(),
                                          volumen_agua_necesaria: decimal_volumen_agua_necesaria.toString(),
                                        );

                                        await DBEnoApp.insertHidr(hidr);

                                        Navigator.of(context).pop(is_valid);
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0xff6f0000)),
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                                    ),
                                    child: const Text("Guardar", style: TextStyle(fontFeatures: [FontFeature.enable('smcp')]),),
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