import 'dart:async';
import 'package:flutter/material.dart';
import 'SecondScreen.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Miles Weather App',
  home: Splash(),
));

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(
          seconds: 3
      ),
          (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CitySelection()),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff622F74),
              gradient: LinearGradient(colors: [new  Color(0xff6094e8), new Color(0xffde5cbc)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/cloudy.png'),
                radius: 50.0,
              ),
              SizedBox( height: 10.0),
              Text(
                'Madangwa Weather App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.deepPurple[100],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


