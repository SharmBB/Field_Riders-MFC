// ignore_for_file: prefer_const_constructors

import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/HomeScreen/HomePage.dart';
import 'package:riders_app/views/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS',
      // home: Home(),
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primaryColor: kPrimaryPurpleColor,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple,
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide:  BorderSide(color: kPrimaryPurpleColor, width: 2.0),
          ),
          contentPadding:  EdgeInsets.fromLTRB(0, 10, 0, 0),
        ),
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'Login',
      routes: {
        'Login': (context) => HomeScreen(),
        'onboard': (context) => LoginScreen(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var userId = localStorage.getInt('userId');

    if (token != null) {
      setState(() {
        isAuth = true;
        print(localStorage.getString('token'));
        print(localStorage.getInt('userId'));
        print(userId);
        print("Successfuly loggedin");
      });
    } else {
      print(localStorage.getString('token'));
      print("Successfuly loggedin");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = HomeScreen();
    } else {
      child = LoginScreen();
    }
    return Scaffold(
      body: child,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
