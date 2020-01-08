import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modelos/movel.dart';

class AppBarCustomizada extends StatelessWidget with PreferredSizeWidget {

final String titulo;
final bool ehPaginaCarrinho;

AppBarCustomizada({this.titulo, this.ehPaginaCarrinho}): super();

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
        this.ehPaginaCarrinho ? Container() : GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/carrinho');
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
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                topLeft: Radius.circular(100)),
                color: Colors.white,
              ),
              child: 
                Consumer<CarrinhoModel>(
                  builder: (context, carrinho, child) {
                    if (carrinho.tamanhoListaCarrinho > 0) {
                      return Stack(
                        alignment: Alignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage('utils/assets/icons/shopping_bag.png'),
                              height: 30,
                              fit: BoxFit.fitHeight,
                            ), 
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: new Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(178, 155, 178, 1),
                                  shape: BoxShape.circle
                                ),
                              )
                            )
                          ]
                        );
                      }
                      return Image(
                        image: AssetImage('utils/assets/icons/shopping_bag.png'),
                          height: 30,
                          fit: BoxFit.fitHeight,
                      );
                    }
                  )
                ),
              )
            ),
         ],
      );
    }

    @override
    Size get preferredSize => Size.fromHeight(kToolbarHeight);
  }