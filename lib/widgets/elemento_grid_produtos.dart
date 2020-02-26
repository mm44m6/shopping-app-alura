import 'package:flutter/material.dart';
import 'package:shopping_app_alura/modelos/movel.dart';

import 'package:shopping_app_alura/paginas/detalhes.dart';

class ElementoGridProdutos extends StatelessWidget {

  final Movel movel;
  final int index;

  ElementoGridProdutos({this.movel, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes(movel: movel))),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).accentColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 0)
              )
            ]
          ),
          margin: _calcularMarginElemento(index),
            child: 
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                    child: Stack(
                      alignment: Alignment.center,
                        children: <Widget>[
                          _construirImagemElementoGridProdutos('utils/assets/images/${movel.foto}'),
                          _construirDegradeElementoGridProdutos(context),
                          _construirTextoElementoGridProdutos(movel.titulo, context)
                          ])
                      )
                    )
                  );
                }

  Widget _construirImagemElementoGridProdutos(String imagem) {
    return Positioned.fill(
      child: Image(
        image: AssetImage(imagem),
        fit: BoxFit.cover
      )
    );
  }

  Widget _construirDegradeElementoGridProdutos(BuildContext contexto) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Theme.of(contexto).accentColor.withOpacity(0.8)
            ],
          ),
        )
      )
    );
  }

  Widget _construirTextoElementoGridProdutos(String texto, BuildContext contexto) {
    return Positioned(
      bottom: 10,
      child: Text(texto, style: Theme.of(contexto).textTheme.headline6)
    );
  }

  EdgeInsetsGeometry _calcularMarginElemento(int index) {
    if(index % 2 == 0)  return EdgeInsets.only(left: 25, top: 10, right: 10, bottom: 10);
    return EdgeInsets.only(left: 10, top: 10, right: 25, bottom: 10);
  }

}