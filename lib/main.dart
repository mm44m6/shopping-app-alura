import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/appbar.dart';
import 'modelos/movel.dart';
import 'paginas/detalhes.dart';
import 'paginas/carrinho.dart';

void main() => runApp(
  ChangeNotifierProvider(
      create: (context) => CarrinhoModel(),
      child: MyApp(),
  )
);

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
        initialRoute: '/',
        routes: {
          '/': (context) => Home('Shopping App'),
          '/carrinho': (context) => Carrinho(),
       },
        title: 'Shopping App',
        theme: ThemeData(
          backgroundColor: materialColorBackground,
        ),
    );
  }
}

class Home extends StatelessWidget {

  Home(this.titulo) : super();

  final String titulo;

  final List moveis = [
    {
        "titulo": "Mesa",
        "preco": 300,
        "foto": "furniture1.jpeg",
        "descricao": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
        "titulo": "Cadeira",
        "preco": 120,
        "foto": "furniture2.jpg",
        "descricao": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
        "titulo": "Manta",
        "preco": 200,
        "foto": "furniture3.jpg",
        "descricao": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
        "titulo": "Sofá Cinza",
        "preco": 800,
        "foto": "furniture4.jpg",
        "descricao": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
        "titulo": "Criado Mudo",
        "preco": 400,
        "foto": "furniture5.jpg",
        "descricao": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
        "titulo": "Jogo de Cama",
        "preco": 250,
        "foto": "furniture6.jpg",
        "descricao": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
        "titulo": "Sofá Branco",
        "preco": 900,
        "foto": "furniture7.jpg",
        "descricao": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    }
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarCustomizada(titulo: titulo, ehPaginaCarrinho: false),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _construirSeparador(),
          Flexible(
            child: _construirGridProdutos(),
          )
        ],
      ),
    );
  }

  _construirGridProdutos() {
    return GridView.builder(
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
                          _construirImagemGridProdutos('utils/assets/images/${movel['foto']}'),
                          _construirDegradeGridProdutos(),
                          _construirTextoGridProdutos(movel['titulo'])
                          ])
                      )
                    )
                  );
                },
              );
  }

  _construirImagemGridProdutos(imagem) {
    return Positioned.fill(
      child: Image(
        image: AssetImage(imagem),
        fit: BoxFit.cover
      )
    );
  }

  _construirDegradeGridProdutos() {
    return Positioned.fill(
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
    );
  }

  _construirTextoGridProdutos(texto) {
    return Positioned(
      bottom: 10,
      child: Text(texto, style: TextStyle(fontFamily: 'Alata', color: Colors.white, fontSize: 16))
    );
  }

  _construirSeparador() {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 30.0, right: 20.0),
          child: Divider(color: Color.fromRGBO(83, 83, 83, 1)),
        )
      ),
      Text("Produtos", style: TextStyle(fontFamily: 'Open Sans')),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 30.0),
            child: Divider(color: Color.fromRGBO(83, 83, 83, 1)),
          )
        ),
      ]
    );
  }

}
