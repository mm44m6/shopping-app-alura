import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shopping_app_alura/modelos/item_carrinho.dart';
import 'package:shopping_app_alura/modelos/movel.dart';

import '../main.dart';

class CardDetalhes extends StatefulWidget {
  final Movel movel;
  final BuildContext contexto;
  final Function atualizaPagina;

  CardDetalhes({this.contexto, this.movel, this.atualizaPagina});

  _CardDetalhesState createState() => _CardDetalhesState();
}

class _CardDetalhesState extends State<CardDetalhes> {
  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: "R\$");

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _construirTituloDetalhes(widget.movel.titulo, widget.contexto),
        _construirDescricaoDetalhes(widget.movel.descricao, widget.contexto),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _construirPrecoDetalhes(
                    formatacaoReais.format(widget.movel.preco), widget.contexto),
                _construirBotaoComprarDetalhes(widget.contexto)
              ]),
        )
      ],
    ));
  }

  _construirTituloDetalhes(String titulo, BuildContext contexto) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
        child: Text(titulo, style: Theme.of(contexto).textTheme.title));
  }

  _construirDescricaoDetalhes(String descricao, BuildContext contexto) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Text(descricao));
  }

  _construirPrecoDetalhes(String preco, BuildContext contexto) {
    return Text(preco, style: Theme.of(contexto).textTheme.title);
  }

  _construirBotaoComprarDetalhes(BuildContext contexto) {
    return Material(
      color: Theme.of(contexto).accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
      elevation: 5.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(100.0),
        onTap: () => _verificarListaItemCarrinho(Inicio.itensCarrinho, ItemCarrinho(widget.movel, 1), contexto),
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

  _verificarListaItemCarrinho(List<ItemCarrinho> lista, ItemCarrinho item, BuildContext contexto) {
    int indexMovel =  lista.indexWhere((item) => item.movel == widget.movel);

    if(indexMovel >= 0) {
      lista[indexMovel].quantidade = lista[indexMovel].quantidade + 1;
    } else {
      _adicionarItemCarrinho(item, contexto);
    }
  }

  _adicionarItemCarrinho(ItemCarrinho item, BuildContext context) {
    widget.atualizaPagina();
    Inicio.itensCarrinho.add(ItemCarrinho(widget.movel, 1));
  }

}
