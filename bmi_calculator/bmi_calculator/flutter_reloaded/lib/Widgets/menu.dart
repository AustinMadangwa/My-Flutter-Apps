import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Profile Data.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    return Container(
      width: ScreenUtil().setWidth(250),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 16, color: Colors.black12)]),
      child: Column(
        children: <Widget>[
          Drawers(
              icon: Icons.home,
              text: 'Home',
              color: Colors.orangeAccent,
              onTapping: () {}),
          Drawers(
              icon: Icons.camera,
              text: 'Camera',
              color: Colors.blue,
              onTapping: () {}),
          Drawers(
              icon: Icons.search,
              text: 'Search',
              color: Colors.orange,
              onTapping: () {}),
          Drawers(
              icon: Icons.person,
              text: 'Profile',
              color: Colors.red,
              onTapping: () {})
        ],
      ),
    );
  }
}
