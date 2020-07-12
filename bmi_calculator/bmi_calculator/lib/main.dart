import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Calculator.dart';

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
          MaterialPageRoute(builder: (context) => Calculator()),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
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
                backgroundImage: AssetImage('assets/cal.png'),
                radius: ScreenUtil().setWidth(50),
              ),
              SizedBox( height: ScreenUtil().setHeight(10.0)),
              Center(
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(30.0),
                    color: Colors.deepPurple[100],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


