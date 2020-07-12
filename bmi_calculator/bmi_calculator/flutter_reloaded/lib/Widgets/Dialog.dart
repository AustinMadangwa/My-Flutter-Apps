import 'package:flutter/material.dart';
import 'package:flutter_reloaded/Widgets/Login%20Page.dart';
import 'package:flutter_reloaded/Widgets/custom_modal_action_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDialog extends StatelessWidget {
  final VoidCallback newPage;
  AddDialog({
    @required this.newPage
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: Text(
              'Login or Register',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setWidth(25),
                color: Colors.orange
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(20),),
          Center(
            child: Text(
              'You are not signed in, do you wanna register or login?',
              style: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(20),),
          CustomModalActionButton(
            onClose:(){
              Navigator.of(context).pop();
            },
            onSave: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
            save: 'Login',
            close: 'Cancel',
          )
        ],
      ),
    );
  }
}
