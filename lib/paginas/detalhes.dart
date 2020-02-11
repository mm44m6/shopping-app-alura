import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_app_alura/widgets/card_detalhes.dart';
import 'package:shopping_app_alura/widgets/appbar.dart';

class Detalhes extends StatelessWidget {
  final movel;

  Detalhes({this.movel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: 
      BoxDecoration(
        image: DecorationImage(
          image: AssetImage("utils/assets/images/${movel['foto']}"), fit: BoxFit.cover)
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustomizada(titulo: '', ehPaginaCarrinho: false),
        body: 
        Align(
          alignment: Alignment.bottomLeft,
          child:
            Container(
              height: 212,
              margin: EdgeInsets.all(16),
              child:  
                CardDetalhes(contexto: context, movel: movel),
            )
        )
      )
    );
  }
}
