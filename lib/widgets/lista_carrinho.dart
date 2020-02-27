import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app_alura/main.dart';
import 'package:shopping_app_alura/modelos/item_carrinho.dart';
import 'package:shopping_app_alura/modelos/movel.dart';
import 'package:shopping_app_alura/widgets/card_produto_carrinho.dart';

class ListaCarrinho extends StatefulWidget {
  final Function atualiza;

  ListaCarrinho(this.atualiza);

  @override
  _ListaCarrinhoState createState() => _ListaCarrinhoState();
}

class _ListaCarrinhoState extends State<ListaCarrinho> {
  final List<ItemCarrinho> carrinho = Inicio.itensCarrinho;

  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: "R\$");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: carrinho.length,
        itemBuilder: (BuildContext context, int index) {
          ItemCarrinho item = carrinho[index];
          Movel movel = item.movel;

          return Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Stack(children: <Widget>[
                CardProdutoCarrinho(
                  imagemProduto: 'utils/assets/images/${movel.foto}',
                  titulo: movel.titulo,
                  precoIndividual: formatacaoReais.format(movel.preco),
                  quantidade: '${item.quantidade}',
                  funcaoAumentarQuantidade: () => _aumentaQuantidade(item),
                  funcaoDiminuirQuantidade: () => _diminuiQuantidade(item),
                ),
                _construirBotaoRemoverMovelCarrinho(
                    () => _removeMovel(item), context)
              ]));
        });
  }

  Widget _construirBotaoRemoverMovelCarrinho(
      Function funcaoRemoverMovel, BuildContext contexto) {
    return Positioned(
        right: 0,
        top: 16,
        child: GestureDetector(
          onTap: funcaoRemoverMovel,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Theme.of(contexto).accentColor),
              width: 20,
              height: 20,
              child: Icon(Icons.close, size: 12, color: Colors.white)),
        ));
  }

  void _aumentaQuantidade(ItemCarrinho item) {
    setState(() {
      item.quantidade++;
      widget.atualiza();
    });
  }

  void _diminuiQuantidade(ItemCarrinho item) {
    setState(() {
      item.quantidade--;
      widget.atualiza();
    });
  }

  _removeMovel(ItemCarrinho item) {
    setState(() {
      carrinho.remove(item);
      widget.atualiza();
    });
  }
}
