import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/api/api.dart';
import 'package:riders_app/views/HomeScreen/HomePage.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? password;
  String? bodyError;

  late String hid;
  late String chapterid;
  late String image;

  bool _isLoading = false;
  bool showPassword = true;
  bool showconfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: kPrimaryPurpleColor),
            onPressed: () {},
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: kPrimaryWhiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Logo.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                  SizedBox(height: screenHeight * (1 / 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * (1 / 20)),
                  _email(),
                  SizedBox(height: screenHeight * (0.5 / 20)),
                  _password(),
                  !_isLoading
                      ? bodyError != null
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Container(
                                padding: EdgeInsets.only(top: 10),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  bodyError.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ))
                          : SizedBox()
                      : SizedBox(),
                  SizedBox(height: screenHeight * (0.25 / 20)),
                  Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Your Password ?",
                            style: TextStyle(
                                fontSize: 12, color: kPrimaryPurpleColor),
                          ))),
                  SizedBox(height: screenHeight * (0.5 / 20)),
                  !_isLoading
                      ? _signIn()
                      : CupertinoActivityIndicator(
                          radius: 15,
                        ),
                ],
              ),
            ),
          ),
        ));
  }

//Email Feils
  _email() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 25, 0),
      child: TextFormField(
        style: TextStyle(fontSize: 16, color: primaryColor),
        cursorColor: kPrimaryPurpleColor,
        keyboardType: TextInputType.text,
        validator: (value) {
          RegExp regex = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
          if (value!.isEmpty) {
            return 'Email Required';
          } else if (!regex.hasMatch(value)) {
            return 'Email Required';
          }
          return null;
        },
        onSaved: (String? val) {
          password = val;
        },
        controller: _emailController,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          icon: new Icon(Icons.email,color: kPrimaryGreyColor,),
          hintText: 'Email Address',
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }

//Password Feild
  _password() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 25, 0),
      child: TextFormField(
        style: TextStyle(fontSize: 16.0, color: primaryColor),
        cursorColor: kPrimaryPurpleColor,
        keyboardType: TextInputType.text,
        obscureText: showPassword,
        validator: (value) {
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          if (value!.isEmpty) {
            return 'Password required';
          } else if (!regex.hasMatch(value)) {
            return 'Password Must contains \n - Minimum 1 Upper case \n - Minimum 1 lowercase \n - Minimum 1 Number \n - Minimum 1 Special Character \n - Minimum 8 letters';
          }
          return null;
        },
        onSaved: (String? val) {
          password = val;
        },
        controller: _passwordController,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          icon: new Icon(Icons.lock_open,color: kPrimaryGreyColor,),
          suffixIcon: IconButton(
            onPressed: () => setState(() => showPassword = !showPassword),
            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
            color: Colors.grey,
          ),
          hintText: 'Password',
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }

//Sign In Button
  _signIn() {
    return Container(
      margin: EdgeInsets.all(0),
      height: 65.0,
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: kPrimaryGreyColor),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState?.save();
            _login();
          }
        },
        padding: EdgeInsets.all(10.0),
        color: kPrimaryPurpleColor,
        textColor: Colors.white,
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

//Login CAll API
  void _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };
      var res = await CallApi().authData(data, 'login');
      var body = json.decode(res.body);
      if (body["errorMessage"] == false) {
        if (body['message']['token'] != null) {
          _scaffoldKey.currentState!.showSnackBar(
            SnackBar(
              content: Text(
                "Login Sucessfully !!",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: kPrimaryPurpleColor,
            ),
          );
          print(body['message']);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
          );
        }
      } else {
        setState(() {
          bodyError = body['message'];
        });
        print(bodyError);
      }
    } catch (e) {
      print(e);
    }

    setState(
      () {
        _isLoading = false;
      },
    );
  }
}
