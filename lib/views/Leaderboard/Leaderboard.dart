// main.dart
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:riders_app/_helpers/constants.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  final List<Map<String, dynamic>> _LeaderBoard = [
    {"id": 01, "name": "Andy", "Scores": "1500 points"},
    {"id": 02, "name": "Aragon", "Scores": "1500 points"},
    {"id": 03, "name": "Bob", "Scores": "1500 points"},
    {"id": 04, "name": "Barbara", "Scores": "1500 points"},
    {"id": 05, "name": "Candy", "Scores": "1500 points"},
    {"id": 06, "name": "Colin", "Scores": "1500 points"},
  ];

  // // Item of the ListView
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
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: kPrimaryPurpleColor),
            onPressed: () {},
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search,
                color: Colors.deepPurple,
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: _LeaderBoard.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  // leading: Text(_LeaderBoard[index]['name'].toString(),
                  //     style: TextStyle(fontSize: 18)),
                  trailing: Text(index.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.purple)),
                  title: Text(_LeaderBoard[index]["name"]),
                  subtitle: Text(_LeaderBoard[index]["name"]),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black26))),
              );
            }));
  }
}
