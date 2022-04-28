

import 'package:flutter/material.dart';
import 'package:riders_app/views/MyAttendence/Calendar/event.dart';
import 'package:table_calendar/table_calendar.dart';



class TableEventsExample extends StatefulWidget {
  TableEventsExample({Key? key}) : super(key: key);

  final List<DateTime> highLights = [
    DateTime(2022, DateTime.april, 14),
    DateTime(2022, DateTime.april, 4),
    DateTime(2022, DateTime.april, 23),
    DateTime(2022, DateTime.april, 30),
  ];

  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    // _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TableCalendar<Event>(
            calendarBuilders:
                CalendarBuilders(defaultBuilder: (context, day, focusedDay) {
              for (DateTime d in widget.highLights) {
                if (day.day == d.day) {
                  return Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 167, 238, 144),
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
              }
            }),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              isTodayHighlighted: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}










// // ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
// import 'package:flutter/material.dart';
// import 'package:riders_app/_helpers/constants.dart';
// import 'package:riders_app/views/MyAttendence/attendence.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({Key? key}) : super(key: key);

//   @override
//   State<CalendarScreen> createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   // DateTime selectedDate = DateTime.now();
//   // DateTime initialDate = DateTime.now();

//   CalendarFormat format = CalendarFormat.month;

//   DateTime selectedDay = DateTime.now();
//   DateTime focusedDay = DateTime.now();

//   DateTime selectedDay1 = DateTime.now();
//   DateTime focusedDay1 = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_rounded,
//               color: kPrimaryPurpleColor,
//               size: 25.0,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//         body: NotificationListener<OverscrollIndicatorNotification>(
//           onNotification: (OverscrollIndicatorNotification overscroll) {
//             // ignore: deprecated_member_use
//             overscroll.disallowGlow();
//             return false;
//           },
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "My Attendance",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: kPrimaryPurpleColor),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                       height: MediaQuery.of(context).size.height * 0.45,
//                       width: MediaQuery.of(context).size.width * 1,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                       ),
//                       child: TableCalendar(
//                         focusedDay: selectedDay,
//                         firstDay: DateTime(1990),
//                         lastDay: DateTime(2030),
//                         calendarFormat: format,
//                         // onFormatChanged: (CalendarFormat _format) {
//                         //   setState(() {
//                         //     format = _format;
//                         //   });
//                         // },
//                         daysOfWeekVisible: true,
//                         onDaySelected: (DateTime selectDay, DateTime focusDay) {
//                           setState(() {
//                             selectedDay = selectDay;
//                             focusedDay = focusDay;
//                           });
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => AttendanceDetails()));
//                         },
//                         selectedDayPredicate: (DateTime date) {
//                           return isSameDay(selectedDay, date);
//                         },
//                         calendarStyle: CalendarStyle(
//                           isTodayHighlighted: true,
//                           selectedDecoration: BoxDecoration(
//                               color: Colors.green.shade50,
//                               shape: BoxShape.circle),
//                           selectedTextStyle:
//                               TextStyle(color: Colors.green.shade600),
//                           todayDecoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             shape: BoxShape.circle,
//                           ),
//                           todayTextStyle:
//                               TextStyle(color: Colors.grey.shade600),
//                           holidayDecoration: BoxDecoration(
//                             color: Colors.pink.shade100,
//                             shape: BoxShape.circle,
//                           ),
//                           holidayTextStyle: TextStyle(color: Colors.pink.shade600),
//                         ),
//                         headerStyle: HeaderStyle(
//                           formatButtonVisible: false,
//                           formatButtonShowsNext: true,
//                         ),
//                       )),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   // Calendar 2

//                   Container(
//                       height: MediaQuery.of(context).size.height * 0.45,
//                       width: MediaQuery.of(context).size.width * 1,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                       ),
//                       child: TableCalendar(
//                         focusedDay: selectedDay,
//                         firstDay: DateTime(1990),
//                         lastDay: DateTime(2030),
//                         calendarFormat: format,
//                         daysOfWeekVisible: true,
//                         onDaySelected: (DateTime selectDay, DateTime focusDay) {
//                           setState(() {
//                             selectedDay1 = selectDay;
//                             focusedDay1 = focusDay;
//                           });
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => AttendanceDetails()));
//                         },
//                         selectedDayPredicate: (DateTime date) {
//                           return isSameDay(selectedDay1, date);
//                         },
//                         calendarStyle: CalendarStyle(
//                           isTodayHighlighted: true,
//                              todayDecoration: BoxDecoration(
//                               color: Colors.transparent,
//                               shape: BoxShape.circle),
//                            todayTextStyle:
//                               TextStyle(color: Colors.yellow.shade600),
//                           selectedDecoration: BoxDecoration(
//                             color: Colors.red.shade50,
//                             shape: BoxShape.circle,
//                           ),
//                            selectedTextStyle: TextStyle(color: Colors.red.shade600),
//                           holidayDecoration: BoxDecoration(
//                             color: Colors.pink.shade100,
//                             shape: BoxShape.circle,
//                           ),
//                           holidayTextStyle: TextStyle(color: Colors.pink.shade600),
//                         ),
//                         headerStyle: HeaderStyle(
//                           formatButtonVisible: false,
//                           formatButtonShowsNext: true,
//                         ),
//                       )),
//                   SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }







