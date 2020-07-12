import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomDateTimePicker extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String value;
  CustomDateTimePicker({
    @required this.onPressed,
    @required this.icon,
    @required this.value,
  });
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
    return FlatButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(12)),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Theme.of(context).accentColor,
                size: ScreenUtil().setWidth(30),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(12),
              ),
              Text(
                value,
                style: TextStyle(
                    fontSize: ScreenUtil().setWidth(14)
                ),
              ),
            ],
          ),
        )
    );
  }
}
