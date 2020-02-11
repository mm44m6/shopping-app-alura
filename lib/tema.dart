import 'dart:ui';
import 'package:flutter/material.dart';

class Tema {
  static Map<int, Color> _swatchCorDeFundo = {
    50: Color.fromRGBO(237, 237, 237, .1),
    100: Color.fromRGBO(237, 237, 237, .2),
    200: Color.fromRGBO(237, 237, 237, .3),
    300: Color.fromRGBO(237, 237, 237, .4),
    400: Color.fromRGBO(237, 237, 237, .5),
    500: Color.fromRGBO(237, 237, 237, .6),
    600: Color.fromRGBO(237, 237, 237, .7),
    700: Color.fromRGBO(237, 237, 237, .8),
    800: Color.fromRGBO(237, 237, 237, .9),
    900: Color.fromRGBO(237, 237, 237, 1),
  };
  MaterialColor corDeFundo = MaterialColor(0xFFededed, _swatchCorDeFundo);

  static Map<int, Color> _swatchCorDeDetalhes = {
    50: Color.fromRGBO(178, 155, 178, .1),
    100: Color.fromRGBO(178, 155, 178, .2),
    200: Color.fromRGBO(178, 155, 178, .3),
    300: Color.fromRGBO(178, 155, 178, .4),
    400: Color.fromRGBO(178, 155, 178, .5),
    500: Color.fromRGBO(178, 155, 178, .6),
    600: Color.fromRGBO(178, 155, 178, .7),
    700: Color.fromRGBO(178, 155, 178, .8),
    800: Color.fromRGBO(178, 155, 178, .9),
    900: Color.fromRGBO(178, 155, 178, 1),
  };

  MaterialColor corDeDetalhes = MaterialColor(0xFFB29BB2, _swatchCorDeDetalhes);

  Color corDivisor = Color.fromRGBO(83, 83, 83, 1);
  Color corDescricaoProdutos = Color.fromRGBO(83, 83, 83, 1);
}