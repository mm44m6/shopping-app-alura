import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_alura/main.dart';

import 'package:shopping_app_alura/modelos/carrinho.dart';

class BotaoCarrinho extends StatelessWidget {

  final BuildContext contexto;

  BotaoCarrinho({this.contexto});
  
  @override
  Widget build(BuildContext context) {
       return GestureDetector(
         onTap: () {
           Navigator.pushNamed(contexto, '/carrinho');
         },
         child: Padding(
           padding: const EdgeInsets.symmetric(
             vertical: 8.0,
           ),
         child: Container(
           padding: EdgeInsets.only(right: 30, left: 20),
           height: 40,
           alignment: Alignment.centerRight,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(100),
               topLeft: Radius.circular(100)
             ),
           ),
           child: 
             constroiBotao(context)
//             Consumer<CarrinhoModel>(
//               builder: (context, carrinho, child) {
//                 if (carrinho.tamanhoListaCarrinho > 0) {
//                   return Stack(
//                     alignment: Alignment.center,
//                       children: <Widget>[
//                         _construirImagemBotaoCarrinhoAppBar('utils/assets/icons/shopping_bag.png'), 
//                         _construirIndicatorBotaoCarrinhoAppBar(context)
//                       ]
//                   );
//                 }
//                 return _construirImagemBotaoCarrinhoAppBar('utils/assets/icons/shopping_bag.png');
//               }
             )
           ),
         );
     }

  Widget constroiBotao(BuildContext context) {
    if(Inicio.itensCarrinho.length > 0){
      return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _construirImagemBotaoCarrinhoAppBar('utils/assets/icons/shopping_bag.png'),
            _construirIndicatorBotaoCarrinhoAppBar(context)
          ]
      );
    }
    return _construirImagemBotaoCarrinhoAppBar('utils/assets/icons/shopping_bag.png');
  }

     _construirIndicatorBotaoCarrinhoAppBar(BuildContext contexto) {
       return Positioned(
         right: 0,
         bottom: 0,
         child: Container(
           width: 10,
           height: 10,
           decoration: BoxDecoration(
             color: Theme.of(contexto).accentColor,
             shape: BoxShape.circle
           ),
         )
       );
     }

     _construirImagemBotaoCarrinhoAppBar(String imagem) {
       return Image(
         image: AssetImage(imagem),
         height: 30,
         fit: BoxFit.fitHeight
       );
     }

} 