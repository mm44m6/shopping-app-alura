import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../modelos/carrinho.dart';
import '../widgets/appbar.dart';

class Detalhes extends StatelessWidget {
  final movel;

  Detalhes(this.movel) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: 
      BoxDecoration(
        image: DecorationImage(
          image: AssetImage("utils/assets/images/${movel['foto']}"), fit: BoxFit.cover)
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustomizada(titulo: '', ehPaginaCarrinho: false),
        body: 
        Align(
          alignment: Alignment.bottomLeft,
          child:
            Container(
              height: 212,
              margin: EdgeInsets.all(16),
              child:  
                _construirCardDetalhes(context),
            )
        )
      )
    );
  }

  _construirCardDetalhes(contexto) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _construirTituloDetalhes(movel['titulo']),
            _construirDescricaoDetalhes(movel['descricao']),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _construirPrecoDetalhes("${movel['preco']} reais"),
                     _construirBotaoComprarDetalhes(contexto)
                  ]
                ),
            )
          ],
      )
    );
  }

  _construirTituloDetalhes(titulo) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      child: Text(titulo, style: TextStyle(fontSize: 20.0, fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.black))
    );
  }

  _construirDescricaoDetalhes(descricao) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Text(descricao, style: TextStyle(fontSize: 12.0, fontFamily: 'Open Sans', color: Color.fromRGBO(83, 83, 83, 1))),
    );
  }

  _construirPrecoDetalhes(preco) {
    return Text(preco, style: TextStyle(fontSize: 20.0, fontFamily: 'Open Sans', fontWeight: FontWeight.bold, color: Colors.black));
  }

  _construirBotaoComprarDetalhes(contexto) {
    return Material(
      color: Color.fromRGBO(178, 155, 178, 0.8),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(60.0)),
      elevation: 5.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(100.0),
          onTap: () => Provider.of<CarrinhoModel>(contexto).adicionarMovel(movel),
          child: Container(
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Text('COMPRAR', style: TextStyle(color: Colors.white, fontSize: 12),),
            ),
          ),
      );
  }
}
