import 'package:flutter/material.dart';
import 'package:shopping_app_alura/widgets/botao_carrinho.dart';

class AppBarCustomizada extends StatelessWidget with PreferredSizeWidget {

  final String titulo;
  final bool ehPaginaCarrinho;

  AppBarCustomizada({this.titulo, this.ehPaginaCarrinho});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo, style: Theme.of(context).textTheme.headline),
      titleSpacing: 0.0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      actions: <Widget>[
          _mudarBotaoCarrinho(ehPaginaCarrinho, context)
        ],
      );
    }

    Widget _mudarBotaoCarrinho(bool ehPaginaCarrinho, BuildContext contexto) {
      if (ehPaginaCarrinho) return Container();
      return BotaoCarrinho(contexto: contexto);
    }
  }