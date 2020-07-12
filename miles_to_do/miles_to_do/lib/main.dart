import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_to_do/model/database.dart';
import 'package:miles_to_do/pages/add_event_page.dart';
import 'package:miles_to_do/pages/add_task_page.dart';
import 'package:miles_to_do/pages/event_page.dart';
import 'package:miles_to_do/pages/task_page.dart';
import 'package:miles_to_do/widgets/custom_button.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Database>(builder: (_) => Database()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Miles To Do List App',
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'Montserrat',
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController();
  double currentPage = 0;

  @override
  Widget build(BuildContext context) {
    _pageController.addListener((){
      setState(() {
        currentPage = _pageController.page;
      });
    });
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
    return Scaffold(
      backgroundColor: Colors.grey[450],
      body: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: ScreenUtil().setHeight(30),
          ),
          Positioned(
            right: ScreenUtil().setWidth(0),
            child: Text(
              '6',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(200),
                  color: Color(0x10000000)
              ),
            ),
          ),
          _mainContent(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
              context: context,
            builder: (BuildContext context){
                return Dialog(
                  child: currentPage == 0 ? AddTaskPage() :AddEventPage(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(12)))
                  ),
                );
            }
          );
        },
        child: Icon(Icons.add),
      ), //The adding floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[350],
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert
              ),
              onPressed: () {},
            ),
          ],
        ),
      ), //The Bottom AppBar with settings and the other icon
    );
  }

  Widget _mainContent(BuildContext context) // Main content that calls everything in the front page
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      SizedBox(
        height: ScreenUtil().setHeight(60),
      ),
      Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(24.0)),
        child: Text(
          'Monday',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(32),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(24.0)),
        child: _button(context),
      ),
        Expanded(
          child: PageView(
            controller: _pageController,
           children: <Widget>[
             TaskPage(),
             EventPage(),
           ],
          ),
        ),
    ],
    );
  }

  Widget _button(BuildContext context) //Button for tasks and events
  {
    return Row(
      children: <Widget>[
        Expanded(
          child:
          CustomButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.bounceInOut
                );
              },
              buttonText: "Tasks",
              color: currentPage < 0.5? Theme.of(context).accentColor : Colors.white,
              textColor: currentPage < 0.5? Colors.white : Theme.of(context).accentColor ,
            borderColor: currentPage < 0.5? Colors.transparent : Theme.of(context).accentColor,
          ),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(32),
        ),
        Expanded(
          child:
          CustomButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(
                  milliseconds: 500,
                ),
                curve: Curves.bounceInOut,
              );
            },
            buttonText: "Events",
            color: currentPage > 0.5? Theme.of(context).accentColor : Colors.white,
            textColor: currentPage > 0.5? Colors.white : Theme.of(context).accentColor ,
            borderColor: currentPage > 0.5? Colors.transparent : Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
