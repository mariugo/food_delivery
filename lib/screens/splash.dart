import 'package:flutter/material.dart';
import 'dart:io';

import 'package:fooddelivery/screens/home.dart';

class Splash extends StatefulWidget {
  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  bool isConnect = false;

  Future<Widget> tryInternetConnection() async {
    // redirect screen after try internet connection
    try{
      print('try');
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        isConnect = true;
        print(isConnect);
      }
    } on SocketException catch (_){
      print('catch');
      print('not connected');
      print(isConnect);
    }
  }

  @override
  Widget build(BuildContext context) {
    tryInternetConnection();
    if(isConnect == true){
      //is connected
      //return home screen
      print('if -> connection true');
      print(isConnect);
      return Home();
    } else {
      //No internet connection
      //Return Splash Screen
      print('else -> connection false');
      print(isConnect);
      return  SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF21BFBD),
          body: Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Wrap(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          //Logo image
                          image: AssetImage('assets/logo.png'),
                          semanticLabel: 'Prato e talheres',
                          width: 300,
                          height: 160,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Food Delivery',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 30,
                                color: Colors.teal.shade900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
