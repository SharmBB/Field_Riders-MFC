 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future openDate(BuildContext context,selectedDate) async {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 10),
            backgroundColor: Colors.transparent,
            content: Container(
              // margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 60),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: CalendarDatePicker(
                
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 10),
                lastDate: DateTime(DateTime.now().year + 10),
                onDateChanged: (DateTime picked) async {
                  
                  if (picked != null && picked != selectedDate)
                    setState(() {
                      selectedDate = picked;
                      print(selectedDate);
                    });
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        });
      },
    );
  }
