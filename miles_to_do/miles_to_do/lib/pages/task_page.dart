import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:miles_to_do/model/database.dart';
import 'package:miles_to_do/model/todo.dart';
import 'package:miles_to_do/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  Database provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Database>(context);
    ScreenUtil.instance = ScreenUtil(width: 360, height: 640, allowFontScaling: true)..init(context);
    return StreamProvider.value(
      value: Database().getTodoByType(TodoType.TYPE_TASK.index),
      child: Consumer<List<TodoData>>(
        builder: (context,_dataList,child){
            return _dataList == null
                ? Center(child: CircularProgressIndicator() ,)
                : ListView.builder(
                padding: EdgeInsets.all(ScreenUtil().setWidth(0)),
                itemCount: _dataList.length,
                itemBuilder: (context,index){
                  return _dataList[index].isFinish
                      ? _taskCompleted(_dataList[index])
                      :_taskUncompleted(_dataList[index]);
                }
            );
        },
      ),
    );
  }
  Widget _taskUncompleted(TodoData data)
  {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
          builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.all(
                      Radius.circular(
                          ScreenUtil().setWidth(12)
                      )
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Confirm Task',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(16)
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(24),),
                      Text(data.task),
                      SizedBox(height: ScreenUtil().setHeight(24),),
                      Text(DateFormat('dd-MM-yyyy').format(data.time)),
                      SizedBox(height: ScreenUtil().setHeight(24),),
                      CustomButton(
                        buttonText: "Complete",
                        color: Colors.green,
                        textColor: Colors.white,
                        onPressed: () {
                          provider.completeTodoEntries(data.id).
                          whenComplete(()=> Navigator.of(context).pop());
                        },
                      )
                    ],
                  ),
                ),
              );
          }
        );
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.all(
                        Radius.circular(
                            ScreenUtil().setWidth(12)
                        )
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Delete Task',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(16)
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(24),),
                      Text(data.task),
                      SizedBox(height: ScreenUtil().setHeight(24),),
                      Text(DateFormat('dd-MM-yyyy').format(data.time)),
                      SizedBox(height: ScreenUtil().setHeight(24),),
                      CustomButton(
                        buttonText: "Delete",
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                        onPressed: () {
                          provider.deleteTodoEntries(data.id).
                          whenComplete(()=>Navigator.of(context).pop());
                        },
                      )
                    ],
                  ),
                ),
              );
            }
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20.0), vertical: ScreenUtil().setWidth(12.0)),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_unchecked,
              color: Theme.of(context).accentColor,
              size: ScreenUtil().setWidth(20.0),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(28),
            ),
            Text(data.task),
          ],
        ),
      ),
    );
  }
  Widget _taskCompleted(TodoData data)
  {
    return Container(
      foregroundDecoration: BoxDecoration(
        color: Color(0x60FDFDFD),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20.0), vertical: ScreenUtil().setWidth(12.0)),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_checked,
              color: Theme.of(context).accentColor,
              size: ScreenUtil().setWidth(20.0),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(28),
            ),
            Text(data.task),
          ],
        ),
      ),
    );
  }
}
