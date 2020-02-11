import 'package:flutter/material.dart';

import '../paleta_cores.dart';
import 'package:shopping_app_alura/modelos/carrinho.dart';
import 'package:shopping_app_alura/widgets/card_produto_carrinho.dart';

class ListaCarrinho extends StatelessWidget {

  final CarrinhoModel carrinho;

  ListaCarrinho({this.carrinho});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carrinho.tamanhoListaCarrinho,
      itemBuilder: (BuildContext context, int index) {

      Map movelCarrinho = carrinho.moveisCarrinho[index];
      Map movel = carrinho.moveisCarrinho[index]['movel'];

      return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: 
          Stack(children: <Widget>[
            CardProdutoCarrinho(
              imagemProduto: 'utils/assets/images/${movel['foto']}', 
              titulo: movelCarrinho['movel']['titulo'],
              precoIndividual: '${movel['preco']} reais',
              quantidade: '${movelCarrinho['quantidade']}',
              funcaoAumentarQuantidade: () => carrinho.aumentarQuantidade(movelCarrinho),
              funcaoDiminuirQuantidade: () => carrinho.diminuirQuantidade(movelCarrinho)
            ),
            _construirBotaoRemoverMovelCarrinho(() => carrinho.removerMovel(movelCarrinho), context)
          ]
        )
      );}
    );
  }

  Widget _construirBotaoRemoverMovelCarrinho(Function funcaoRemoverMovel, BuildContext contexto) {
    return Positioned(
      right: 0,
      top: 16,
      child: GestureDetector(
        onTap: funcaoRemoverMovel,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),  
            color: Theme.of(contexto).accentColor
          ),
          width: 20,
          height: 20,
          child: Icon(
            Icons.close, 
            size: 12, 
            color: Colors.white
          )
        ),
      )
    );
  }
}
