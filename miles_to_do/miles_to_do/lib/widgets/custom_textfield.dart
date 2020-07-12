import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  CustomTextField({
    @required this.labelText,
    this.controller
});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                  .setWidth(12)))
          ),
          labelText: labelText
      ),
    );
  }
}
