// ignore_for_file: prefer_const_constructors



import 'dart:io';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/QR%20Screen/QR_scan.dart';
import 'package:riders_app/views/ResuableTextFormFeild/reusabletextfield.dart';
import 'package:riders_app/views/List_of_FeildAssignment/Feild_List_Assignment/feild.dart';

class VacantAssignment extends StatefulWidget {
  final String id;
  final String sewacc;
  final String owner;
  final String propAdd;
  final String currentClass;

  const VacantAssignment({
    Key? key,
    required this.id,
    required this.sewacc,
    required this.owner,
    required this.propAdd,
    required this.currentClass,
  }) : super(key: key);

  @override
  State<VacantAssignment> createState() => _VacantAssignmentState();
}

class _VacantAssignmentState extends State<VacantAssignment> {
  final _formKey = GlobalKey<FormState>();
  String? id;
  String? sewacc;
  String? owner;
  String? propAdd;
  String? currentClass;

  @override
  void initState() {
    id = widget.id;
    sewacc = widget.sewacc;
    owner = widget.owner;
    propAdd = widget.propAdd;
    currentClass = widget.currentClass;

    super.initState();
  }

  TextEditingController jobIdcontroller = TextEditingController();
  TextEditingController catatancontroller = TextEditingController();

  TextEditingController komencontroller = TextEditingController();
  TextEditingController metercontroller = TextEditingController();

  String otherinitvalue = 'Choose';
  final othertype = [
    'Choose',
    'Terbakar (Burnt)',
    'Terbengkalai (Abandoned)',
    'Dirobhkan (Demolished)',
    'Digunakan untuk sarang burung (Used for bird nesting)',
    'Tanah kosong (Vacant Land)',
    'Dalam pengubahsuaian (Under renovation)'
  ];

  String other1initvalue = 'Choose';
  final other1type = [
    'Choose',
    'Premis Kerajaan (Goverment Premise)',
    'Kuarters Kerajaan (Goverment Quarters)',
    'Industri (Industry)',
    'Tempat ibadat (Place of worship)',
  ];

  String? _selectedType = '';
  String? _selectedUsage = '';
  String? _selectedConnect = '';

  final CustomTimerController _controller = CustomTimerController();


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
            size: 25.0
          ),
          onPressed: () {
                     Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            color: Colors.deepPurple,
            onPressed: () {
              
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                           QRScanPage(),)
                                  );
            },
          ),
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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Id ",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                id.toString(),
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SEWACC",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                sewacc.toString(),
                                style: TextStyle(
                                  color: kPrimaryGreyColor,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "OWNER NAME",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                owner.toString(),
                                style: TextStyle(
                                  color: kPrimaryGreyColor,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PROP_ADD",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  propAdd.toString(),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: kPrimaryGreyColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "CURRENT CLASS",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                currentClass.toString(),
                                style: TextStyle(
                                  color: kPrimaryGreyColor,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
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
                        ],
                     ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DIDUDUKI (OCCUPIED) OR KOSONG (VACANT )',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "DIDUDUKI (OCCUPIED)",
                                  groupValue: _selectedType,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedType = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "DIDUDUKI (OCCUPIED)",
                                style: TextStyle(
                                    fontSize: 12, color: primaryColor),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "KOSONG (VACANT )",
                                  groupValue: _selectedType,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedType = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "KOSONG (VACANT)",
                                style: TextStyle(
                                    fontSize: 12, color: primaryColor),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "OTHERS (PLEASE SPECIFY IN DETAIL)",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
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
                              value: otherinitvalue,
                              isExpanded: true,
                              items: othertype.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontSize: 14, color: primaryColor),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  otherinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'PENGGUNAAN KOMERSIL (COMMERCIAL USAGE ) OR Penggunaan Domestik (DOMESTIC USAGE)',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value:
                                      "PENGGUNAAN KOMERSIL (COMMERCIAL USAGE )",
                                  groupValue: _selectedUsage,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedUsage = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "PENGGUNAAN KOMERSIL (COMMERCIAL USAGE )",
                                style: TextStyle(
                                    fontSize: 12, color: primaryColor),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "Penggunaan Domestik (DOMESTIC USAGE)",
                                  groupValue: _selectedUsage,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedUsage = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "PENGUNAAN DOMESTIK (DOMESTIC USAGE)",
                                style: TextStyle(
                                    fontSize: 12, color: primaryColor),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "OTHERS (PLEASE SPECIFY IN DETAIL)",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
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
                              value: other1initvalue,
                              isExpanded: true,
                              items: other1type.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontSize: 14, color: primaryColor),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  other1initvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Adakah Meter air disambungkan jika (YA) OR Tidak - Terputus sambungan (No - Disconnected)',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "Ya - Bersambung (Yes - Connected)",
                                  groupValue: _selectedConnect,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedConnect = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Ya - Bersambung (Yes - Connected)",
                                style: TextStyle(
                                    fontSize: 12, color: primaryColor),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value:
                                      "Tidak - Terputus sambungan (No - Disconnected)",
                                  groupValue: _selectedConnect,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedConnect = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Tidak - Terputus sambungan (No - Disconnected)",
                                style: TextStyle(
                                    fontSize: 12, color: primaryColor),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Meter Number",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: screenWidth * 1,
                          height: screenHeight * 0.3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/Meter.jpg"),
                                fit: BoxFit.fitHeight,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                        ),
                      ),
                      textField("", metercontroller,"Your Answer","number"),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textField(
                          "CATATAN ATAU PINDAAN KEPADA ALAMAT HARTA (REMARKS OR AMENDMENT TO THE PROPERTY ADDRESS)",
                          catatancontroller,"Your Answer",""),
                      const SizedBox(
                        height: 20,
                      ),
                      textField(
                          "Komen lain oleh Field Officer", komencontroller,"Your Answer",""),
                      const SizedBox(
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Submiting')),
                              );
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
}
