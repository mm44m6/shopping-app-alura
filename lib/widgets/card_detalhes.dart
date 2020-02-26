import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app_alura/modelos/carrinho.dart';
import 'package:shopping_app_alura/modelos/movel.dart';

class CardDetalhes extends StatelessWidget {

  final Movel movel;
  final BuildContext contexto;

  CardDetalhes({this.contexto, this.movel});

  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: "R\$");

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _construirTituloDetalhes(movel.titulo, contexto),
            _construirDescricaoDetalhes(movel.descricao, contexto),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _construirPrecoDetalhes(formatacaoReais.format(movel.preco), contexto),
                     _construirBotaoComprarDetalhes(contexto)
                  ]
                ),
            )
          ],
      )
    );
  }

  _construirTituloDetalhes(String titulo, BuildContext contexto) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      child: Text(titulo, style: Theme.of(contexto).textTheme.title)
    );
  }

  _construirDescricaoDetalhes(String descricao, BuildContext contexto) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Text(descricao)
      );
  }

  _construirPrecoDetalhes(String preco, BuildContext contexto) {
    return Text(preco, style: Theme.of(contexto).textTheme.title);
  }

  _construirBotaoComprarDetalhes(BuildContext contexto) {
    return Material(
      color: Theme.of(contexto).accentColor,
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
              child: Text('COMPRAR', style: Theme.of(contexto).textTheme.button),
          ),
        ),
    );
  }
  
}