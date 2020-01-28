import 'package:flutter/material.dart';
import 'package:shopping_app_alura/modelos/carrinho.dart';
import 'package:shopping_app_alura/widgets/cardProdutoCarrinho.dart';

class ListaCarrinho extends StatelessWidget {

  final CarrinhoModel carrinho;

  ListaCarrinho(this.carrinho) : super();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carrinho.tamanhoListaCarrinho,
      itemBuilder: (BuildContext context, int index) {

      Map movelCarrinho = carrinho.moveisCarrinho[index];
      Map movel = carrinho.moveisCarrinho[index]['mivel'];

      return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: 
          Stack(children: <Widget>[
            CardProdutoCarrinho(
              'utils/assets/images/${movel['foto']}', 
              movelCarrinho['movel']['titulo'],
              '${movel['preco']} reais',
              '${movelCarrinho['qtd']}',
              () => carrinho.aumentarQuantidade(movelCarrinho),
              () => carrinho.diminuirQuantidade(movelCarrinho)
            ),
            _construirBtnRemoverMovelCarrinho(() => carrinho.removerMovel(movelCarrinho))
          ]
        )
      );}
    );
  }

  _construirBtnRemoverMovelCarrinho(removerMovelFn) {
    return Positioned(
      right: 0,
      top: 16,
      child: GestureDetector(
        onTap: removerMovelFn,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),  
            color:Color.fromRGBO(178, 155, 178, 1)
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
