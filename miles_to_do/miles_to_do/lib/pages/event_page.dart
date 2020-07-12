import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_to_do/widgets/custom_icon_decoration.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}
class Event {
  final String time;
  final String task;
  final String desc;
  final bool isFinished;
  const Event(this.time, this.task, this.desc, this.isFinished);
}

final List<Event> _eventList = [
  new Event('08:00', 'Have coffe with Moon', 'Personal', true),
  new Event('10:00', 'Meet with sales', 'Work', true),
  new Event('12:00', 'Call Ranny about the appointment', 'Work', false),
  new Event('14:00', 'Fix onboarding experience', 'Work', false),
  new Event('16:00', 'Edit APi documentation', 'Personal', false),
  new Event('18:00', 'Setup user focus group', 'Personal', false),
];
class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
    return ListView.builder(
      itemCount: _eventList.length,
        padding: EdgeInsets.all(ScreenUtil().setWidth(0)),
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(24), right: ScreenUtil().setWidth(24)),
            child: Row(
              children: <Widget>[
                _lineStyle(context, iconSize, index, _eventList.length, _eventList[index].isFinished),
                _displayTime(_eventList[index].time),
                _displayContent(_eventList[index]),
              ],
            ),
          );
        }
    );
  }

  Widget _lineStyle(BuildContext context, double iconSize, int index, int listLength, bool isFinished)
  {
    return Container(
      decoration: CustomIconDecoration(
        iconSize: ScreenUtil().setWidth(iconSize),
        lineWidth: ScreenUtil().setWidth(1),
        firstData: index == 0 ?? true,
        lastData: index == listLength - 1 ?? true,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(50),)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x20000000),
                  blurRadius: ScreenUtil().setWidth(5),
                  offset: Offset(
                      ScreenUtil().setWidth(0),
                      ScreenUtil().setWidth(3)
                  )
              )
            ] ),
        child: Icon(
          isFinished ?
          Icons.fiber_manual_record
              : Icons.radio_button_unchecked,
          size: ScreenUtil().setWidth(20),
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  Widget _displayTime(String time)
  {
    return Container(
      width: ScreenUtil().setWidth(80),
      child: Padding(
        padding: EdgeInsets.only( left: ScreenUtil().setWidth(8)),
        child: Text(time),
      ),
    );
  }

  Widget _displayContent(Event event)
  {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(12), bottom: ScreenUtil().setWidth(12)),
        child: Container(
          padding: EdgeInsets.all(ScreenUtil().setWidth(14)),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0x20000000),
                    blurRadius: ScreenUtil().setWidth(5),
                    offset: Offset(
                        ScreenUtil().setWidth(0),
                        ScreenUtil().setWidth(3)
                    )
                )
              ],
              borderRadius: BorderRadius.all(
                  Radius.circular(ScreenUtil().setWidth(12))
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(event.task),
              SizedBox(height: ScreenUtil().setHeight(12),),
              Text(event.desc)
            ],
          ),
        ),
      ),
    );
  }
}

