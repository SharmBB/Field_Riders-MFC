import 'package:flutter/material.dart';

Widget textField(title, controller) {
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
      Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 9),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Text';
              }
              return null;
            },
            controller: controller,
            decoration: const InputDecoration(
                border: InputBorder.none, hintStyle: TextStyle(fontSize: 12)),
          ),
        ),
      ),
    ],
  );
}
