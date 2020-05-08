
import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

 @override
 void initState() { 
   super.initState();
   Timer(Duration(milliseconds :2480), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home())));
 }


  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Image.asset('assets/images/splash.gif'),
            Text("Expense Tracker", style: TextStyle(fontSize: 40,fontWeight:FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}