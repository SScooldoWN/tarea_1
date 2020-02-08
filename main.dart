import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tarea_1/second_page.dart';
import 'package:tarea_1/third_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Primer Tarea'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _callBackParams1;
  String _callBackParams2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Text(
            "BIENVENIDOS",
            style: TextStyle(
              fontFamily: "SigmarOne",
              fontSize: 48,
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            "assets/images/BAT.jpg",
            height: 200,
          ),
        ),
        Expanded(
          child: Text(
            "Seleccione la accion a realizar: ",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: MaterialButton(
                child: Text(
                  "Pagina 2",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController _textController =
                            TextEditingController();
                        return AlertDialog(
                          title: Text("Ingrese Datos"),
                          content: TextField(
                            controller: _textController,
                            maxLength: 10,
                            decoration: InputDecoration(
                              labelText: "Ingrese palabra",
                            ),
                          ),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancelar")),
                            FlatButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  await Navigator.of(context)
                                      .push(
                                    MaterialPageRoute(
                                      builder: (_) => PageTwo(
                                        textoRecibido: _textController.text,
                                      ),
                                    ),
                                  )
                                      .then(
                                    (response) {
                                      _callBackParams1 = response;
                                    },
                                  );
                                },
                                child: Text("Aceptar")),
                          ],
                        );
                      });
                },
              ),
            ),
            Expanded(
              child: MaterialButton(
                child: Text(
                  "Pagina 3",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () async {
                  TextEditingController _textController =
                      TextEditingController();
                  Navigator.of(context).pop();
                  await Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (_) => PageThree(
                        textoRecibido1: _textController.text,
                      ),
                    ),
                  )
                      .then(
                    (response) {
                      _callBackParams2 = response;
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: Text("Pagina 2 => " + "$_callBackParams1"),
        ),
        Expanded(
          child: Text("Pagina 3 => $_callBackParams2"),
        ),
      ],
    );
  }
}

// Pagina 2

import 'dart:math';
import 'package:flutter/material.dart';

 class PageTwo extends StatefulWidget {
  String textoRecibido;
  TextEditingController _textController = TextEditingController();

  PageTwo({Key key, this.textoRecibido}) : super(key: key);
 
   @override
   _PageTwoState createState() => _PageTwoState();
 }
 
 class _PageTwoState extends State<PageTwo> {
   int numero = 0;
   void _randomG (){
     numero = Random().nextInt(999);
     print("$numero");
   } 
   @override
   Widget build(BuildContext context) {
     return
       Scaffold(
         appBar: AppBar(
          title: Text('Pagina 2'),
        ),
            body: Column(
          children: <Widget>[
            Expanded(
              child: Text("Genere numero random", style: TextStyle(color: Colors.red,
              fontSize: 28)),
              ),
              Expanded(child: Text("$numero")),
            Expanded(child: MaterialButton(child: Text("Generar"), onPressed: () {
               _randomG();
               setState(() {
                 
               });
            })),
            Expanded(child: MaterialButton(child: Text("Guardar"),
             onPressed: () => Navigator.of(context).pop("$numero"),
             ),
             ),
          ],
            ),
       );
   }
 }

//Pagina 3

import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  String textoRecibido1;
  TextEditingController _textController = TextEditingController();

  PageThree({Key key, String textoRecibido1}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Pagina 3'),
        ),
    body: Row(
      children: [Expanded(
        child: MaterialButton(child: Text("Happy"), onPressed: () =>  Navigator.of(context).pop("Happy")), 
        ),
        Expanded(
        child: MaterialButton(child: Text("Sugar"), onPressed: () =>  Navigator.of(context).pop("Sugar")), 
        ),
        Expanded(
        child: MaterialButton(child: Text("Life"), onPressed: () =>  Navigator.of(context).pop("Life")), 
        ),
      ],
    ),
    );
  }
}
