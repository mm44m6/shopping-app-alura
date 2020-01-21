import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app_alura/widgets/appbar.dart';
import 'package:shopping_app_alura/widgets/barraInferiorCarrinho.dart';
import 'package:shopping_app_alura/widgets/listaCarrinho.dart';
import '../modelos/carrinho.dart';

class Carrinho extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: 'Carrinho', ehPaginaCarrinho: true),
      bottomNavigationBar: BarraInferiorCarrinho(),
        
      body: Consumer<CarrinhoModel>(
          builder: (context, carrinho, child) {
            if (carrinho.tamanhoListaCarrinho > 0) {
              return ListaCarrinho(carrinho);
            } else {
            return Container(
              height: double.infinity,
              alignment: Alignment.topCenter,
              child: Text('Nenhum item no carrinho', textAlign: TextAlign.center,)
            );
          }
        }
      ),
    );}

 
}