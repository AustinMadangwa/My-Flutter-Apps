import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomModalActionButton extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onSave;
  final String save;
  final String close;
  CustomModalActionButton({
    @required this.onClose,
    @required this.onSave,
    @required this.close,
    @required this.save

});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          onPressed: onClose,
          buttonText: close,
          color: Colors.grey[700],
          textColor: Colors.white,
        ),
        CustomButton(
          onPressed: onSave,
          buttonText: save,
          color: Colors.orangeAccent,
          textColor: Colors.black,
        )
      ],
    );
  }
}
