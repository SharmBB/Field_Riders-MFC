// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/deptAssignment/DeptAssignID.dart';

import 'package:riders_app/views/deptAssignment/reusabletextfield.dart';

class DomesticScreen extends StatefulWidget {
  const DomesticScreen({Key? key}) : super(key: key);

  @override
  State<DomesticScreen> createState() => _DomesticScreenState();
}

class _DomesticScreenState extends State<DomesticScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController imagecontroller = TextEditingController();
  TextEditingController correctownernamecontroller = TextEditingController();
  TextEditingController ownertelnocontroller = TextEditingController();
  TextEditingController tenantnamecontroller = TextEditingController();
  TextEditingController remark = TextEditingController();
  TextEditingController remarkcontroller = TextEditingController();
  TextEditingController waterMetercontroller = TextEditingController();
  TextEditingController tenanttelnocontroller = TextEditingController();

  String occupierinitvalue = 'Choose';
  final occupiertype = [
    'Choose',
    'Owner',
    'Tenant',
    'Vacant**(please take photo for watermark)',
    'Closed',
  ];

  bool occupier = false;

  String ownernamecorrectinitvalue = 'Choose';
  final ownernamecorrect = ['Choose', 'Yes', 'No'];

  String propertyusageinitvalue = 'Choose';
  final propertyusagetype = [
    'Choose',
    '(D)Domestic',
    '(C)Commercial',
    '(I)Industrial',
    '(GQ)Government Quaters',
    '(GP)Government Premise'
  ];

  String propertydomestictypeinitvalue = 'Choose';
  final propertydomestictype = [
    'Choose',
    'D1 LC Single Storey Terrace House',
    'D2 LC Double Storey Terrace House',
    'D3 Low Cost Flat',
    'D4 LMC Single Storey Terrace Hse',
    'D5 LMC Double Storey Terrace Hse',
    'D6 Low Medium Cost  Flat',
    'D7 Low Medium Cost Apartment',
    'D8 Single Storey Terrace House',
    'D9 Double Storey Terrace House',
    'D10 Triple Storey Terrace House',
    'D11 1 1/2 Storey Terrace House',
    'D12 2 1/2 Storey Terrace House',
    'D13 3 1/2 Storey Terrace House',
    'D14 Single Storey Bungalow',
    'D15 Double Storey Bungalow',
    'D16 Triple Storey Bungalow',
    'D17 Single Storey Semi-D House',
    'D18 Double Storey Semi-D House',
    'D19 Triple Storey Semi-D House',
    'D20 Town House',
    'D21 Flat',
    'D22 Apartment',
    'D23 Service Apartment',
    'D24 Condominium',
    'D25 Villa',
    'D26 Water house ',
    'D27 Warden House',
    'D28 Shop Lot Used as Domestic',
    'D29 Kampung House',
    'D30 Temporary Settlement',
    'D31 Cluster House',
    'D32 Dormitory/Hostel',
    'D33 Squatters',
    'D36 GUARD HOUSE',
    'D37 LC Single Storey Semi-D House',
    'D38 2 1/2 Storey Detached House',
    'D39 2 1/2 Storey Bungalow',
    'D40 Low Cost Townhouse',
    'D41 Low Medium Cost Townhouse',
    'D42 Low Cost Cluster House',
    'D43 4 Storey Bungalow',
    'D44 One and Half Storey Bungalow'
  ];

  String drcodeinitvalue = 'Choose';

  final drcodetype = [
    'Choose',
    '1 DR01 PAYMENT MADE AFTER DCA VISIT',
    '2 DR02 PROMISED TO PAY',
    '3 DR03 REFUSE TO PAY',
    '4 DR04 UNABLE TO PAY',
    '5 DR05 VACANT PREMISE',
    '6 DR06 VACANT LAND',
    '7 DR07 ABANDON',
    '8 DR08 NO TOILET',
    '9 DR09 DEMOLISHED',
    '10 DR10 BUILDING BURNT',
    '11 DR11 UNDER RENOVATION',
    '12 DR12 PROP CANNOT BE LOCATED',
    '13 DR13 UNDER LIQUIDATION',
    '14 DR14 FURTHER EXPLANATION ',
    '15 DR15 BUSINESS ONLY OPERATED IN THE EVENING',
    '16 DR16 REQUESTED FOR INSTALLMENT PLAN',
    '17 DR17 REQUESTED FOR STATEMENT OF ACCOUNT (SOA)',
    '18 DR18 REQUESTED FOR COPY BILL',
    '19 DR19 COLLECTED POSTDATED CHEQUES',
    '20 DR20 OTHER REMARKS, PLEASE SPECIFY IN REMARK COLUMN',
    '21 DR21 DOMESTIC USAGE (FOR COMMERCIAL ASSIGNMENT ONLY)',
    '22 DR22 CLOSED (PLEASE INSERT TOTAL OF VISITATION INTO COLUMN "NUMBER OF VISITATION")',
    '23 DR23 LEAVE MESSAGE TO CALL',
    '24 DR25 TENANT CLAIM OWNER TO PAY',
    '25 DR26 TENANT PAID TO OWNER',
    '26 DR27 NEW TENANT/SAME OWNER',
    '27 DR28 PAYMENT IS OUSTANDING BUT CLAIM PAID',
    '28 DR29 STORE, WITHOUT SIGNBOARD',
    '29 DR32 NO WATER METER',
    '30 DR33 UNDER RECEIVERSHIP',
    '31 DR34 COOLING TOWER USAGE  (FOR COMMERCIAL ASSIGNMENT ONLY)',
    '32 DR35 OWNER CLAIM TENANT TO PAY',
    '33 DR36 COMMERCIAL USAGE (FOR DOMESTIC ASSIGNMENT ONLY)',
    '34 DR37 CUSTOMER DISPUTE ON CHARGES',
    '35 DR38 NOBODY IN THE AREA TO REFER',
    '36 DR39 CLAIM NO SERVICE PROVIDED',
    '37 DR40 MANAGEMENT REFUSE TO COOPERATE',
    '38 DR41 NEW OWNER REFUSE TO PAY PREVIOUS OWNER OUTSTANDING',
    '39 DR42 CUSTOMER REFUSE TO MEET DCA',
    '40 DR43 PROPERTY AGENT REFUSE TO COOPERATE',
    '41 DR45 POLITICAL PARTIES ADVISE CUSTOMER NOT TO PAY IWK CHARGE',
    '42 DR46 NOT RECEIVED BILL',
    '43 DR47 CLAIM PAYED TO IST TANKER',
    '44 DR48 PREMISE OCCUPY BY FOREIGNER-COMMUNICATION ISSUES',
    '45 DR49 OWNER IS IN OVERSEAS',
    '46 DR50 WELFARE SOCIETY-CANT AFFORD TO PAY',
  ];

  File? _image;
  late Future<String> fileurl;
  bool image = false;

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50
            // maxWidth: 1800,
            // maxHeight: 1800,
            );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        //uploadFile();
        image = true;
        //file path upload
        if (_image != null) {
          imagecontroller.text = "Sucessful Uploaded";
        } else {
          imagecontroller.text = "Unscessful Upload";
        }
      });
    }
      Navigator.of(context).pop();
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50
            // maxWidth: 1800,
            // maxHeight: 1800,
            );
    if (pickedFile != null) {
      setState(() {
        // _image = image;
        _image = File(pickedFile.path);
        print(_image);
        print('------');
        print(pickedFile);
        //uploadFile();
        image = true;
        //file path upload
        if (_image != null) {
          imagecontroller.text = "Sucessful Uploaded";
        } else {
          imagecontroller.text = "Unscessful Upload";
        }
      });
    }
    Navigator.of(context).pop();
  }

  actionsheetTakePhoto(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: () {
                  _getFromCamera();
                },
                child: const Align(
                    alignment: Alignment.topLeft, child: Text("Camera"))),
            CupertinoActionSheetAction(
                onPressed: () {
                  _getFromGallery();
                },
                child: const Align(
                    alignment: Alignment.topLeft, child: Text("Upload"))),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }

  String? _selectedNationality = '';
  String? _selectedMeter = '';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeptAssignID(
                        type: '',
                      )),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_sharp),
            color: Colors.deepPurple,
            onPressed: () {},
          ),
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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ID :1",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Bill:X6356185",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "SAN:41898081",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Owner1:NEO HOO",
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Range5: >120 months",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Arrears:1,226.25",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Total Payable Amount:1,317.85",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Take Photo DropDown
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Take Photo",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            width: screenWidth,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  actionsheetTakePhoto(context);
                                },
                                child: Container(
                                  child: _image != null
                                      ? ClipRRect(
                                          // borderRadius: BorderRadius.circular(5),
                                          child: Image.file(
                                            _image!,
                                            width: screenWidth * (10 / 20),
                                            height: screenHeight * (10 / 20),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            // borderRadius: BorderRadius.circular(50)
                                          ),
                                          width: screenWidth * (10 / 20),
                                          height: screenHeight * (10 / 20),
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.grey[400],
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
                      // Occupier DropDown

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Occupier(Owner/Tenant )",
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
                                  occupierinitvalue = value!;
                                  if (occupierinitvalue ==
                                      'Vacant**(please take photo for watermark)') {
                                    occupier = true;
                                  } else if (occupierinitvalue == 'Closed') {
                                    occupier = false;
                                  } else {
                                    return;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      // Occupier DropDown

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Owner Name Correct (Yes/No)",
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
                              value: ownernamecorrectinitvalue,
                              isExpanded: true,
                              items: ownernamecorrect.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          fontSize: 14, color: primaryColor)),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  ownernamecorrectinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textField("Please specify correct ownername",
                          correctownernamecontroller),
                      const SizedBox(
                        height: 20,
                      ),
                      textField("Owner's tel no", ownertelnocontroller),
                      const SizedBox(
                        height: 20,
                      ),
                      textField("Tenant's name", tenantnamecontroller),
                      const SizedBox(
                        height: 20,
                      ),
                      textField("Tenant's tel no", tenanttelnocontroller),

                      SizedBox(
                        height: 20,
                      ),
                      // Radio Button
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Occupier Nationality:',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "Malaysian",
                                  groupValue: _selectedNationality,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedNationality = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("Malaysian")
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "Foreigner",
                                  groupValue: _selectedNationality,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedNationality = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Foreigner")
                            ],
                          )
                        ],
                      ),
                      // Property Usage DropDown

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Property usage (D or C)",
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
                              value: ownernamecorrectinitvalue,
                              isExpanded: true,
                              items: ownernamecorrect.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          fontSize: 14, color: primaryColor)),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  ownernamecorrectinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
