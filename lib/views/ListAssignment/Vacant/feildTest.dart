// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/ListAssignment/reusabletextfield.dart';

import 'package:riders_app/views/field/feild.dart';

class FeildTest extends StatefulWidget {
  const FeildTest({Key? key}) : super(key: key);

  @override
  State<FeildTest> createState() => _FeildTestState();
}

class _FeildTestState extends State<FeildTest> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController jobIdcontroller = TextEditingController();
  TextEditingController catatancontroller = TextEditingController();

  TextEditingController komencontroller = TextEditingController();
  TextEditingController metercontroller = TextEditingController();

  String otherinitvalue = 'Choose';
  final othertype = [
    'Choose',
    'Terbaskar (Burnt)',
    'Dirobhkan (Demolished)',
    'Digunakan untuk sarang burung (Used for bird nesting)',
    'Tanah kosong (Vacant Land)',
    'Dalam pengubahsisaian (Under renovation)'
  ];

  String other1initvalue = 'Choose';
  final other1type = [
    'Choose',
    'Premis Kerajaan (Goverment Premise)',
    'Kuarters Kerajaan (Goverment Quarters)',
    'Industri (Industry)',
    'Tempat ibadat',
  ];

  String? _selectedType='';
  String? _selectedUsage='';
  String? _selectedConnect='';

  @override
  Widget build(BuildContext context) {
        var screenHeight = MediaQuery.of(context).size.height;
                var screenWidth= MediaQuery.of(context).size.width;
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
                  builder: (context) => FieldScreen(),)
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
                      const SizedBox(
                        height: 20,
                      ),
                      textField("Sila isikan ID untuk tugasan (JobId)",
                          jobIdcontroller),
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
                              Text("DIDUDUKI (OCCUPIED)",style: TextStyle(fontSize: 12, color: primaryColor),)
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
                              const Text("KOSONG (VACANT )",style: TextStyle(fontSize: 12, color: primaryColor),)
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
                                  value: "PENGGUNAAN KOMERSIL (COMMERCIAL USAGE )",
                                  groupValue: _selectedUsage,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedUsage = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("PENGGUNAAN KOMERSIL (COMMERCIAL USAGE )",style: TextStyle(fontSize: 12, color: primaryColor),)
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
                              const Text("PENGUNAAN DOMESTIK (DOMESTIC USAGE)",style: TextStyle(fontSize: 12, color: primaryColor),)
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
                              Text("Ya - Bersambung (Yes - Connected)",style: TextStyle(fontSize: 12, color: primaryColor),)
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                  value: "Tidak - Terputus sambungan (No - Disconnected)",
                                  groupValue: _selectedConnect,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedConnect = value!;
                                    });
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Tidak - Terputus sambungan (No - Disconnected)",style: TextStyle(fontSize: 12, color: primaryColor),)
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
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/Meter.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                        ),
                      ),
                      textField("", metercontroller),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textField(
                          "CATATAN ATAU PINDAAN KEPADA ALAMAT HARTA (REMARKS OR AMENDMENT TO THE PROPERTY ADDRESS)",
                          catatancontroller),
                      const SizedBox(
                        height: 20,
                      ),
                      textField(
                          "Komen lain oleh Field Officer", komencontroller),
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
