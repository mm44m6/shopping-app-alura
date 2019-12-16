import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app_alura/widgets/appbar.dart';
import '../modelos/carrinho.dart';

class Carrinho extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomizada(titulo: 'Carrinho', ehPaginaCarrinho: true),
      bottomNavigationBar: 
        Stack(
          children: [
            Container(
              color: Colors.white,
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                Consumer<CarrinhoModel>(
                  builder: (context, carrinho, child) {
                    return Text('${carrinho.precoTotal} reais', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black));
                  }
                ),
              ],),
            ),
          ]
        ),
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
                      Card(
                        clipBehavior: Clip.hardEdge,
                        child: 
                          Row(
                          children: <Widget>[
                            Expanded( 
                              flex: 2,
                              child: Image(image: AssetImage('utils/assets/images/${movelCarrinho['movel']['foto']}'), height: 92, fit: BoxFit.fill,)
                            ),
                            Expanded(
                              flex: 3,
                              child: 
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(movelCarrinho['movel']['titulo'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${movelCarrinho['movel']['preco']} reais', style: TextStyle(fontSize: 14, color: Colors.black)),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () => carrinho.aumentarQuantidade(movelCarrinho),
                                                child: Container(
                                                  margin: EdgeInsets.all(8),
                                                  child: Icon(Icons.add, size: 10, color: Colors.grey)
                                                )
                                              ),
                                              Text('${movelCarrinho['qtd']}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                                              GestureDetector(
                                                onTap: () => carrinho.diminuirQuantidade(movelCarrinho),
                                                child: Container(
                                                  margin: EdgeInsets.all(8),
                                                  child: Icon(Icons.remove, size: 10, color: Colors.grey)
                                                )
                                              ),
                                            ]
                                          )
                                        ]
                                      )
                                    ]
                                  )
                                )
                              )
                            ],
                          )
                        ),
                      Positioned(
                        right: 0,
                        top: 16,
                        child: GestureDetector(
                          onTap: () => carrinho.removerMovel(movelCarrinho),
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
                      )
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
        }}
      ),
    );
  }
}