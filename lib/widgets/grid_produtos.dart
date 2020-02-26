import 'package:flutter/material.dart';
import 'package:shopping_app_alura/modelos/movel.dart';
import 'package:shopping_app_alura/widgets/elemento_grid_produtos.dart';

class GridProdutos extends StatelessWidget {

  final moveis;

  GridProdutos({this.moveis});
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: 
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemCount: moveis.length,
        itemBuilder: (BuildContext context, int index) {
                
          final movel = Movel.fromJson(moveis[index]);

          return ElementoGridProdutos(movel: movel, index: index);

        }
      );
  }
}