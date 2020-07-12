import 'package:flutter/material.dart';
import 'package:flutter_reloaded/Widgets/custom_modal_action_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClearCity extends StatefulWidget {
  @override
  _ClearCityState createState() => _ClearCityState();
}

class _ClearCityState extends State<ClearCity> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    return  Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(20),),
          Center(
            child: Text(
              'Are you sure you want to clear all selections?',
              style: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(20),),
          CustomModalActionButton(
            onClose:(){
              Navigator.of(context).pop();
            },
            onSave: (){
              Navigator.of(context).pop();
            },
            save: 'Clear',
            close: "Cancel",
          )
        ],
      ),
    );
  }
}

class SaveOrDiscardCity extends StatefulWidget {
  @override
  _SaveOrDiscardCityState createState() => _SaveOrDiscardCityState();
}

class _SaveOrDiscardCityState extends State<SaveOrDiscardCity> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    return  Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(20),),
          Center(
            child: Text(
              'Do you want to save the current location?',
              style: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(20),),
          CustomModalActionButton(
            onClose:(){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onSave: (){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            save: 'Save',
            close: "Don't Save",
          )
        ],
      ),
    );
  }
}

