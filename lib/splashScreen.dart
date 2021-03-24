import 'dart:async';

import 'package:flutter/material.dart';
import 'package:titanic_prediction/prediction.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void onClose() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Prediction()));
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff63366).withOpacity(0.8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/boat.png'),
            ),
            SizedBox(height: 10),
            Text(
              'Titanic Prediction',
              style: TextStyle(
                  fontFamily: 'IBMPlexSans',
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
