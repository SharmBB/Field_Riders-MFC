import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';

class QRCodeButton extends StatelessWidget {
  const QRCodeButton({Key? key, required this.text, required this.function})
      : super(key: key);
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 70.0,
      width: screenWidth * 0.80,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: kPrimaryPurpleColor),
        ),
        onPressed: function,
        padding: EdgeInsets.all(15.0),
        color: kPrimaryPurpleColor,
        textColor: Colors.white,
        child: Text(text, style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
