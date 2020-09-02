import 'package:flutter/material.dart';
import 'package:fooddelivery/screens/tela_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int statusCesta = 0;

  //whatsapp_unilink dependencie method
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+55-(17)996427507', //change number for user telefone?
      text:
          "Mensagem de teste: Food Delivery App", //change message for order content
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF21BFBD),
            body: ListView(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10.0),
                child: IconButton(
                  iconSize: 30.0,
                  alignment: Alignment.centerLeft,
                  icon: Icon(Icons.menu),
                  /*SIDE BAR: Nome, endereço,
                  Forma de pgto: font.awesome icons
                  horarário
                  whatsapp
                   */
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Row(
                  children: <Widget>[
                    Text('Menu',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)),
                    SizedBox(width: 10.0),
                    Text('semanal',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 30.0))
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0)),
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.only(left: 25.0, right: 20.0),
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            children: <Widget>[
                              //menu foods and days
                              //path image/ food name/ price
                              _construirMenu('assets/segunda.png',
                                  'segunda-feira', '\$12,00'),
                              _construirMenu(
                                  'assets/terca.png', 'terça-feira', '\$15,00'),
                              _construirMenu('assets/quarta.png',
                                  'quarta-feira', '\$15,00'),
                              _construirMenu('assets/quinta.png',
                                  'quinta-feira', '\$15,00'),
                              _construirMenu(
                                  'assets/sexta.png', 'sexta-feira', '\$15,00'),
                              SizedBox(
                                height: 50.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
//                                  Container(
//                                    height: 65.0,
//                                    width: 60.0,
//                                    decoration: BoxDecoration(
//                                      border: Border.all(
//                                          color: Colors.grey,
//                                          style: BorderStyle.solid,
//                                          width: 1.0),
//                                      borderRadius: BorderRadius.circular(20.0),
//                                    ),
//                                    child: Center(
//                                      child: Icon(Icons.search,
//                                          color: Colors.black),
//                                    ),
//                                  ),
                                  Container(
                                    height: 65.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: FlatButton(
                                      //button shopping basket
                                      onPressed: () {
                                        //shopping basket status
                                      },
                                      child: Icon(Icons.shopping_basket,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    height: 65.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Color(0xFF1C1428)),
                                    child: FlatButton(
                                        //Button BUY
                                        onPressed: () {
                                          //open whatsapp and send order message
                                          launchWhatsApp();
                                        },
                                        child: Text('Comprar',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 15.0))),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ])));
  }

  Widget _construirMenu(String caminho, String nomeComida, String precoComida) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TelaInfo(
                      heroTag: caminho,
                      nomeComida: nomeComida,
                      precoComida: precoComida)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: caminho,
                      child: Image(
                          image: AssetImage(caminho),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nomeComida,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(precoComida,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ])),
                IconButton(
                    icon: Icon(Icons.info),
                    color: Colors.black45,
                    onPressed: () {})
              ],
            )));
  }
}
