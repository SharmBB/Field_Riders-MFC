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



    @override
  void initState() {
 
    _foundUsers = _LeaderBoard;
    super.initState();
  }



  final List<Map<String, dynamic>> _LeaderBoard = [
    {"id": "01", "name": "Andy", "Scores": "1500 points"},
    {"id": "02", "name": "Aragon", "Scores": "1500 points"},
    {"id": "03", "name": "Bob", "Scores": "1500 points"},
    {"id": "04", "name": "Barbara", "Scores": "1500 points"},
    {"id": "05", "name": "Candy", "Scores": "1500 points"},
    {"id": "06", "name": "Colin", "Scores": "1500 points"},
  ];

 List<Map<String, dynamic>> _foundUsers = [];

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _LeaderBoard;
    } else {
      results = _LeaderBoard
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
  bool search = false;

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
           search == true
              ? Container(
                  width: 300.0,
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
                  icon: const Icon(Icons.search_sharp),
                  color: Colors.deepPurple,
                  onPressed: () {
                    setState(() {
                      search = true;
                    });
                  },
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
                  child: _foundUsers.isNotEmpty
                        ? ListView.builder(
                    itemCount: _foundUsers.length,
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
                              Text(_foundUsers[index]["name"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: kPrimaryPurpleColor)),
                              Text(_foundUsers[index]["id"].toString(),
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
                                Text(_foundUsers[index]["Scores"],
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
                  ):  Text(
                            'No search results found',
                            style: TextStyle(fontSize: 16),
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
