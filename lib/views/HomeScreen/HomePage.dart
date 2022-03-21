import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/Components/HomePageButton.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/Login/login.dart';
import 'package:riders_app/views/TaskManagement/taskmanagement.dart';

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
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            
          ),
               actions: [
          TextButton(
            onPressed: () {},
            child:  Text(
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
            child: Form(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              HomePageButyton(
                text: "Assignments",
                function: ()  {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskManagementScreen()),
              );
                  
                },
              ),
              SizedBox(height: screenHeight * (1 / 20)),
              HomePageButyton(
                text: "Manage Tasks",
                function: () async {},
              ),
            ]))));
  }
}
