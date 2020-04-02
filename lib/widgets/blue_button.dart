import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  String text;
  Function onPressed;

  BlueButton(this.text,this.onPressed){}

  @override
  Widget build(BuildContext context,) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      color: Colors.blue,
      onPressed: onPressed,
    );
  }
}
