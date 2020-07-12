import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miles_to_do/widgets/custom_date_time_picker.dart';
import 'package:miles_to_do/widgets/custom_modal_action_button.dart';
import 'package:miles_to_do/widgets/custom_textfield.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String _selectedDate = 'pick date';
  String _selectedTime = 'pick time';
  Future _pickDate() async {
    DateTime datePick = await showDatePicker(
        context: context,
        initialDate:  new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));
    if(datePick != null)
    {
      setState(() {
        _selectedDate = datePick.toString();
      });
    }
  }
  Future _pickTime() async{
    TimeOfDay timePick = await showTimePicker(
        context: context,
        initialTime: new TimeOfDay.now(),
    );
    if(timePick != null)
      {
        setState(() {
          _selectedTime = timePick.toString();
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              'Add a new event.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setWidth(16),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(24),
          ),
         CustomTextField(
             labelText: 'Enter event name'
         ),
          SizedBox(
            height: ScreenUtil().setHeight(12),
          ),
          CustomTextField(
            labelText: 'Enter description',
          ),
          SizedBox(
            height: ScreenUtil().setHeight(12),
          ),
          CustomDateTimePicker(
            icon: Icons.date_range,
              onPressed: _pickDate,
              value: _selectedDate
          ),
          CustomDateTimePicker(
            icon:  Icons.access_time,
            onPressed:   _pickTime,
            value: _selectedTime,
            ),
          SizedBox(
            height: ScreenUtil().setHeight(24),
          ),
          CustomModalActionButton(
              onClose: () {
                Navigator.of(context).pop();
              },
              onSave: () {}
          )
        ],
      ),
    );
  }
}
