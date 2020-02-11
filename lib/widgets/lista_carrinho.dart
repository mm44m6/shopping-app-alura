import 'package:flutter/material.dart';

import '../tema.dart';
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
            _construirBotaoRemoverMovelCarrinho(() => carrinho.removerMovel(movelCarrinho))
          ]
        )
      );}
    );
  }

  Widget _construirBotaoRemoverMovelCarrinho(Function funcaoRemoverMovel) {
    return Positioned(
      right: 0,
      top: 16,
      child: GestureDetector(
        onTap: funcaoRemoverMovel,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),  
            color: Tema().corDeDetalhes
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
