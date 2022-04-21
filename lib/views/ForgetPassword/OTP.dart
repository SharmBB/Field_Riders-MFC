// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/api/api.dart';
import 'package:riders_app/views/ForgetPassword/forgotPassword.dart';
import 'package:riders_app/views/ForgetPassword/resetPassword.dart';

class OTPPage extends StatefulWidget {
  final String email;
  const OTPPage({
    key,
    required this.email,
  }) : super(key: key);

  @override
  _ForgetOTPPageState createState() => _ForgetOTPPageState();
}

class _ForgetOTPPageState extends State<OTPPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  bool _isLoading = false;
  var onTapRecognizer;
  final FocusNode _pinPutFocusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  String? bodyError;
  String? bodySucesss;
  String? bodyFailure;
  late String email;
  // loader
  // bool _isLoading = true;

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String? countryCodeNew;
  @override
  void initState() {
    email = widget.email;
    print(email);
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldkey,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded, color: kPrimaryPurpleColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()),
                );
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKey,
                // ignore: unnecessary_new
                child: new Column(children: <Widget>[
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'OTP.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: kPrimaryPurpleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(height: screenHeight * 0.08),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 20.0, top: 0.0),
                    width: 380.0,
                    child: Text(
                      'Enter OTP',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: kPrimaryPurpleColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 80,
                        ),
                        _name(),
                        !_isLoading
                            ? bodyError != null
                                ? Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 25, 0),
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
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          child: Text(
                            'Don\'t Receive the OTP?',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50.0),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () async {
                              _resedOTP();
                              showAlertDialog(context);
                            },
                            child: Text(
                              'Resend Code',
                              style: TextStyle(
                                  color: kPrimaryPurpleColor, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SafeArea(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState?.save();
                                      _forgot();
                                    }

                                    // Navigator.of(context).pushReplacement(
                                    //   MaterialPageRoute(
                                    //       builder: (BuildContext context) =>
                                    //           ResetPassword(
                                    //             email: widget.email,
                                    //             title: '',
                                    //           )),
                                    // );
                                  },
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0.0),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                        color: Colors.white,
                                        width: 5,
                                        style: BorderStyle.solid),
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100.0)),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                        colors: [
                                          kPrimaryPurpleColor,
                                          kPrimaryPurpleColor,
                                        ],
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(15.0),
                                    child: _isLoading
                                        ? CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_forward,
                                            size: 35.0,
                                            color: Colors.white,
                                          ),
                                  ),
                                ),
                              ],
                              // 6overflow: Overflow.visible,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          )),
    );
  }

  _name() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: TextFormField(
        style: const TextStyle(fontSize: 14, color: primaryColor),
        cursorColor: kPrimaryPurpleColor,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.length < 5) {
            return "OTP required";
          } else {
            return null;
          }
        },
        controller: _nameController,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'OTP',
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }

  //resend OTP
  void _resedOTP() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = {
        "email": email,
      };
      var res = await CallApi().postData(data, 'sendOTP');
      var body = json.decode(res.body);
      print(body);

      if (body['match'] == true) {
        bodySucesss = body['message'];
        print(body);
      } else {
        bodySucesss = "OTP sent Fail !!!";
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

//forgot OTP
  void _forgot() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = {
        "email": email,
        "resetotp": _nameController.text,
      };
      var res = await CallApi().postData(data, 'checkOTP');
      var body = json.decode(res.body);
      print(body);

      bodyError = body['rider']['message'];

      if (body['rider']['match'] == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => ResetPassword(
                    email: widget.email,
                    title: '',
                  )),
        );
      } else {}
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

//resend otp sucess alert
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(
          color: kPrimaryPurpleColor,
          fontSize: 16,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("My title"),
      content: Text(
        bodySucesss.toString(),
        style: TextStyle(
          color: primaryColor,
          fontSize: 16,
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}