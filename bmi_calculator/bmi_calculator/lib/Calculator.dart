import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'second_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:decimal/decimal.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Calculator(),
));

double bmi = 0;
int weight = 60;
double heights = 165;
int age = 25;
String result,help,bmi_hold;
enum Gender{
  male,
  female,
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0.0,
        leading: Icon(Icons.menu),
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(30.0),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState((){
                    selectedGender = Gender.male;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10.0))),
                    color: selectedGender==Gender.male? Colors.green :Colors.blueGrey[900],
                  ),
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  height: ScreenUtil().setHeight(110.0),
                  width: ScreenUtil().setWidth(160.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mars,
                        size: ScreenUtil().setSp(60.0),
                        color: Colors.white,
                      ),

                      Text(
                        'MALE',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: ScreenUtil().setSp(20.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState((){
                    selectedGender = Gender.female;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10.0))),
                    color: selectedGender==Gender.female? Colors.green :Colors.blueGrey[900],
                  ),
                  margin: EdgeInsets.all(10.0),
                  height: ScreenUtil().setHeight(110.0),
                  width: ScreenUtil().setWidth(160.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.venus,
                        size: ScreenUtil().setSp(60.0),
                        color: Colors.white,
                      ),
                      Text(
                        'FEMALE',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: ScreenUtil().setSp(20.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10.0))),
              color: Colors.blueGrey[900],
            ),
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
            child: Column(
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: ScreenUtil().setSp(20.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '${heights.toInt()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(60.0),
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(5.0)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        'cm',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: ScreenUtil().setSp(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Slider(
                  min: 30,
                  max: 250,
                  value: heights,
                  activeColor: Colors.redAccent,
                  inactiveColor: Colors.white,
                  onChanged: (newValue) {
                    setState(() {
                      heights = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10.0))),
                  color: Colors.blueGrey[900],
                ),
                width: ScreenUtil().setWidth(160.0),
                height: ScreenUtil().setHeight(175.0),
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: ScreenUtil().setSp(20.0),
                      ),
                    ),
                    Text(
                      '$weight',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(60.0),
                      ),
                    ),
                    Container(
                      child:  ButtonTheme.bar(
                        child:  ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Transform.scale(
                              child: new FloatingActionButton(
                                onPressed: () {
                                  setState((){
                                    weight-=1;
                                  });
                                },
                                backgroundColor: Colors.grey[800],
                                child: new Icon(Icons.remove),
                                heroTag: "btn1",
                              ),
                              scale: ScreenUtil().setWidth(.8),
                            ),
                            Transform.scale(
                              child: new FloatingActionButton(
                                onPressed: () {
                                  setState((){
                                    weight+=1;
                                  });
                                },
                                backgroundColor: Colors.grey[800],
                                child: new Icon(Icons.add),
                                heroTag: "btn2",
                              ),
                              scale: ScreenUtil().setWidth(.8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10.0))),
                  color: Colors.blueGrey[900],
                ),
                width: ScreenUtil().setWidth(160.0),
                height: ScreenUtil().setHeight(175.0),
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: ScreenUtil().setSp(20.0),
                      ),
                    ),
                    Text(
                      '$age',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(60.0),
                      ),
                    ),
                    Container(
                      child: ButtonTheme.bar(
                        child: new ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Transform.scale(
                              child: new FloatingActionButton(
                                onPressed: () {
                                  setState((){
                                    age-=1;
                                  });
                                },
                                backgroundColor: Colors.grey[800],
                                child: new Icon(Icons.remove),
                                heroTag: "btn3",
                              ),
                              scale: ScreenUtil().setWidth(.8),
                            ),
                            Transform.scale(
                              child: new FloatingActionButton(
                                onPressed: () {
                                  setState((){
                                    age+=1;
                                  });
                                },
                                backgroundColor: Colors.grey[800],
                                child: new Icon(Icons.add),
                                heroTag: "btn4",
                              ),
                              scale: ScreenUtil().setWidth(.8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
              setState(() {
                double temp = 1 / 100;
                double him = (heights * temp) * (heights * temp);
                bmi = weight/him;
                bmi_hold = bmi.toStringAsFixed(1);
                if (bmi < 18.5)
                {
                  result = 'UNDERWEIGHT';
                  help = 'You need to eat a lot and gain some weight';
                }
                if(bmi > 18.5 && bmi <25.0)
                {
                  result = 'NORMAL';
                  help = 'You are in perfect health, your BMI is ideal';
                }
                if(bmi > 25.0 && bmi < 30.0)
                {
                  result = 'OVERWEIGHT';
                  help = 'Exercise to loose extra weight';
                }
                if(bmi > 30.0 && bmi < 40.0)
                {
                  result = 'OBESE';
                  help = 'Weight reduction is highly recommended';
                }
                if(bmi > 40.0)
                {
                  result = 'EXTREMELY OBESE';
                  help = 'Go and see the doctor for more help';
                }
              });
            },
            color: Colors.redAccent,
            padding: EdgeInsets.all(15.0),
            child: Text(
              'CALCULATE',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
