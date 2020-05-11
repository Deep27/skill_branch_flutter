import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomButton({Key key, this.onPressed, this.title}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  var _isButtonColored = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(widget.title ?? 'Button'),
      color: _isButtonColored ? Colors.red : Colors.black54,
      onPressed: () {
        if (widget.onPressed != null) {
          widget.onPressed();
        }
        setState(() => _isButtonColored = !_isButtonColored);
      },
    );
  }
}
