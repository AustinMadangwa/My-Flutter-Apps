import 'package:flutter/material.dart';
import 'package:flutter_reloaded/Order%20Page/ConfirmDialogs.dart';
import 'package:flutter_reloaded/Order%20Page/Vertical%20Tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

class CitySelection extends StatefulWidget {
  final String titles;
  CitySelection({
    @required this.titles
});
  @override
  _CitySelectionState createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  Future<bool> _confirmDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: SaveOrDiscardCity(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(ScreenUtil().setWidth(12)))),
          );
        });
    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    return WillPopScope(
      onWillPop: _confirmDialog,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[700],
            elevation: 0.0,
            title: Center(
              child: Text(
              widget.titles,
                style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: ClearCity(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenUtil().setWidth(12)))),
                        );
                      });
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          body: VerticalTab(),
          bottomNavigationBar: BottomAppBar(
            color: Colors.orange,
            child: Container(
              child: FlatButton(
                  onPressed: (){
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: SaveOrDiscardCity(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(ScreenUtil().setWidth(12)))),
                          );
                        });
                  },
                  child: Text(
                    'Complete',
                    style: TextStyle(
                        color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(18)
                    ),
                  )),
            ),
          )),
    );
  }
}
