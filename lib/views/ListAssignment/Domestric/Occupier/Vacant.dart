import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/ListAssignment/reusabletextfield.dart';

String propertyusageinitvalueOwner = 'Choose';
final propertyusagetypeOwner = [
  'Choose',
  '(D)Domestic',
  '(C)Commercial',
  '(I)Industrial',
  '(GQ)Government Quaters',
  '(GP)Government Premise'
];
String? _selectedNationality = '';
String? _selectedMeter = '';

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

String drcodeinitvalue = '5 DR05 VACANT PREMISE';

final drcodetype = [
  '5 DR05 VACANT PREMISE',
];

TextEditingController remarkcontroller = TextEditingController();
TextEditingController waterMetercontroller = TextEditingController();

File? _image;
bool image = false;

// _getFromCamera() async {
//   PickedFile? pickedFile =
//       await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 50
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

Widget Vacant(context) {
  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Property usage",
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
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    underline: Container(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.deepPurple,
                    ),
                    value: propertyusageinitvalue,
                    isExpanded: true,
                    items: propertyusagetype.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style:
                                TextStyle(fontSize: 14, color: primaryColor)),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        propertyusageinitvalue = value!;
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
                            style:
                                TextStyle(fontSize: 14, color: primaryColor)),
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
                            style:
                                TextStyle(fontSize: 14, color: primaryColor)),
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
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: kPrimaryPurpleColor,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Remark Required';
                    }
                  },
                  controller: remarkcontroller,
                  maxLines: 5,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Remark",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(color: kPrimaryPurpleColor)),
                    contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                    fillColor: kPrimaryWhiteColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(color: kPrimaryPurpleColor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: kPrimaryPurpleColor),
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

            const Text(
              'If DR05 (VACANT PREMISE), please select below.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Meter Number",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                    onTap: () {
                      setState(() async {
                        PickedFile? pickedFile = await ImagePicker().getImage(
                            source: ImageSource.camera, imageQuality: 50
                            // maxWidth: 1800,
                            // maxHeight: 1800,
                            );
                        if (pickedFile != null) {
                          setState(() {
                            _image = File(pickedFile.path);
                            //uploadFile();
                            image = true;
                          });
                        }
                      });
                    },
                    child: Container(
                      child: _image != null
                          ? ClipRRect(
                              // borderRadius: BorderRadius.circular(5),
                              child: Image.file(
                                _image!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                // borderRadius: BorderRadius.circular(50)
                              ),
                              width:
                                  MediaQuery.of(context).size.width * (10 / 20),
                              height: MediaQuery.of(context).size.height *
                                  (10 / 20),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[400],
                              ),
                            ),
                    )),
              ),
            ),
          ],
        ),
        textField("", waterMetercontroller),
      ],
    );
  });
}
