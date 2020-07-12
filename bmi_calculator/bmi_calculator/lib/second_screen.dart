import 'package:flutter/material.dart';
import 'Calculator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640)..init(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0.0,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(25.0),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                'YOUR RESULTS',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: ScreenUtil().setSp(40.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10.0))),
              color: Colors.blueGrey[900],
            ),
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            height: ScreenUtil().setHeight(410.0),
            width: ScreenUtil().setWidth(180.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '$result',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: ScreenUtil().setSp(30.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$bmi_hold',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(40.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      '$help',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: ScreenUtil().setSp(20.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.redAccent,
            padding: EdgeInsets.all(15.0),
            child: Text(
              'RECALCULATE',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}