import 'package:flutter/material.dart';
import 'package:shopping_app_alura/modelos/carrinho.dart';

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
            _construirCardCarrinho(
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

  _construirCardCarrinho(imagem, titulo, precoIndividual, qtd, aumentarQtdFn, diminuirQtdFn) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: 
        Row(
          children: <Widget>[
            _construirColunaImagemCarrinho(imagem),
            _construirColunaInfosCarrinho(titulo, precoIndividual, qtd, aumentarQtdFn, diminuirQtdFn)
          ],
        )
    );
  }

  _construirColunaImagemCarrinho(imagem) {
    return Expanded( 
      flex: 2,
      child: Image(image: AssetImage(imagem), height: 92, fit: BoxFit.fill)
    );
  }

  _construirColunaInfosCarrinho(titulo, precoIndividual, qtd, aumentarQtdFn, diminuirQtdFn) {
    return Expanded(
      flex: 3,
      child: 
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _construirTituloMovelCarrinho(titulo),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _construirPrecoIndividualCarrinho(precoIndividual),
                  _construirLinhaQuantidadeCarrinho(qtd, aumentarQtdFn, diminuirQtdFn)
                ]
              )
            ]
          )
        )
      );
  }

  _construirTituloMovelCarrinho(titulo) {
    return Text(titulo, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black));
  }

  _construirPrecoIndividualCarrinho(precoIndividual) {
    return Text(precoIndividual, style: TextStyle(fontSize: 14, color: Colors.black));
  }

  _construirLinhaQuantidadeCarrinho(qtd, aumentarQtdFn, diminuirQtdFn) {
    return Row(
      children: [
        _construirBtnsLinhaQuantidadeCarrinho(aumentarQtdFn, Icons.add),
        Text(qtd, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
        _construirBtnsLinhaQuantidadeCarrinho(diminuirQtdFn, Icons.remove)
      ]
    );
  }

  _construirBtnsLinhaQuantidadeCarrinho(fn, icone) {
    return GestureDetector(
      onTap: fn,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Icon(icone, size: 10, color: Colors.grey)
      )
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
