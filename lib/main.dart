import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modelos/movel.dart';
import 'paginas/detalhes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> colorBackground = {
      50: Color.fromRGBO(237, 237, 237, .1),
      100: Color.fromRGBO(237, 237, 237, .2),
      200: Color.fromRGBO(237, 237, 237, .3),
      300: Color.fromRGBO(237, 237, 237, .4),
      400: Color.fromRGBO(237, 237, 237, .5),
      500: Color.fromRGBO(237, 237, 237, .6),
      600: Color.fromRGBO(237, 237, 237, .7),
      700: Color.fromRGBO(237, 237, 237, .8),
      800: Color.fromRGBO(237, 237, 237, .9),
      900: Color.fromRGBO(237, 237, 237, 1),
    };

    MaterialColor materialColorBackground =
        MaterialColor(0xFFededed, colorBackground);

    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: materialColorBackground,
        textTheme: TextTheme(
          headline: TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'Alata'),
          title: TextStyle(fontSize: 20.0, fontFamily: 'Alata', color: Colors.white),
          body1: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Open Sans',
              color: Color.fromRGBO(83, 83, 83, 1)),
        ),
      ),
      home: MyHomePage(title: 'Shopping App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  Future<String> loadJson() async {
    return await rootBundle.loadString('utils/data/moveis.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          titleSpacing: 0.0,
          title: Container(
            child: Stack(
              children: <Widget>[
                Center(
                  child:
                      Text(title, style: Theme.of(context).textTheme.headline),
                ),
                Positioned(
                    right: 0,
                    top: 10,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                topLeft: Radius.circular(100)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(178, 155, 178, 0.2),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 0))
                            ]),
                        padding: EdgeInsets.only(right: 30, left: 20),
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: Image(
                          image:
                              AssetImage('utils/assets/icons/shopping_bag.png'),
                          height: 30,
                          fit: BoxFit.fitHeight,
                        )))
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
                child: new Container(
              margin: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: Divider(color: Color.fromRGBO(83, 83, 83, 1)),
            )),
            Text("Produtos", style: Theme.of(context).textTheme.body1),
            Expanded(
                child: new Container(
              margin: const EdgeInsets.only(left: 20.0, right: 30.0),
              child: Divider(color: Color.fromRGBO(83, 83, 83, 1)),
            )),
          ]),
          Flexible(
              child: FutureBuilder(
            future: loadJson(),
            builder: (context, snapshot) {
              Map<String, dynamic> moveis =
                  json.decode(snapshot.data.toString());

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: moveis == null ? 0 : moveis['moveis'].length,
                itemBuilder: (BuildContext context, int index) {
                  Movel movel = Movel.fromJson(moveis['moveis'][index]);
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes(movel: movel))),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(178, 155, 178, 0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 0))
                          ]),
                      margin: index % 2 == 0
                          ? EdgeInsets.only(
                              left: 25, top: 10, right: 10, bottom: 10)
                          : EdgeInsets.only(
                              left: 10, top: 10, right: 25, bottom: 10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned.fill(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image(
                                      image: AssetImage(
                                          'utils/assets/images/${movel.foto}'),
                                      fit: BoxFit.cover))),
                          Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Color.fromRGBO(178, 155, 178, 0.8)
                                      ],
                                    ),
                              )
                            )
                          ),
                           Positioned(
                              bottom: 10,
                              child: Text(movel.titulo,
                                  style: Theme.of(context).textTheme.title))
                        ],
                      )));
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
