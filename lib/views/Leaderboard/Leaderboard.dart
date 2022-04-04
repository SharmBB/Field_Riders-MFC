
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/HomeScreen/HomePage.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  final List<Map<String, dynamic>> _LeaderBoard = [
    {"id": "01", "name": "Andy", "Scores": "1500 points"},
    {"id": "02", "name": "Aragon", "Scores": "1500 points"},
    {"id": "03", "name": "Bob", "Scores": "1500 points"},
    {"id": "04", "name": "Barbara", "Scores": "1500 points"},
    {"id": "05", "name": "Candy", "Scores": "1500 points"},
    {"id": "06", "name": "Colin", "Scores": "1500 points"},
  ];

  // // Item of the ListView re usable
  // Widget _listItem(index) {
  //   return Container(
  //     padding: const EdgeInsets.all(10),
  //     child: ListTile(
  //       leading: Text(_peopleData[index]['name'].toString(),
  //           style: const TextStyle(fontSize: 18)),
  //       // title: Text(
  //       //   _peopleData[index]['name'].toString(),
  //       //   style: const TextStyle(fontSize: 18),
  //       // ),
  //       trailing: Text(index.toString(),
  //           style: const TextStyle(fontSize: 18, color: Colors.purple)),
  //     ),
  //     decoration: const BoxDecoration(
  //         border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: kPrimaryPurpleColor),
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: kPrimaryPurpleColor,
            ),
          ),
        ],
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
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 20.0,
              right: 20.0,
              bottom: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Scoreboard",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                const SizedBox(
                  height: 15,
                ),
                
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.8,
                  child: ListView.builder(
                    itemCount: _LeaderBoard.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                       SizedBox(
                  height: 20,
                ),
                
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_LeaderBoard[index]["name"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: kPrimaryPurpleColor)),
                              Text(_LeaderBoard[index]["id"].toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: kPrimaryPurpleColor)),
                            ],
                          ),
                 
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Scores",
                                    style: TextStyle(
                                        fontSize: 14, color: primaryColor)),
                                Text(_LeaderBoard[index]["Scores"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kPrimaryGreyColor)),
                              ],
                            ),
                          ),
                                 SizedBox(
                  height: 20,
                ),
                          Divider()
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
