import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final Color borderColor;

  CustomButton({
    @required this.onPressed,
    @required this.buttonText,
    this.color,
    this.textColor,
    this.borderColor = Colors.transparent
});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
    return  MaterialButton(
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12.0))
      ),
      padding: EdgeInsets.all(ScreenUtil().setWidth(14.0)),
      child: Text(buttonText),
    );
  }
}
