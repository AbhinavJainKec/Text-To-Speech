import 'package:flutter/material.dart';
import 'constants.dart';

class RoundedButton extends StatelessWidget {
  final Color myButtonColor;
  final String myButtonText;
  final Function myButtonFunction;

  RoundedButton(
      {@required this.myButtonColor,
      @required this.myButtonText,
      @required this.myButtonFunction});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(color: myButtonColor, width: 2),
      color: myButtonColor,
      onPressed: myButtonFunction,
      child: Text(
        myButtonText,
        style: kButtonStyle, 
      ),
      highlightColor: myButtonColor,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
  }
}