// Drop Down
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Property Domestic",
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
                              value: propertydomestictypeinitvalue,
                              isExpanded: true,
                              items: propertydomestictype.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          fontSize: 14, color: primaryColor)),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  propertydomestictypeinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Drop Down

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dr Code",
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
                              value: drcodeinitvalue,
                              isExpanded: true,
                              items: drcodetype.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          fontSize: 14, color: primaryColor)),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  drcodeinitvalue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Remark",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                            cursorColor: kPrimaryPurpleColor,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field Required';
                              }
                            },
                            controller: remarkcontroller,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  borderSide:
                                      BorderSide(color: kPrimaryPurpleColor)),
                              contentPadding:
                                  EdgeInsets.fromLTRB(25, 10, 10, 80),
                              fillColor: kPrimaryWhiteColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  borderSide:
                                      BorderSide(color: kPrimaryPurpleColor)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: kPrimaryPurpleColor),
                                gapPadding: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Radio Button
                      occupier == true
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'If DR05 (VACANT PREMISE), please select below.',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Radio<String>(
                                            value: "Yes - Watermeter",
                                            groupValue: _selectedMeter,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedMeter = value!;
                                              });
                                            }),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text("Yes - Watermeter")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<String>(
                                            value: "No - Watermeter",
                                            groupValue: _selectedMeter,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedMeter = value!;
                                              });
                                            }),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text("No - Watermeter")
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Meter Number",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/meter.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                  ),
                                ),
                                textField("", waterMetercontroller),
                              ],
                            )
                          : SizedBox(),

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
