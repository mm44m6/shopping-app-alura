import 'package:flutter/material.dart';
import 'package:shopping_app_alura/paginas/detalhes.dart';
import 'package:shopping_app_alura/widgets/elementoGridProdutos.dart';

class GridProdutos extends StatelessWidget {

  final moveis;

  GridProdutos(this.moveis) : super();
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: 
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemCount: moveis.length,
        itemBuilder: (BuildContext context, int index) {
                
          final movel = moveis[index];

          return ElementoGridProdutos(movel, index);

        }
      );
  }
}