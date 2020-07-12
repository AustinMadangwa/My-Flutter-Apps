import 'package:flutter/material.dart';
import 'package:flutter_reloaded/settings/SettingsPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Dialog.dart';
import 'Login Page.dart';

class Drawers extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onTapping;
  final IconData secondIcon;
  final String secondText;

  Drawers(
      { this.icon,
        @required this.text,
        @required this.color,
        @required this.onTapping,
        this.secondIcon,
        this.secondText});

  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    Color conColor = Colors.white;
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    return Material(
      child: InkWell(
        splashColor: Colors.orange,
        onTap: widget.onTapping,
        child: Container(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
          height: deviceHeight * 0.07,
          decoration: BoxDecoration(
//              color: conColor,
              border: Border(bottom: BorderSide(color: Colors.grey[400]))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  widget.icon == null? Container(): Icon(
                    widget.icon,
                    size: ScreenUtil().setWidth(20),
                    color: widget.color,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        color: Colors.grey[700]),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  widget.secondText == null? Container(): Text(
                    widget.secondText,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.grey[700],
                    ),
                  ),
                  widget.secondIcon == null?Container(): Icon(
                    widget.secondIcon,
                    size: ScreenUtil().setWidth(20),
                    color: Colors.grey[700],
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: ScreenUtil().setWidth(20),
                    color: Colors.grey[700],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final AssetImage assetImage;
  final String name;

  Avatar({@required this.assetImage, @required this.name});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    final mainheight = deviceHeight*0.25;
    final avatone = mainheight/3.4;
    return Container(
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>LoginPage()));
            },
            child: Container(
              alignment: Alignment.center,
              height: mainheight,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[
                        Colors.deepOrange,
                        Colors.orangeAccent
                      ]
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.grey[400],
                          width: 3.0
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(0)),
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: ScreenUtil().setWidth(avatone),
                        child: CircleAvatar(
                          backgroundImage: assetImage,
                          radius: ScreenUtil().setWidth(avatone-2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>SettingsPage()));
              },
              child: Text(
                'Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(16),
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
