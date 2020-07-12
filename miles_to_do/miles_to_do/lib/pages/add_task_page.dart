import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:miles_to_do/model/database.dart';
import 'package:miles_to_do/model/todo.dart';
import 'package:miles_to_do/widgets/custom_date_time_picker.dart';
import 'package:miles_to_do/widgets/custom_modal_action_button.dart';
import 'package:miles_to_do/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  final _textTaskController = TextEditingController();
  Future _pickDate() async {
    DateTime datePick = await showDatePicker(
        context: context,
        initialDate:  new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));
    if(datePick != null)
    {
      setState(() {
        _selectedDate = datePick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
    _textTaskController.clear();
    var provider = Provider.of<Database>(context);
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
                'Add a new task.',
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
              labelText: 'Enter task name',
            controller: _textTaskController,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(12),
          ),
          CustomDateTimePicker(
              icon: Icons.date_range,
              onPressed: _pickDate,
              value: new DateFormat('dd-MM-yyyy').format(_selectedDate),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(24),
          ),
          CustomModalActionButton(
              onClose: () {
                Navigator.of(context).pop();
              },
              onSave: () {
                if(_textTaskController.text == '')
                  {
                    print('data not found');
                  }
                else
                  {
                    provider.insertTodoEntries(new TodoData(
                      date: _selectedDate,
                      time: DateTime.now(),
                      isFinish: false,
                      task: _textTaskController.text,
                      description: '',
                      todoType: TodoType.TYPE_TASK.index,
                      id: null
                    )).whenComplete(() => Navigator.of(context).pop());
                  }
              }
          )
        ],
      ),
    );
  }
}
