import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/Components/TaskCompletedButton.dart';
import 'package:riders_app/_helpers/constants.dart';

class TaskVerificationScreen extends StatefulWidget {
   TaskVerificationScreen({Key? key}) : super(key: key);

  @override
  State<TaskVerificationScreen> createState() => _TaskVerificationScreenState();
}

class _TaskVerificationScreenState extends State<TaskVerificationScreen> {
  bool _checkbox = false;
  bool _checkboxListTile = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Task completed verification ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CheckboxListTile(
              activeColor: kPrimaryPurpleColor,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('Click for meter connected'),
              value: _checkboxListTile,
              onChanged: (value) {
                setState(() {
                  _checkboxListTile = !_checkboxListTile;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 25, right: 10),
              child: Text(
                "Please click verification checkbox to submit complete taskID :10825",
                style: TextStyle(
                  color: kPrimaryGreyColor,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: screenHeight * (0.75 / 20)),
            TaskCompletedButton(
              text: "Submit",
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
