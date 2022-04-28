import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';

Widget textField(title, controller, hintTitle, number) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        style: const TextStyle(fontSize: 14, color: Colors.black),
        cursorColor: kPrimaryPurpleColor,
        keyboardType:
            number != 'number' ? TextInputType.text : TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return hintTitle + ' Required';
          }
        },
        controller: controller,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: hintTitle,
          hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: kPrimaryPurpleColor)),
          contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 0),
          fillColor: kPrimaryWhiteColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: kPrimaryPurpleColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(color: kPrimaryPurpleColor),
            gapPadding: 0,
          ),
        ),
      )
    ],
  );
}
