import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_alura/modelos/carrinho.dart';

class BarraInferiorCarrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _construirTextoBarraInferiorCarrinho('Total'),
              Consumer<CarrinhoModel>(
                builder: (context, carrinho, child) {
                  return _construirTextoBarraInferiorCarrinho('${carrinho.precoTotal} reais');
                }
              ),
            ],
          ),
        ),
      ]
    );
  }
  
  _construirTextoBarraInferiorCarrinho(texto) {
    return Text(texto, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black));
  }

}