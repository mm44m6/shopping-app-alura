import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modelos/carrinho.dart';

class AppBarCustomizada extends StatelessWidget with PreferredSizeWidget {

final String titulo;
final bool ehPaginaCarrinho;

AppBarCustomizada({this.titulo, this.ehPaginaCarrinho}): super();

@override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
@override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo, style: TextStyle(fontFamily: 'Open Sans', color: Colors.black)),
      titleSpacing: 0.0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      actions: <Widget>[
        this.ehPaginaCarrinho ? Container() : _construirBotaoCarrinhoAppBar(context)],
      );
    }

    _construirBotaoCarrinhoAppBar(contexto) {
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
            Consumer<CarrinhoModel>(
              builder: (context, carrinho, child) {
                if (carrinho.tamanhoListaCarrinho > 0) {
                  return Stack(
                    alignment: Alignment.center,
                      children: <Widget>[
                        _construirImagemBotaoCarrinhoAppBar('utils/assets/icons/shopping_bag.png'), 
                        _construirIndicatorBotaoCarrinhoAppBar()
                      ]
                  );
                }
                return _construirImagemBotaoCarrinhoAppBar('utils/assets/icons/shopping_bag.png');
              }
            )
          ),
        )
      );
    }

    _construirIndicatorBotaoCarrinhoAppBar() {
      return Positioned(
        right: 0,
        bottom: 0,
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Color.fromRGBO(178, 155, 178, 1),
            shape: BoxShape.circle
          ),
        )
      );
    }
    
    _construirImagemBotaoCarrinhoAppBar(imagem) {
      return Image(
        image: AssetImage(imagem),
        height: 30,
        fit: BoxFit.fitHeight,
      );
    }
  }