import 'package:flutter/material.dart';
// import '../modelos/movel.dart';

class Detalhes extends StatelessWidget {
  final movel;

  Detalhes(this.movel) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(children: [
        Expanded(
            child: Container(
          child: Image.asset(
            'utils/assets/images/${movel.foto}',
            fit: BoxFit.cover,
          ),
        ))
      ]),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              titleSpacing: 0.0,
              title: Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        right: 0,
                        top: 10,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(100),
                                    topLeft: Radius.circular(100)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(178, 155, 178, 0.2),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0, 0))
                                ]),
                            padding: EdgeInsets.only(right: 30, left: 20),
                            height: 40,
                            alignment: Alignment.centerRight,
                            child: Image(
                              image: AssetImage(
                                  'utils/assets/icons/shopping_bag.png'),
                              height: 30,
                              fit: BoxFit.fitHeight,
                            )))
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0),
          body: Stack(
            children: <Widget>[
              Positioned(
                bottom: 200,
                child: Container(color: Colors.white,
                height: 200,),
              )
            ],
          ))
    ]);
  }
}
