// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/MyAttendence/Calendar/event.dart';
import 'package:riders_app/views/MyAttendence/attendence.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({Key? key}) : super(key: key);

  final List<DateTime> highLights = [
    DateTime(2022, DateTime.april, 10),
    DateTime(2022, DateTime.april, 25),
   
  ];

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  DateTime _focusedDay2 = DateTime.now();
  DateTime? _selectedDay2;

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
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AttendanceDetails()));
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

  void _onDaySelected2(DateTime selectedDay2, DateTime focusedDay2) {
    if (!isSameDay(_selectedDay2, selectedDay2)) {
      setState(() {
        _selectedDay2 = selectedDay2;
        _focusedDay2 = focusedDay2;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AttendanceDetails()));
    }
  }

  void _onRangeSelected2(DateTime? start, DateTime? end, DateTime focusedDay2) {
    setState(() {
      _selectedDay2 = null;
      _focusedDay2 = focusedDay2;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: kPrimaryPurpleColor,
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
                    "My Attendance",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryPurpleColor),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TableCalendar<Event>(
                        calendarBuilders: CalendarBuilders(
                            defaultBuilder: (context, daypar, focusedDay) {
                          for (DateTime d in widget.highLights) {
                            if (daypar.day == d.day) {
                              // print('daypar-------------');
                              // print(daypar);
                              // print(daypar.day);
                              // print(d);
                              return Container(
                                height: 40,
                                width: 30,
                                margin: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color:
                                        d.day == 10 ? Colors.blue.shade50 : Colors.green.shade50,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0))),
                                child: Center(
                                  child: Text(
                                    '${daypar.day}',
                                    style:    d.day == 10 ? TextStyle(color: Colors.blue.shade600,fontSize: 16):TextStyle(color: Colors.green.shade500,fontSize: 16),
                                  ),
                                ),
                              );
                            }
                          }
                        }),
                        firstDay: kFirstDay,
                        lastDay: kLastDay,
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) =>
                            isSameDay(_selectedDay, day),
                        rangeStartDay: _rangeStart,
                        rangeEndDay: _rangeEnd,
                        calendarFormat: _calendarFormat,
                        rangeSelectionMode: _rangeSelectionMode,
                        startingDayOfWeek: StartingDayOfWeek.monday,
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
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                          selectedDecoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle),
                          selectedTextStyle:
                              TextStyle(color: Colors.grey.shade600,fontSize: 16),
                          todayDecoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          todayTextStyle: TextStyle(
                              color: kPrimaryPurpleColor, fontSize: 16),
                          holidayDecoration: BoxDecoration(
                            color: Colors.pink.shade100,
                            shape: BoxShape.circle,
                          ),
                          holidayTextStyle:
                              TextStyle(color: Colors.pink.shade600),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          formatButtonShowsNext: true,
                          
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  // Calendar 2

                  Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TableCalendar<Event>(
                        calendarBuilders: CalendarBuilders(
                            defaultBuilder: (context, day, focusedDay2) {
                          for (DateTime d in widget.highLights) {
                            if (day.day == d.day) {
                                return Container(
                                height: 40,
                                width: 30,
                                margin: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color:
                                        d.day == 10 ? Colors.black : Colors.transparent,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0))),
                                child: Center(
                                  child: Text(
                                    '${day.day}',
                                    style:    d.day == 10 ? TextStyle(color: Colors.white,fontSize: 16):TextStyle(color: Colors.black,fontSize: 16),
                                  ),
                                ),
                              );
                            }
                          }
                        }),
                        firstDay: kFirstDay,
                        lastDay: kLastDay,
                        focusedDay: _focusedDay2,
                        selectedDayPredicate: (day) =>
                            isSameDay(_selectedDay2, day),
                        rangeStartDay: _rangeStart,
                        rangeEndDay: _rangeEnd,
                        calendarFormat: _calendarFormat,
                        rangeSelectionMode: _rangeSelectionMode,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        onDaySelected: _onDaySelected2,
                        onRangeSelected: _onRangeSelected2,
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay2) {
                          _focusedDay2 = focusedDay2;
                        },
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                          todayDecoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle),
                          todayTextStyle: TextStyle(
                              color: Colors.yellow.shade500, fontSize: 16),
                          selectedDecoration: BoxDecoration(
                            color: Colors.red.shade50,
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle:
                              TextStyle(color: Colors.red.shade600,fontSize: 16),
                          holidayDecoration: BoxDecoration(
                            color: Colors.pink.shade100,
                            shape: BoxShape.circle,
                          ),
                          holidayTextStyle:
                              TextStyle(color: Colors.pink.shade600),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          formatButtonShowsNext: true,
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
