// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/TaskManagement/taskmanagement.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FieldScreen extends StatefulWidget {
  const FieldScreen({Key? key}) : super(key: key);

  @override
  State<FieldScreen> createState() => _FieldScreenState();
}

class _FieldScreenState extends State<FieldScreen> {
  final List<Map> feild = [
    {
      'Name': '20-2021-D-F28-RCF24F25-LND (SELANGOR)',
      'Type': 'Domestric DR',
      "Created": '2021-12-12',
      "Due": '2021-12-12',
      "Task Assign": "3",
      'Progress': '10% Complete'
    },
    {
      'Name': '20-2021-D-F28-RCF24F25-LND (SELANGOR)',
      'Type': 'Domestric DR',
      "Created": '2021-12-12',
      "Due": '2021-12-12',
      "Task Assign": "3",
      'Progress': '10% Complete'
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: kPrimaryPurpleColor,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskManagementScreen()),
            );
          },
        ),
        leadingWidth: 60,
        centerTitle: true,
        title: ToggleSwitch(
          minWidth: 70.0,
          minHeight: 35.0,
          cornerRadius: 10.0,
          activeBgColors: [
            [kPrimaryWhiteColor],
            [kPrimaryWhiteColor]
          ],
          activeFgColor: primaryColor,
          inactiveBgColor: kPrimaryGreyColor,
          inactiveFgColor: primaryColor,
          initialLabelIndex: 1,
          totalSwitches: 2,
          labels: ['Office', 'Field'],
          radiusStyle: true,
          onToggle: (index) {
            print('switched to: $index');
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          // ignore: deprecated_member_use
          overscroll.disallowGlow();
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'List of assignment',
                  style: TextStyle(
                    color: kPrimaryPurpleColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.8,
                width: screenWidth,
                child: ListView.builder(
                  itemCount: feild.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 10.0,
                            right: 20.0,
                            bottom: 10,
                          ),
                          child: Text(
                            feild[index]['Name'],
                            style: TextStyle(
                              color: kPrimaryPurpleColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                            20.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Type",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    feild[index]['Type'],
                                    style: TextStyle(
                                      color: kPrimaryGreyColor,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Created date",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    feild[index]['Created'],
                                    style: TextStyle(
                                      color: kPrimaryGreyColor,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Due date",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    feild[index]['Due'],
                                    style: TextStyle(
                                      color: kPrimaryGreyColor,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Task Assign",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    feild[index]['Task Assign'],
                                    style: TextStyle(
                                      color: kPrimaryGreyColor,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Progress",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    feild[index]['Progress'],
                                    style: TextStyle(
                                      color: kPrimaryGreyColor,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 130.0,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color: kPrimaryPurpleColor,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(
                                              color: kPrimaryPurpleColor),
                                        ),
                                      ),
                                      child: Text(
                                        "Manage",
                                        style: TextStyle(
                                          color: kPrimaryPurpleColor,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
