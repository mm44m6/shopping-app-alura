import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../modelos/movel.dart';
import '../common/appbar.dart';

class Detalhes extends StatelessWidget {
  final movel;

  Detalhes(this.movel) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("utils/assets/images/${movel['foto']}"), fit: BoxFit.cover)
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustomizada(titulo: '', ehPaginaCarrinho: false),
        body: 
        Align(
          alignment: Alignment.bottomLeft,
          child:
            Container(
              height: 212,
              margin: EdgeInsets.all(16),
              child:  
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Text(movel['titulo'], style: TextStyle(fontSize: 20.0, fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.black))
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                        child: Text(movel['descricao'], style: TextStyle(fontSize: 12.0, fontFamily: 'Open Sans', color: Color.fromRGBO(83, 83, 83, 1))),
                      ),
                      Container(
                        child: 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("${movel['preco']} reais", style: TextStyle(fontSize: 20.0, fontFamily: 'Open Sans', fontWeight: FontWeight.bold, color: Colors.black)),
  
                              Material(
                                color: Color.fromRGBO(178, 155, 178, 0.8),
                                shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(60.0)),
                                elevation: 5.0,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(100.0),
                                  onTap: () => Provider.of<CarrinhoModel>(context).adicionarMovel(movel),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text('COMPRAR', style: TextStyle(color: Colors.white, fontSize: 12),),
                                ),
                              ),
                            ),
                          ]
                        ),
                        margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                      )
                    ],
                  )
                ) 
            )
        )
      )
    );
  }
}
