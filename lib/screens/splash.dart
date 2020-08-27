import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  //static const String id = 'splash';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade100,
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
