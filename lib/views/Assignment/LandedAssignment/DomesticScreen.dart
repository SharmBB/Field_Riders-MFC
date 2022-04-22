// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/Assignment/LandedAssignment/DeptAssignID.dart';
import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Close.dart';
import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Owner.dart';
import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Tenant.dart';

import 'Occupier/Vacant.dart';

class DomesticScreen extends StatefulWidget {
  const DomesticScreen({Key? key}) : super(key: key);

  @override
  State<DomesticScreen> createState() => _DomesticScreenState();
}

class _DomesticScreenState extends State<DomesticScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController imagecontroller = TextEditingController();

  String occupierinitvalue = 'Choose';
  final occupiertype = [
    'Choose',
    'Owner',
    'Tenant',
    'Vacant',
    'Closed',
  ];

  bool occupier = false;
  bool owner = false;
  bool tenant = false;
  bool close = false;

  //OWNER INPUTS
  String ownernamecorrectinitvalue = 'Yes';
  TextEditingController correctownernamecontroller = TextEditingController();
  TextEditingController ownertelnocontroller = TextEditingController();
  String ownerpropertyusageinitvalue = 'Choose';
  String? ownerselectedNationality = '';
  String ownerpropertydomestictypeinitvalue = 'Choose';
  String ownerdrcodeinitvalue = 'Choose';
  TextEditingController ownerremarkcontroller = TextEditingController();

  //Tenant Inputs
  String tenantpropertyusageinitvalueOwner = 'Choose';
  String? tenantselectedNationality = '';
  String tenantpropertyusageinitvalue = 'Choose';
  String tenantpropertydomestictypeinitvalue = 'Choose';
  String tenantdrcodeinitvalue = 'Choose';
  TextEditingController tenantnamecontroller = TextEditingController();
  TextEditingController tenanttelnocontroller = TextEditingController();
  TextEditingController tenantremarkcontroller = TextEditingController();

  //Vacant Inputs
  String? vacantselectedMeter = '';
  String vacantpropertyusageinitvalue = 'Choose';
  String vacantpropertydomestictypeinitvalue = 'Choose';
  String vacantdrcodeinitvalue = '5 DR05 VACANT PREMISE';
  TextEditingController vacantremarkcontroller = TextEditingController();
  TextEditingController vacantwaterMetercontroller = TextEditingController();
  File? vacantimage;

  //Close Inputs
  String closepropertyusageinitvalueOwner = 'Choose';
  String closepropertyusageinitvalue = 'Choose';
  String closepropertydomestictypeinitvalue = 'Choose';
  String closedrcodeinitvalue =
      '22 DR22 CLOSED (PLEASE INSERT TOTAL OF VISITATION INTO COLUMN "NUMBER OF VISITATION")';
  TextEditingController closeremarkcontroller = TextEditingController();

  // File? _image;
  // bool image = false;

  // _getFromCamera() async {
  //   PickedFile? pickedFile = await ImagePicker()
  //       .getImage(source: ImageSource.camera, imageQuality: 50
  //           // maxWidth: 1800,
  //           // maxHeight: 1800,
  //           );
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //       //uploadFile();
  //       image = true;
  //     });
  //   }
  // }

  // actionsheetTakePhoto(BuildContext context) {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) {
  //       return CupertinoActionSheet(
  //         actions: [
  //           CupertinoActionSheetAction(
  //               onPressed: () async {
  //                 _camera = true;
  //                 _getMultiFromCamera();
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Align(
  //                   alignment: Alignment.topLeft, child: Text("Camera"))),
  //           CupertinoActionSheetAction(
  //               onPressed: () async {
  //                 // _getFromGallery();
  //                 getMultiImages();
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Align(
  //                   alignment: Alignment.topLeft, child: Text("Upload"))),
  //         ],
  //         cancelButton: CupertinoActionSheetAction(
  //           child: const Text("Cancel"),
  //           onPressed: () => Navigator.of(context).pop(),
  //         ),
  //       );
  //     },
  //   );
  // }

  File? _image1;
  List<File>? imageFileList = [];

  _getMultiFromCamera() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50
            // maxWidth: 1800,
            // maxHeight: 1800,
            );
    if (pickedFile != null) {
      setState(() {
        _image1 = File(pickedFile.path);
        //uploadFile();
        imageFileList!.add(_image1!);
      });
      
    }
    print(imageFileList);
  }

  // final multiPicker = ImagePicker();
  // List<File>? imageFileList = [];

  // Future getMultiImages() async {
  //   _camera = false;

  //   // _imageCamera.clear();

  //   final List<XFile>? selectedImages = await multiPicker.pickMultiImage();
  //   selectedImages!.forEach((image) {
  //     setState(() {
  //       imageFileList!.add(File(image.path));
  //     });

  //     print(imageFileList);
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  final CustomTimerController _controller = CustomTimerController();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: kPrimaryPurpleColor,
            size: 25.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box),
            color: Colors.deepPurple,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.download_sharp),
            color: Colors.deepPurple,
            onPressed: () {},
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
              padding: EdgeInsets.only(
                left: 20,
                right: 20.0,
                bottom: 20,
                top: 10,
              ),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                                color: kPrimaryPurpleColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: CustomTimer(
                                controller: _controller,
                                from: Duration(minutes: 05),
                                to: Duration(hours: 0),
                                onBuildAction: CustomTimerAction.auto_start,
                                builder: (CustomTimerRemainingTime remaining) {
                                  return Text(
                                    "${remaining.minutes}:${remaining.seconds}",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: kPrimaryWhiteColor),
                                  );
                                },
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.timer_outlined,
                              color: kPrimaryPurpleColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                     SizedBox(
                        height: 10,
                      ),

                     Text(
                        "ID :1",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    Text(
                        "Bill:X6356185",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "SAN:41898081",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                     SizedBox(
                        height: 20,
                      ),
                   Text(
                        "Owner1: Name1",
                        // "@ NEW HOW . (If Owner 2 is available show else don't need )",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    Text(
                        "Owner2: Name 2",
                        // "@ NEW HOW . (If Owner 2 is available show else don't need )",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // const Text(
                      //   "(Address1,Address2,Address3,Address4) 4 JALAN TIMOR 12,TAMAN TIMOR,81300 JOHOR BAHRU,JOHOR",
                      //   style: TextStyle(
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w600,
                      //       color: kPrimaryPurpleColor),
                      // ),
                    SizedBox(
                        height: 20,
                      ),
                     Text(
                        "Range5: >120 months",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    Text(
                        "Arrears:1,226.25",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                     SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Total Payable Amount:1,317.85",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Take Photo DropDown
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Take Photo",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 250,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () async {
                                  _controller.pause();
                                  _getMultiFromCamera();
                                },
                                child: Container(
                                  child: imageFileList!.isEmpty
                                      ? Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            // borderRadius: BorderRadius.circular(50)
                                          ),
                                          width: screenWidth * 0.9,
                                          height: screenHeight * 0.3,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.grey[400],
                                          ),
                                        )
                                      : GridView.builder(
                                          itemCount: imageFileList!.isEmpty
                                              ? 1
                                              : imageFileList!.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 20,
                                            crossAxisSpacing: 20,
                                            // width / height: fixed for *all* items
                                            childAspectRatio: 0.75,
                                          ),
                                          itemBuilder: (context, index) =>
                                              Stack(
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.5))),
                                                child: Image.file(
                                                  File(imageFileList![index]
                                                      .path),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Stack(
                                                children: <Widget>[
                                                  Positioned(
                                                    right: -10,
                                                    top: -10,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          imageFileList!
                                                              .removeAt(index);
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 2,
                                                          bottom: 2,
                                                        ),
                                                        height: 40,
                                                        width: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .redAccent[400],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: Icon(
                                                            Icons.cancel,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                left: -10,
                                                top: -10,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    print(index);
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                      left: 5,
                                                      bottom: 2,
                                                    ),
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.redAccent[400],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Text(
                                                        (index+1).toString(),
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Stop/Start Timer",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlatButton(
                                child: Text("Photo Upload"),
                                onPressed: () {
                                  _controller.start();
                                },
                                color: kPrimaryPurpleColor,
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              // FlatButton(
                              //   child: Text("Pause"),
                              //   onPressed: () {
                              //     _controller.pause();
                              //   },
                              //   color: kPrimaryPurpleColor,
                              // ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Occupier DropDown

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Occupier(Owner/Tenant )",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.deepPurple,
                              ),
                              value: occupierinitvalue,
                              isExpanded: true,
                              items: occupiertype.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          fontSize: 14, color: primaryColor)),
                                );
                              }).toList(),
                              onChanged: (String? value) async {
                                setState(() {
                                  //  print( ownernamecorrectinitvalue, ownertelnocontroller, correctownernamecontroller, _selectedNationality, propertydomestictypeinitvalue, drcodeinitvalue, remarkcontroller);

                                  occupierinitvalue = value!;
                                  if (occupierinitvalue ==
                                      'Vacant**(please take photo for watermark)') {
                                    close = false;
                                    occupier = true;
                                    tenant = false;
                                    owner = false;
                                  } else if (occupierinitvalue == 'Closed') {
                                    close = true;
                                    occupier = false;
                                    tenant == false;
                                    owner = false;
                                  } else if (occupierinitvalue == 'Owner') {
                                    owner = true;
                                    tenant = false;
                                    occupier = false;
                                    close = false;
                                  } else if (occupierinitvalue == 'Tenant') {
                                    tenant = true;
                                    owner = false;
                                    occupier = false;
                                    close = false;
                                  } else {
                                    tenant = false;
                                    owner = false;
                                    occupier = false;
                                    close = false;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      owner == true
                          ? Owner(
                              context,
                              ownernamecorrectinitvalue,
                              ownertelnocontroller,
                              correctownernamecontroller,
                              ownerselectedNationality,
                              ownerpropertyusageinitvalue,
                              ownerpropertydomestictypeinitvalue,
                              ownerdrcodeinitvalue,
                              ownerremarkcontroller)
                          : SizedBox(),

                      tenant == true
                          ? Tenant(
                              context,
                              tenantnamecontroller,
                              tenanttelnocontroller,
                              tenantselectedNationality,
                              tenantpropertyusageinitvalue,
                              tenantpropertydomestictypeinitvalue,
                              tenantdrcodeinitvalue,
                              tenantremarkcontroller)
                          : SizedBox(),

                      // Property Usage DropDown
                      occupier == true
                          ? Vacant(
                              context,
                              vacantpropertyusageinitvalue,
                              vacantpropertydomestictypeinitvalue,
                              vacantdrcodeinitvalue,
                              vacantremarkcontroller,
                              vacantselectedMeter,
                              vacantwaterMetercontroller)
                          : SizedBox(),

                      close == true
                          ? Close(
                              context,
                              closepropertyusageinitvalue,
                              closepropertydomestictypeinitvalue,
                              closedrcodeinitvalue,
                              closeremarkcontroller)
                          : SizedBox(),

                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              openSubmit(context);
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          )),
    );
  }

  Future openSubmit(BuildContext context) => showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.9,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.white,
                content: Column(
                  children: [
                    Text(
                      "Sucessfull Added",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryPurpleColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("All Records Inserted",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                  ],
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      width: 80,
                      height: 40,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryPurpleColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: Text(
                          "OK",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        }),
      );
}
