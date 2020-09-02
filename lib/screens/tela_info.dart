import 'package:flutter/material.dart';
import 'package:fooddelivery/models/food_menu.dart';

class TelaInfo extends StatefulWidget {
  final heroTag;
  final nomeComida;
  final precoComida;

  TelaInfo({this.heroTag, this.nomeComida, this.precoComida});

  @override
  _TelaInfoState createState() => _TelaInfoState();
}

class _TelaInfoState extends State<TelaInfo> {
  var comidaEscolhida = 'PESO';
  int qtd = 0;
  double valTotal = 0;
  //static FoodMenu produto = FoodMenu(); //don't work
  FoodMenu produto = FoodMenu();
  //double preco = produto.price.toDouble(); //don't work
  double preco = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Detalhes',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.more_horiz),
//              onPressed: () {},
//              color: Colors.white,
//            )
          ],
        ),
        body:
            ListView(physics: const NeverScrollableScrollPhysics(), children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.heroTag),
                                fit: BoxFit.cover)),
                        height: 200.0,
                        width: 200.0))),
            Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.nomeComida,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.precoComida,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 25.0,
                                color: Colors.grey)),
                        Container(height: 25.0, color: Colors.grey, width: 1.0),
                        Container(
                          width: 140.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              color: Color(0xFF7A9BEE)),
                          child: Row(
                            //QTD
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                //counter --
                                onTap: () {
                                  if (qtd > 0) {
                                    setState(() {
                                      qtd--;
                                    });
                                  }
                                  valTotal = qtd * preco; //update total
                                }, // REMOVE AN ITEM
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Color(0xFF7A9BEE)),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text('$qtd',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 18.0)),
                              InkWell(
                                //counter ++
                                onTap: () {
                                  setState(() {
                                    qtd++;
                                  });
                                  valTotal = qtd * preco; //update total
                                }, //ADD AN ITEM
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF7A9BEE),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Acompanha arroz branco, feijão paulista, '
                      'salada de alface, frango em molho,'
                      'farofa de banana da terra e '
                      'refogado de legumes da estação.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.5,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 45.0),
                    Container(
                        height: 100.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildInfoCard('PESO', '300', 'G'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('CALORIAS', '267', 'KCAL'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('PROTEÍNAS', '20', 'G'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('VITAMINAS', 'A, B', 'VIT'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('FIBRAS', '200', 'G'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('GORDURAS', '20', 'G'),
                          ],
                        )),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0)),
                            color: Colors.black),
                        height: 50.0,
                        child: Center(
                          //TOTAL
                          child: Text('Total: $valTotal', //CALCULATE TOTAL
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  wordSpacing: 20.0,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    )
                  ],
                ))
          ])
        ]));
  }

  Widget _buildInfoCard(String informacao, String info, String unit) {
    // CHANGE TO FOOD OBJECTS FOOD_MENU.DART
    return InkWell(
        onTap: () {
          selectCard(informacao);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: informacao == comidaEscolhida
                  ? Color(0xFF7A9BEE)
                  : Colors.white,
              border: Border.all(
                  color: informacao == comidaEscolhida
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 100.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(informacao,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: informacao == comidaEscolhida
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: informacao == comidaEscolhida
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: informacao == comidaEscolhida
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ])));
  }

  selectCard(informacao) {
    setState(() {
      comidaEscolhida = informacao;
    });
  }
}
