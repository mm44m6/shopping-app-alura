import 'package:flutter/material.dart';

class CardProdutoCarrinho extends StatelessWidget {

  final String imagemProduto;
  final String titulo;
  final String precoIndividual;
  final String qtd;
  final Function aumentarQtdFn;
  final Function diminuirQtdFn;

  CardProdutoCarrinho(this.imagemProduto, this.titulo, this.precoIndividual, this.qtd, this.aumentarQtdFn, this.diminuirQtdFn) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: 
        Row(
          children: <Widget>[
            _construirColunaImagemCarrinho(this.imagemProduto),
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

  
}