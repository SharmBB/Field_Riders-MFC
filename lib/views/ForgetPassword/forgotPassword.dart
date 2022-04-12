// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/api/api.dart';
import 'package:riders_app/views/ForgetPassword/OTP.dart';
import 'package:riders_app/views/Login/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ForgetPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  String? email;
  String? bodyError;
  // loader
  bool _isLoading = true;

  // String? token;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: kPrimaryPurpleColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Forget Password?',
                  style: TextStyle(
                      fontSize: 24,
                      color: kPrimaryPurpleColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * (0.7 / 20)),
                const Text(
                  'We will Send a link to recover password',
                  style: TextStyle(
                    fontSize: 12,
                    color: kPrimaryPurpleColor,
                  ),
                ),
                SizedBox(height: screenHeight * (1 / 20)),
                _email(),
                SizedBox(height: screenHeight * (1 / 20)),
                _reset(),
                SizedBox(height: screenHeight * (3 / 20)),
              ],
            ),
          ),
        ));
  }

  _email() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: TextFormField(
          style: const TextStyle(fontSize: 14.0, color: primaryColor),
          cursorColor: kPrimaryPurpleColor,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            RegExp regex = RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?)*$");
            if (value == null || value.isEmpty || !regex.hasMatch(value)) {
              return 'Enter a valid email address';
            }

            return null;
          },
          onSaved: (String? val) {
            email = val;
          },
          controller: _emailController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: 'Forget Password',
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ));
  }

  _reset() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        child: ButtonTheme(
            minWidth: 100.0,
            height: 30.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryPurpleColor, // background
                onPrimary: Colors.transparent,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  _forgot();
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )),
      ),
    );
  }

  void _forgot() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = {
        "email": _emailController.text,
      };
      var res = await CallApi().postData(data, 'sendOTP');
      var body = json.decode(res.body);
      print(body);

      bodyError = body['message'];
      print(bodyError);

      if (body['match'] == true) {
      
        print(body);
        print(bodyError);

         Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) =>  OTPPage(email: _emailController.text)),
        );

         
       
      } else {}
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }
}
