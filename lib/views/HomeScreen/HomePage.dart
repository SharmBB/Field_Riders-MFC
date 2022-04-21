import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/Components/HomePageButton.dart';
import 'package:riders_app/_helpers/constants.dart';

import 'package:riders_app/views/Leaderboard/Leaderboard.dart';
import 'package:riders_app/views/List_of_FeildAssignment/Feild_List_Assignment/feild.dart';
import 'package:riders_app/views/Login/login.dart';
import 'package:riders_app/views/Profile/profile.dart';
import 'package:riders_app/views/QR%20Screen/QR_scan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: kPrimaryPurpleColor),
            onPressed: () {},
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScanPage()),
                );
              },
              child: Text(
                'Scan',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.qr_code_scanner,
                color: Colors.deepPurple,
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: kPrimaryWhiteColor,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
              HomePageButyton(
                text: "Profile",
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage()),
                  );
                },
              ),
              SizedBox(height: screenHeight * (0.5 / 20)),
              HomePageButyton(
                text: "Assignments",
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FieldScreen()),
                  );
                },
              ),
              SizedBox(height: screenHeight * (0.5 / 20)),
              HomePageButyton(
                text: "Scoreboard",
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeaderBoardScreen()),
                  );
                },
              ),
              SizedBox(height: screenHeight * (0.5 / 20)),
              HomePageButyton(
                text: "myAttendance",
                function: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => LeaderBoardScreen()),
                  // );
                },
              ),
              SizedBox(height: screenHeight * (3 / 20)),
              HomePageButyton(
                text: "Logout",
                function: () async {
                  try {
                    SharedPreferences localStorage =
                        await SharedPreferences.getInstance();
                    localStorage.remove('token');
                    localStorage.remove('userId');

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              SizedBox(height: screenHeight * (1 / 20)),
            ])));
  }
}
