import 'package:flutter/material.dart';
import 'package:shopping_app_alura/modelos/item_carrinho.dart';
import 'dart:collection';

import 'package:shopping_app_alura/modelos/movel.dart';

class CarrinhoModel extends ChangeNotifier {
  final List<ItemCarrinho> _moveisCarrinho = [];
  int _precoTotal = 0;

  int get precoTotal => _precoTotal;
  int get tamanhoListaCarrinho => _moveisCarrinho.length;
  UnmodifiableListView get moveisCarrinho => UnmodifiableListView(_moveisCarrinho);

  void adicionarMovel(Movel movel) {
    ItemCarrinho _movelCarrinho = ItemCarrinho(movel, 1);

    int indexMovel =  _moveisCarrinho.indexWhere((item) => item.movel == movel);

    if(indexMovel >= 0) {
      print( _moveisCarrinho[indexMovel]);
      _moveisCarrinho[indexMovel].quantidade = _moveisCarrinho[indexMovel].quantidade + 1;
    } else {
      _moveisCarrinho.add(_movelCarrinho);
    }

    _calcularPrecoTotal();
    notifyListeners();
  }

  void aumentarQuantidade(ItemCarrinho movel) {
    movel.quantidade = movel.quantidade + 1;

    _calcularPrecoTotal();
    notifyListeners();
  }

  void diminuirQuantidade(ItemCarrinho movel) {
    if (movel.quantidade > 1) movel.quantidade = movel.quantidade - 1;

    _calcularPrecoTotal();
    notifyListeners();
  }

  void removerMovel(ItemCarrinho movel) {
    _moveisCarrinho.remove(movel);

    _calcularPrecoTotal();
    notifyListeners();
  }

  void _calcularPrecoTotal() {
    List<int> precosIndividuais = [];

    if (tamanhoListaCarrinho > 0) {
      _moveisCarrinho.forEach((movel) => precosIndividuais.add(movel.quantidade * movel.movel.preco));
      _precoTotal = precosIndividuais.reduce((precoA, precoB) {return precoA + precoB;});
    }

    else _precoTotal = 0;
    notifyListeners();
  }
  
}