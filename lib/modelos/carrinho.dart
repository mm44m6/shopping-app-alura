import 'package:flutter/material.dart';
import 'dart:collection';

class CarrinhoModel extends ChangeNotifier {
  final List _moveisCarrinho = [];
  int _precoTotal = 0;

  int get precoTotal => _precoTotal;
  int get tamanhoListaCarrinho => _moveisCarrinho.length;
  UnmodifiableListView get moveisCarrinho => UnmodifiableListView(_moveisCarrinho);

  void adicionarMovel(movel) {
    Map _movelCarrinho = {
      'movel': movel,
      'quantidade': 1
    };

    int indexMovel =  _moveisCarrinho.indexWhere((item) => item['movel'] == movel);

    if(indexMovel >= 0) {
      print( _moveisCarrinho[indexMovel]);
      _moveisCarrinho[indexMovel]['quantidade'] = _moveisCarrinho[indexMovel]['quantidade'] + 1;
    } else {
      _moveisCarrinho.add(_movelCarrinho);
    }

    _calcularPrecoTotal();
    notifyListeners();
  }

  void aumentarQuantidade(movel) {
    movel['quantidade'] = movel['quantidade'] + 1;

    _calcularPrecoTotal();
    notifyListeners();
  }

  void diminuirQuantidade(movel) {
    if (movel['quantidade'] > 1) movel['quantidade'] = movel['quantidade'] - 1;

    _calcularPrecoTotal();
    notifyListeners();
  }

  void removerMovel(movel) {
    _moveisCarrinho.remove(movel);

    _calcularPrecoTotal();
    notifyListeners();
  }

  void _calcularPrecoTotal() {
    List<int> precosIndividuais = [];

    if (tamanhoListaCarrinho > 0) {
      _moveisCarrinho.forEach((movel) => precosIndividuais.add(movel['quantidade'] * movel['movel']['preco']));
      _precoTotal = precosIndividuais.reduce((precoA, precoB) {return precoA + precoB;});
    }

    else _precoTotal = 0;
    notifyListeners();
  }
  
}