import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_alura/modelos/carrinho.dart';

class BarraInferiorCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
          height: 60.0,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _construirTextoBarraInferiorCarrinho('Total', context),
              Consumer<CarrinhoModel>(
                builder: (context, carrinho, child) {
                  return _construirTextoBarraInferiorCarrinho("R\$ ${carrinho.precoTotal},00", context);
                }
              ),
            ],
          ),
    );
  }
  
  Widget _construirTextoBarraInferiorCarrinho(String texto, BuildContext contexto) {
    return Text(texto, style: Theme.of(contexto).textTheme.bodyText1);
  }

}