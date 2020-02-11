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
            _construirColunaInfosCarrinho(titulo,
                precoIndividual,
                quantidade,
                funcaoAumentarQuantidade,
                funcaoDiminuirQuantidade,
                context
            )
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
      Function funcaoDiminuirQuantidade,
      BuildContext contexto) {
    return Expanded(
      flex: 3,
      child: 
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _construirTituloMovelCarrinho(titulo, contexto),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _construirPrecoIndividualCarrinho(precoIndividual, contexto),
                  _construirLinhaQuantidadeCarrinho(quantidade, funcaoAumentarQuantidade, funcaoDiminuirQuantidade, contexto)
                ]
              )
            ]
          )
        )
      );
  }

  Widget _construirTituloMovelCarrinho(String titulo, BuildContext contexto) {
    return Text(titulo, style: Theme.of(contexto).textTheme.headline2);
  }

  Widget _construirPrecoIndividualCarrinho(String precoIndividual, BuildContext contexto) {
    return Text(precoIndividual, style: Theme.of(contexto).textTheme.headline5);
  }

  Widget _construirLinhaQuantidadeCarrinho(
      String quantidade,
      Function funcaoAumentarQuantidade,
      Function funcaoDiminuirQuantidade,
      BuildContext contexto
      ) {
    return Row(
      children: [
        _construirBotoesLinhaQuantidadeCarrinho(funcaoAumentarQuantidade, Icons.add),
        Text(quantidade, style: Theme.of(contexto).textTheme.bodyText2),
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