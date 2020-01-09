import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app_alura/widgets/appbar.dart';
import '../modelos/carrinho.dart';

class Carrinho extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: 'Carrinho', ehPaginaCarrinho: true),
      bottomNavigationBar: _construirBarraInferiorCarrinho(),
        
      body: Consumer<CarrinhoModel>(
          builder: (context, carrinho, child) {
            if (carrinho.tamanhoListaCarrinho > 0) {
              return ListView.builder(
                itemCount: carrinho.tamanhoListaCarrinho,
                itemBuilder: (BuildContext context, int index) {

                  Map movelCarrinho = carrinho.moveisCarrinho[index];

                  return Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    child: 
                    Stack(children: <Widget>[
                      _construirCardCarrinho(
                        'utils/assets/images/${movelCarrinho['movel']['foto']}', 
                        movelCarrinho['movel']['titulo'],
                        '${movelCarrinho['movel']['preco']} reais',
                        '${movelCarrinho['qtd']}',
                        () => carrinho.aumentarQuantidade(movelCarrinho),
                        () => carrinho.diminuirQuantidade(movelCarrinho)
                      ),
                      _construirBtnRemoverMovelCarrinho(() => carrinho.removerMovel(movelCarrinho))
                    ]
                  ));
                },
              );
            } else {
            return Container(
              height: double.infinity,
              alignment: Alignment.topCenter,
              child: Text('Nenhum item no carrinho', textAlign: TextAlign.center,)
            );
          }
        }
      ),
    );
  }

  _construirBarraInferiorCarrinho() {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _construirTextoBarraInferiorCarrinho('Total'),
              Consumer<CarrinhoModel>(
                builder: (context, carrinho, child) {
                  return _construirPrecoTotalCarrinho('${carrinho.precoTotal} reais');
                }
              ),
            ],
          ),
        ),
      ]
    );
  }

  _construirTextoBarraInferiorCarrinho(texto) {
    return Text(texto, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black));
  }

  _construirPrecoTotalCarrinho(precoTotal) {
    return Text(precoTotal, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black));
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