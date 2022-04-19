// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/ListAssignment/Domestric/DeptAssignment.dart';
import 'package:riders_app/views/ListAssignment/Domestric/DomesticScreen.dart';

import 'package:riders_app/views/Verification%20Screen/taskVerification.dart';
import 'package:riders_app/views/check.dart';

import 'package:riders_app/views/field/feild.dart';

class DeptAssignID extends StatefulWidget {
  final String type;
  const DeptAssignID({Key? key, required this.type}) : super(key: key);

  @override
  State<DeptAssignID> createState() => __DeptAssignIDState();
}

class __DeptAssignIDState extends State<DeptAssignID> {
  late String type;

  @override
  void initState() {
    type = widget.type;
    _foundUsers = feild;
    super.initState();
  }

  final List<Map<String, dynamic>> feild = [
    {
      'Name': '1',
      'SAN': '27933712',
      'Owner 1': 'ABIDEN BIN SABARI',
      "Address": '25 JALAN 24/22 SEKSYEN 24 40300 SHAH ALAM SELANGOR',
      "Date Assign": '22/02/2022',
      "Payment Update": "-",
      'Status': 'Outstanding'
    },
    {
      'Name': '2',
      'SAN': '27933712',
      'Owner 1': 'ABIDEN BIN SABARI',
      "Address": '25 JALAN 24/22 SEKSYEN 24 40300 SHAH ALAM SELANGOR',
      "Date Assign": '22/02/2022',
      "Payment Update": "-",
      'Status': 'Outstanding'
    },
    {
      'Name': '3',
      'SAN': '27933712',
      'Owner 1': 'ABIDEN BIN SABARI',
      "Address": '25 JALAN 24/22 SEKSYEN 24 40300 SHAH ALAM SELANGOR',
      "Date Assign": '22/02/2022',
      "Payment Update": "-",
      'Status': 'Outstanding'
    },
    // {
    //   'Name': '10825',
    //   'SAN': '27933712',
    //   'Owner 1': 'ABIDEN BIN SABARI',
    //   "Address": '25 JALAN 24/22 SEKSYEN 24 40300 SHAH ALAM SELANGOR',
    //   "Date Assign": '22/02/2022',
    //   "Payment Update": "-",
    //   'Status': 'Outstanding'
    // },
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = feild;
    } else {
      results = feild
          .where((user) =>
              user["Name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  bool tick1 = false;
  bool tick2 = false;
  bool tick3 = false;
  bool tick4 = false;
  bool tick5 = false;
  bool tick6 = false;
  bool tick7 = false;
  bool tick8 = false;

  List Arr = [];
  bool search = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FieldScreen()),
            );
          },
        ),
        actions: [
          search == true
              ? Container(
                  width: 250.0,
                  child: TextField(
                    cursorColor: kPrimaryPurpleColor,
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: kPrimaryPurpleColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: kPrimaryPurpleColor,
                        onPressed: () {
                          setState(() {
                            search = false;
                          });
                        },
                      ),
                    ),
                  ),
                )
              : IconButton(
                  icon:  Icon(Icons.search_sharp),
                  color: Colors.deepPurple,
                  onPressed: () {
                    setState(() {
                      search = true;
                    });
                  },
                ),
          IconButton(
            icon:  Icon(Icons.add_box),
            color: Colors.deepPurple,
            onPressed: () {
              openDialog(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.download_sharp),
            color: Colors.deepPurple,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TaskVerificationScreen()),
              );
            },
          )
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          // ignore: deprecated_member_use
          overscroll.disallowGlow();
          return false;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 10.0,
                right: 10.0,
                bottom: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Assignment",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "List Of Task 2021-D-F28-RCF24F25-LND-(SELANGOR)(21/12/2021 to 16/02/2022)",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Column Visibility",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.6,
                            child: type == null
                                ? SizedBox()
                                : Text(
                                    type,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 14.0,
                                    ),
                                  ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: kPrimaryPurpleColor,
                            ),
                            onPressed: () {
                              actionsheetSearch(context);
                            },
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: screenHeight * 0.6,
                    width: screenWidth,
                    child: _foundUsers.isNotEmpty
                        ? ListView.builder(
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (_foundUsers[index]['Name'] == '1') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DomesticScreen()),
                                      );
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DomesticScreen()));
                                    }
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "IWK Id: ",
                                                style: TextStyle(
                                                  color: kPrimaryPurpleColor,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                _foundUsers[index]['Name'],
                                                style: TextStyle(
                                                  color: kPrimaryPurpleColor,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                         
                                       
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "SAN",
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  _foundUsers[index]['SAN'],
                                                  style: TextStyle(
                                                    color: kPrimaryGreyColor,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Owner 1",
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  _foundUsers[index]['Owner 1'],
                                                  style: TextStyle(
                                                    color: kPrimaryGreyColor,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Address",
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 200,
                                                  child: Text(
                                                    _foundUsers[index]
                                                        ['Address'],
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color: kPrimaryGreyColor,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Date Assign",
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  _foundUsers[index]
                                                      ['Date Assign'],
                                                  style: TextStyle(
                                                    color: kPrimaryGreyColor,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Payment Update",
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  _foundUsers[index]
                                                      ['Payment Update'],
                                                  style: TextStyle(
                                                    color: kPrimaryGreyColor,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Status",
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  _foundUsers[index]['Status'],
                                                  style: TextStyle(
                                                    color: kPrimaryGreyColor,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Text(
                            'No search results found',
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  actionsheetSearch(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      if (tick1 == false) {
                        tick1 = true;

                        Arr.add("#");
                        print(Arr.toString());
                      } else {
                        tick1 = false;
                        Arr.remove("#");
                        print(Arr.toString());
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("#"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 7 / 10,
                      ),
                      tick1 == true
                          ? Icon(Icons.check, color: Colors.blue)
                          : SizedBox(),
                    ],
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      if (tick2 == false) {
                        tick2 = true;

                        Arr.add("IWK ID");
                        print(Arr.toString());
                      } else {
                        tick2 = false;
                        Arr.remove("IWK ID");
                        print(Arr.toString());
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("IWK ID"),
                      tick2 == true
                          ? Icon(Icons.check, color: Colors.blue)
                          : SizedBox(),
                    ],
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      if (tick3 == false) {
                        tick3 = true;

                        Arr.add("San");
                        print(Arr.toString());
                      } else {
                        tick3 = false;
                        Arr.remove("San");
                        print(Arr.toString());
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("San"),
                      tick3 == true
                          ? Icon(Icons.check, color: Colors.blue)
                          : SizedBox(),
                    ],
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      if (tick4 == false) {
                        tick4 = true;

                        Arr.add("Owner 1");
                        print(Arr.toString());
                      } else {
                        tick4 = false;
                        Arr.remove("Owner 1");
                        print(Arr.toString());
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Owner 1"),
                      tick4 == true
                          ? Icon(Icons.check, color: Colors.blue)
                          : SizedBox(),
                    ],
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      if (tick5 == false) {
                        tick5 = true;

                        Arr.add("Address");
                        print(Arr.toString());
                      } else {
                        tick5 = false;
                        Arr.remove("Owner 1");
                        print(Arr.toString());
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Address"),
                      tick5 == true
                          ? Icon(Icons.check, color: Colors.blue)
                          : SizedBox(),
                    ],
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      if (tick6 == false) {
                        tick6 = true;

                        Arr.add("Assign Date");
                        print(Arr.toString());
                      } else {
                        tick6 = false;
                        Arr.remove("Owner 1");
                        print(Arr.toString());
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Assign Date"),
                      tick6 == true
                          ? Icon(Icons.check, color: Colors.blue)
                          : SizedBox(),
                    ],
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      if (tick7 == false) {
                        tick7 = true;

                        Arr.add("Payment Update");
                        print(Arr.toString());
                      } else {
                        tick7 = false;
                        Arr.remove("Payment Update");
                        print(Arr.toString());
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Payment Update"),
                      tick7 == true
                          ? Icon(Icons.check, color: Colors.blue)
                          : SizedBox(),
                    ],
                  ),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      if (tick8 == false) {
                        tick8 = true;

                        Arr.add("Status");
                        print(Arr.toString());
                      } else {
                        tick8 = false;
                        Arr.remove("Status");
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Status"),
                      tick8 == true
                          ? Icon(Icons.check, color: Colors.blue)
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
              cancelButton: Column(
                children: [
                  CupertinoActionSheetAction(
                      child: const Text("Select"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeptAssignID(
                              type: Arr.reduce(
                                (value, element) {
                                  return value + "," + element;
                                },
                              ),
                            ),
                          ),
                        );
                      }),
                  Divider(
                    thickness: 5,
                  ),
                  CupertinoActionSheetAction(
                      child: const Text("Cancel"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeptAssignID(type: '')),
                        );
                      }),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Center(
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 10,
              width: MediaQuery.of(context).size.height * 1 / 10,
              child: Column(
                children: const [
                  Center(
                    child: Text(
                      "Sample Confirmation",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text("Action Was Successfull",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                  )
                ],
              ),
            ),
            actions: [
              Center(
                child: SizedBox(
                  width: 80.0,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: const Text(
                      "OK",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
