import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
              color: Colors.black, //change your color here
          ),
          actions: <Widget>[
            Padding(
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
                child: Image(
                  image: AssetImage('utils/assets/icons/shopping_bag.png'),
                  height: 30,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
         ]),
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
                                  onTap: () => print("here"),
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
