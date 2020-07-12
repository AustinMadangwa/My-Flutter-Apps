import 'package:flutter/material.dart';
import 'package:flutter_reloaded/Widgets/Dialog.dart';
import 'package:flutter_reloaded/Widgets/Profile%20Data.dart';
import 'package:flutter_reloaded/settings/AboutUs.dart';
import 'package:flutter_reloaded/settings/PrivatePolicy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        elevation: 0.0,
        title: Text(
          'My Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Drawers(
              text: 'Change Password',
              color: Colors.grey[800],
              onTapping: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: AddDialog(
                          newPage: () {},
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(ScreenUtil().setWidth(12)))),
                      );
                    });
              }),
          Drawers(
              text: 'Cancel Account',
              color: Colors.grey[800],
              onTapping: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: AddDialog(
                          newPage: () {},
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(ScreenUtil().setWidth(12)))),
                      );
                    });
              }),
          Drawers(
            text: 'Voice Announcements',
            color: Colors.grey[800],
            onTapping: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: AddDialog(
                        newPage: () {},
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(ScreenUtil().setWidth(12)))),
                    );
                  });
            },
            secondText: 'opened',
          ),
          Drawers(text: 'Feedback', color: Colors.grey[800], onTapping: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: AddDialog(
                      newPage: () {},
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setWidth(12)))),
                  );
                });
          }),
          Drawers(
              text: 'About us',
              color: Colors.grey[800],
              onTapping: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
              }),
          Drawers(
              text: 'User Privary Policy',
              color: Colors.grey[800],
              onTapping: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PrivatePolicy()));
              }),
          Drawers(
            text: 'Check Updates',
            color: Colors.grey[800],
            onTapping: () {
              final snackBar = SnackBar(
                backgroundColor: Colors.grey[600],
                content: Text(
                  'This is the latest version!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange
                  ),
                ),
              );
              globalKey.currentState.showSnackBar(snackBar);
            },
            secondText: 'v 1.0',
          ),
        ],
      ),
    );
  }
}
