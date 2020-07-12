import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

class VerticalTab extends StatefulWidget {
  @override
  _VerticalTabState createState() => _VerticalTabState();
}

class _VerticalTabState extends State<VerticalTab> {
  @override
  Widget build(BuildContext context) {
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    return VerticalTabs(
      tabsWidth: deviceWidth * 0.2,
      selectedTabBackgroundColor: Colors.orange,
      tabs: <Tab>[
        Tab(
          child: CustomTab(
            text: 'One',
          ),
        ),
        Tab(
          child: CustomTab(
            text: 'Two',
          ),
        ),
        Tab(
          child: CustomTab(
            text: 'Shandong',
          ),
        ),
      ],
      contents: <Widget>[
        Container(
          child: Text('The first Tab'),
        ),
        Container(
          child: Text('The second Tab'),
        ),
        CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: CustomTabContent(),
            )
          ],
        )
      ],
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;

  CustomTab({@required this.text});

  @override
  Widget build(BuildContext context) {
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    return Container(
        height: deviceHeight * 0.06,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(13), fontWeight: FontWeight.bold,color: Colors.grey[800]),
        )));
  }
}

class CustomTabContent extends StatefulWidget {
  @override
  _CustomTabContentState createState() => _CustomTabContentState();
}

class _CustomTabContentState extends State<CustomTabContent> {
  Color colorSet = Colors.orange;
  int count = 0;
  bool press1 = false;
  bool press2 = false;
  bool press3 = false;
  bool press4 = false;
  bool press5 = false;
  bool press6 = false;
  bool press7 = false;
  void _changeColor()
  {
    setState(() {
      if(count == 2)
        {
          press1 = press2 = false;
          count = 0;
        }
      else
        {
          press1 = press2 = true;
          count = 2;
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Conta                     iner(
            margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '______ Districts ______',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
                InkWell(
                    onTap: () {
                      _changeColor();
                    },
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: ScreenUtil().setSp(14),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    setState(() {
                      if(press1)
                        count--;
                      else
                        count++;
                      press1 = !press1;
                    });
                  },
                  child: Container(
                    width: deviceWidth*0.33,
                    height: ScreenUtil().setHeight(30),
                    decoration: BoxDecoration(
                        color: press1 ? colorSet : Colors.grey[200],
                      border: Border.all(color: Colors.grey[400], width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(child: Text('Qingdao')),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      if(press2)
                        count--;
                      else
                        count++;
                      press2 = !press2;
                    });
                  },
                  child: Container(
                    width: deviceWidth*0.33,
                    height: ScreenUtil().setHeight(30),
                    decoration: BoxDecoration(
                      color: press2? colorSet:  Colors.grey[200],
                      border: Border.all(color: Colors.grey[400], width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(child: Text('Jinan')),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
