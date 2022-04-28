// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceDetails extends StatefulWidget {
  const AttendanceDetails({Key? key}) : super(key: key);

  @override
  State<AttendanceDetails> createState() => _AttendanceDetailsState();
}

class _AttendanceDetailsState extends State<AttendanceDetails> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.deepPurple,
              size: 25.0,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            // ignore: deprecated_member_use
            overscroll.disallowGlow();
            return false;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Attendance Details",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: TableCalendar(
                      focusedDay: selectedDay,
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2030),
                      calendarFormat: CalendarFormat.week,
                      daysOfWeekVisible: true,
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          focusedDay = focusDay;
                        });
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },
                      calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                          selectedDecoration: BoxDecoration(
                              color: Colors.red.shade50,
                              shape: BoxShape.circle),
                          selectedTextStyle:
                              TextStyle(color: Colors.red.shade600),
                          todayDecoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          todayTextStyle:
                              TextStyle(color: Colors.purple.shade600),
                          holidayTextStyle: TextStyle(color: Colors.pink)),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        formatButtonShowsNext: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Ansence",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Tuesday, 23 June 2022",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
