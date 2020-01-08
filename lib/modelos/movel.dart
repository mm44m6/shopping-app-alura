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
      'qtd': 1
    };

    int indexMovel =  _moveisCarrinho.indexWhere((item) => item['movel'] == movel);

    if(indexMovel >= 0) {
      print( _moveisCarrinho[indexMovel]);
      _moveisCarrinho[indexMovel]['qtd'] = _moveisCarrinho[indexMovel]['qtd'] + 1;
    } else {
      _moveisCarrinho.add(_movelCarrinho);
    }

    _calcularPrecoTotal();

    notifyListeners();
  }

  void aumentarQuantidade(movel) {
    movel['qtd'] = movel['qtd'] + 1;
    _calcularPrecoTotal();
    notifyListeners();
  }

  void diminuirQuantidade(movel) {
    if (movel['qtd'] > 1) movel['qtd'] = movel['qtd'] - 1;

    _calcularPrecoTotal();
    notifyListeners();
  }

  void removerMovel(movel) {
    _moveisCarrinho.remove(movel);

    _calcularPrecoTotal();
    notifyListeners();
  }

  void _calcularPrecoTotal() {
    List preco1 = [];
    if (tamanhoListaCarrinho > 0) {
      for(var i = 0; i < tamanhoListaCarrinho; i++) {
        preco1.add(_moveisCarrinho[i]['qtd'] * _moveisCarrinho[i]['movel']['preco']);
      }
    
    _precoTotal = preco1.reduce((a,b) {return a + b;});
    } 
    else _precoTotal = 0;
    notifyListeners();
  }
  
}