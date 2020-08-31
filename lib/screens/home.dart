import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddelivery/screens/tela_info.dart';
import 'package:fooddelivery/models/order.dart';
import 'package:fooddelivery/models/food_menu.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int statusCesta = 0;
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
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
                                          FlutterOpenWhatsapp.sendSingleMessage("5517996097839", "teste");
                                          print("------------- \nRunning on: $_platformVersion\n");
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
                    onPressed: () {

                    })
              ],
            )));
  }
}
