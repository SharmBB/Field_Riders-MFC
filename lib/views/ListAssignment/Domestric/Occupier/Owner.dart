

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/ListAssignment/Domestric/Occupier/Tenant.dart';
import 'package:riders_app/views/ListAssignment/reusabletextfield.dart';

  String ownernamecorrectinitvalue = 'Yes';
  final ownernamecorrect = [ 'Yes', 'No'];

  String propertyusageinitvalue = 'Choose';
  final propertyusagetype = [
    'Choose',
    '(D)Domestic',
    '(C)Commercial',
    '(I)Industrial',
    '(GQ)Government Quaters',
    '(GP)Government Premise'
  ];
    String? _selectedNationality = '';
  String? _selectedMeter = '';

    TextEditingController correctownernamecontroller = TextEditingController();
  TextEditingController ownertelnocontroller = TextEditingController();

Widget Owner( context) {
  return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return
Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.deepPurple),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                           
                                      width: MediaQuery.of(context).size.width,
                                      child: DropdownButton<String>(
                                        underline: Container(),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.deepPurple,
                                        ),
                                        value: ownernamecorrectinitvalue,
                                        isExpanded: true,
                                        items: ownernamecorrect
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: primaryColor)),
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
                                textField(
                                    "Owner's tel no", ownertelnocontroller),
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
                              Text(
                                "Malaysian",
                                style: TextStyle(
                                    fontSize: 14, color: primaryColor),
                              )
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
                              const Text(
                                "Foreigner",
                                style: TextStyle(
                                    fontSize: 14, color: primaryColor),
                              )
                            ],
                          )
                        ],
                      ),
                       Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Property usage",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.deepPurple),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                 
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: DropdownButton<String>(
                                            underline: Container(),
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.deepPurple,
                                            ),
                                            value: propertyusageinitvalue,
                                            isExpanded: true,
                                            items: propertyusagetype
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: primaryColor)),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              setState(() {
                                                propertyusageinitvalue =
                                                    value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                              ],
                            );
}

  );
}