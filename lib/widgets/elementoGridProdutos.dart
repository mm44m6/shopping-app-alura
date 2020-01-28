import 'package:flutter/material.dart';
import 'package:shopping_app_alura/paginas/detalhes.dart';

class ElementoGridProdutos extends StatelessWidget {

  final movel;
  int index;

  ElementoGridProdutos(this.movel, this.index) : super();

  @override
  Widget build(BuildContext context) {
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
          margin: _calcularMarginElemento(index),
            child: 
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                    child: Stack(
                      alignment: Alignment.center,
                        children: <Widget>[
                          _construirImagemElementoGridProdutos('utils/assets/images/${movel['foto']}'),
                          _construirDegradeElementoGridProdutos(),
                          _construirTextoElementoGridProdutos(movel['titulo'])
                          ])
                      )
                    )
                  );
                }

  Widget _construirImagemElementoGridProdutos(imagem) {
    return Positioned.fill(
      child: Image(
        image: AssetImage(imagem),
        fit: BoxFit.cover
      )
    );
  }

  Widget _construirDegradeElementoGridProdutos() {
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

  Widget _construirTextoElementoGridProdutos(texto) {
    return Positioned(
      bottom: 10,
      child: Text(texto, style: TextStyle(fontFamily: 'Alata', color: Colors.white, fontSize: 16))
    );
  }

  EdgeInsetsGeometry _calcularMarginElemento(index) {
    if(index % 2 == 0)  return EdgeInsets.only(left: 25, top: 10, right: 10, bottom: 10);
    return EdgeInsets.only(left: 10, top: 10, right: 25, bottom: 10);
  }

}