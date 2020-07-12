import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reloaded/Order%20Page/SearchPage.dart';
import 'package:flutter_reloaded/home.dart';
import 'package:flutter_reloaded/profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widgets/BottomBar.dart';
import 'Widgets/Dialog.dart';

void main() => runApp(MyApp());
//void main() => runApp(
//      DevicePreview(
//        builder: (context) => MyApp(),
//      ),
//    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(primaryColor: Colors.orange),
      title: 'Flutter Reloaded',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeTabs = [
    SearchPage(),
    SearchPage(),
    Profile(),
  ];
  int _currentTab = 0;

  void _navigatorUpdate(int x) {
    setState(() {
      _currentTab = x;
      _selectedTab(x);
    });
  }

  void _selectedTab(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 360.0, height: 780.0, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomPadding: false,
      appBar: _currentTab < 3
          ? AppBar(
              elevation: 0.0,
              backgroundColor: Colors.grey[700],
              title: TextBox(),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.orange,
                title: null,
              ),
            ),
      bottomNavigationBar: FABBottomAppBar(
        milesUpdate: _currentTab,
        centerItemText: 'Add City',
        backgroundColor: Colors.grey[700],
        color: Colors.white,
        selectedColor: Colors.orange,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.search, text: 'Order'),
          FABBottomAppBarItem(iconData: Icons.card_travel, text: 'Service'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'Profile'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      body: _currentTab == 0
          ? HomeTab(
              navUpdate: (int x) {
                _navigatorUpdate(x);
              },
            )
          : homeTabs[_currentTab - 1],
    );
  }
}

class TextBox extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              size: ScreenUtil().setSp(16),
            ),
            Text(
              'Qingdao',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(14),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: ScreenUtil().setWidth(0)),
          width: deviceWidth * 0.7,
          height: deviceHeight * 0.045,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Input your search",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[700],
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey[700],
                  ),
                  onPressed: () => _controller.clear()),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
