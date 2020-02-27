import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_alura/main.dart';

import 'package:shopping_app_alura/widgets/appbar.dart';
import 'package:shopping_app_alura/widgets/barra_inferior_carrinho.dart';
import 'package:shopping_app_alura/widgets/lista_carrinho.dart';
import '../modelos/carrinho.dart';

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {

    int valor = _calculaTotal();

    return Scaffold(
        appBar: AppBarCustomizada(titulo: 'Carrinho', ehPaginaCarrinho: true),
        bottomNavigationBar: BarraInferiorCarrinho(valor),
        body: _constroiTela()
//      Consumer<CarrinhoModel>(
//          builder: (context, carrinho, child) {
//            if (carrinho.tamanhoListaCarrinho > 0) {
//              return ListaCarrinho();
//            } else {
//            return Container(
//              height: double.infinity,
//              alignment: Alignment.topCenter,
//              child: Text('Nenhum item no carrinho', textAlign: TextAlign.center,)
//            );
//          }
//        }
//      ),
        );
  }

  int _calculaTotal() {
    if(Inicio.itensCarrinho.isNotEmpty){
      return Inicio.itensCarrinho
          .map((item) => item.movel.preco * item.quantidade)
          .reduce((precoAtual, precoNovo) => precoAtual + precoNovo);
    }
    return 0;
  }

  Widget _constroiTela() {
    if (Inicio.itensCarrinho.isNotEmpty) {
      return ListaCarrinho(() => setState(() {}));
    } else {
      return Container(
          height: double.infinity,
          alignment: Alignment.topCenter,
          child: Text(
            'Nenhum item no carrinho',
            textAlign: TextAlign.center,
          ));
    }
  }
}
