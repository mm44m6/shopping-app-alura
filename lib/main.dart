import 'package:flutter/material.dart';

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
            headline: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'Alata'),
            title: TextStyle(fontSize: 20.0, fontFamily: 'Alata', color: Colors.white),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Open Sans', color: Color.fromRGBO(83, 83, 83, 1)),
          ),
        ),
        home: MyHomePage('Shopping App'),
    );
  }
}

class MyHomePage extends StatelessWidget {

  MyHomePage(this.title) : super();

  final String title;

  List moveis = [
    {
        "titulo": "Mesa",
        "preco": "300",
        "foto": "furniture1.jpeg",
        "descricao": ""
    },
    {
        "titulo": "Cadeira",
        "preco": "120",
        "foto": "furniture2.jpg",
        "descricao": ""
    },
    {
        "titulo": "Manta",
        "preco": "200",
        "foto": "furniture3.jpg",
        "descricao": ""
    },
    {
        "titulo": "Sofá Cinza",
        "preco": "800",
        "foto": "furniture4.jpg",
        "descricao": ""
    },
    {
        "titulo": "Criado Mudo",
        "preco": "400",
        "foto": "furniture5.jpg",
        "descricao": ""
    },
    {
        "titulo": "Jogo de Cama",
        "preco": "250",
        "foto": "furniture6.jpg",
        "descricao": ""
    },
    {
        "titulo": "Sofá Branco",
        "preco": "900",
        "foto": "furniture7.jpg",
        "descricao": ""
    }
  ];

  @override
  Widget build(BuildContext context) {
    criarAppBar() {
      return AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Container(
              padding: EdgeInsets.only(right: 30, left: 20),
              height: 40,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  topLeft: Radius.circular(100)),
                  color: Colors.white,
                ),
              child: Image(
                image: AssetImage('utils/assets/icons/shopping_bag.png'),
                height: 30,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
        title: Text(title, style: Theme.of(context).textTheme.headline)
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: criarAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: new Container(
                margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                child: Divider(color: Color.fromRGBO(83, 83, 83, 1)),
              )
            ),
            Text("Produtos", style: Theme.of(context).textTheme.body1),
            Expanded(
                child: new Container(
              margin: const EdgeInsets.only(left: 20.0, right: 30.0),
              child: Divider(color: Color.fromRGBO(83, 83, 83, 1)),
            )),
          ]),
          Flexible(
            child: 
              GridView.builder(
                gridDelegate: 
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                  ),
                itemCount: this.moveis == null ? 0 : moveis.length,
                itemBuilder: (BuildContext context, int index) {
                
                final movel = moveis[index];

                return InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes(movel))),
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(178, 155, 178, 0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0)
                        )
                      ]
                    ),
                    margin: index % 2 == 0
                      ? EdgeInsets.only(
                        left: 25, top: 10, right: 10, bottom: 10)
                      : EdgeInsets.only(
                        left: 10, top: 10, right: 25, bottom: 10),
                    child: 
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                          child: Stack(
                           alignment: Alignment.center,
                           children: <Widget>[
                            Positioned.fill(
                             child: Image(
                                image: AssetImage(
                                  'utils/assets/images/${movel['foto']}'),
                                  fit: BoxFit.cover
                              )
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
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
                              child: Text(
                                movel['titulo'],
                                style: 
                                Theme.of(context).textTheme.title
                              )
                            )
                          ])
                      )
                    )
                  );
                },
              )
          )
        ],
      ),
    );
  }
}
