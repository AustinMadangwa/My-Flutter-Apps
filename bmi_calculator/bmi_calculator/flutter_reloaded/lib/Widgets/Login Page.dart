import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_reloaded/settings/PrivatePolicy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();
  final _controll = TextEditingController();
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        elevation: 0.0,
        title: Center(
          child: Text(
            'Login Page',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: deviceHeight * 0.1,
            ),
            Container(
              width: deviceWidth * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(0),
                      height: deviceWidth * 0.2,
                      width: deviceWidth * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Image(
                        image: AssetImage('assets/m1.png'),
                      )),
                  Container(
                    child: Text(
                      'Miles',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(40)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.04,
            ),
            Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(0)),
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.075,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Input your number",
                  hoverColor: Colors.red,
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(20)),
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.grey[700],
                      ),
                      onPressed: () => _controller.clear()),
                  icon: IconButton(
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.grey[700],
                      ),
                      onPressed: () {}),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.04,
            ),
            Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(0)),
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.075,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: TextField(
                controller: _controller,
                cursorColor: Colors.red,
                cursorRadius: Radius.circular(8),
                cursorWidth: 3,
                decoration: InputDecoration(
                  hintText: "Enter SMS code",
                  icon: IconButton(
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.transparent,
                      ),
                      onPressed: () {}),
                  hoverColor: Colors.red,
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(20)),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    checkColor: Colors.orange,
                    focusColor: Colors.orange,
                    value: checkbox,
                    onChanged: (bool value) {
                      setState(() {
                        checkbox = value;
                      });
                    }),
                Text(
                  'I agree to the terms and conditions',
                  style: TextStyle(fontSize: ScreenUtil().setSp(8)),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivatePolicy()));
                    },
                    child: Text(
                      '<Terms and Conditions>',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: ScreenUtil().setSp(8)),
                    ))
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.06,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.grey[700],
              ),
              width: deviceWidth * 0.8,
              child: FlatButton(
                onPressed: null,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
