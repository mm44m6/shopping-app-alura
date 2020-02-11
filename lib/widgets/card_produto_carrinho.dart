import 'package:flutter/material.dart';

class CardProdutoCarrinho extends StatelessWidget {

  final String imagemProduto;
  final String titulo;
  final String precoIndividual;
  final String quantidade;
  final Function funcaoAumentarQuantidade;
  final Function funcaoDiminuirQuantidade;

  CardProdutoCarrinho({this.imagemProduto, 
    this.titulo, 
    this.precoIndividual, 
    this.quantidade, 
    this.funcaoAumentarQuantidade, 
    this.funcaoDiminuirQuantidade}
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: 
        Row(
          children: <Widget>[
            _construirColunaImagemCarrinho(this.imagemProduto),
            _construirColunaInfosCarrinho(titulo, precoIndividual, quantidade, funcaoAumentarQuantidade, funcaoDiminuirQuantidade)
          ],
        )
    );
  }

  Widget _construirColunaImagemCarrinho(String imagem) {
    return Expanded( 
      flex: 2,
      child: Image(image: AssetImage(imagem), height: 92, fit: BoxFit.fill)
    );
  }

  Widget _construirColunaInfosCarrinho(
      String titulo,
      String precoIndividual,
      String quantidade,
      Function funcaoAumentarQuantidade,
      Function funcaoDiminuirQuantidade) {
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
                  _construirLinhaQuantidadeCarrinho(quantidade, funcaoAumentarQuantidade, funcaoDiminuirQuantidade)
                ]
              )
            ]
          )
        )
      );
  }

  Widget _construirTituloMovelCarrinho(String titulo) {
    return Text(titulo, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black));
  }

  Widget _construirPrecoIndividualCarrinho(String precoIndividual) {
    return Text(precoIndividual, style: TextStyle(fontSize: 14, color: Colors.black));
  }

  Widget _construirLinhaQuantidadeCarrinho(String quantidade, Function funcaoAumentarQuantidade, Function funcaoDiminuirQuantidade) {
    return Row(
      children: [
        _construirBotoesLinhaQuantidadeCarrinho(funcaoAumentarQuantidade, Icons.add),
        Text(quantidade, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
        _construirBotoesLinhaQuantidadeCarrinho(funcaoDiminuirQuantidade, Icons.remove)
      ]
    );
  }

  Widget _construirBotoesLinhaQuantidadeCarrinho(fn, icone) {
    return GestureDetector(
      onTap: fn,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Icon(icone, size: 10, color: Colors.grey)
      )
    );
  }

  
}