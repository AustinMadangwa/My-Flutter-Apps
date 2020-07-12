import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widgets/Dialog.dart';
import 'Widgets/Profile Data.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    return ListView(
      children: <Widget>[
        Avatar(assetImage: AssetImage('assets/austin.jpg'), name: 'Austin Miles'),
        Drawers(
            icon: Icons.watch_later,
            color: Colors.purple,
            text: 'Saved',
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
            icon: Icons.swap_horiz,
            color: Colors.blueAccent,
            text: 'Swap',
            secondText: 'change info',
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
            icon: Icons.headset_mic,
            color: Colors.green,
            text: 'Calls',
            secondIcon: Icons.call,
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
            icon: Icons.receipt,
            color: Colors.red,
            text: 'Laws and Order',
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
            icon: Icons.folder,
            color: Colors.lightGreenAccent,
            text: 'Archives',
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
      ],
    );
  }
}
