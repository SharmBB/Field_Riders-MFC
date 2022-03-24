import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/deptAssignment/reusabletextfield.dart';

class DeptAssignmentScreen extends StatefulWidget {
  const DeptAssignmentScreen({Key? key}) : super(key: key);

  @override
  State<DeptAssignmentScreen> createState() => _DeptAssignmentScreenState();
}

class _DeptAssignmentScreenState extends State<DeptAssignmentScreen> {
  final _formKey = GlobalKey<FormState>();

  String imginitvalue = 'Permise 1';
  final imgtype = [
    'Permise 1',
    'Permise 2',
    'Permise 3',
    'Permise 4',
    'Permise 5'
  ];
  String ownerinitvalue = 'owner 1';
  final ownertype = ['owner 1', 'owner 2', 'owner 3', 'owner 4', 'owner 5'];

  String propertyinitvalue = 'property 1';
  final propertytype = [
    'property 1',
    'property 2',
    'property 3',
    'property 4',
    'property 5'
  ];

  String businessinitvalue = 'business 1';
  final businesstype = [
    'business 1',
    'business 2',
    'business 3',
    'business 4',
    'business 5'
  ];
  String drcodeinitvalue = 'code 1';
  final drcodetype = ['code 1', 'code 2', 'code 3', 'code 4', 'code 5'];

  TextEditingController excludecontroller = TextEditingController();
  TextEditingController iwkspecialcontroller = TextEditingController();
  TextEditingController dcafilecontroller = TextEditingController();
  TextEditingController dcanamecontroller = TextEditingController();
  TextEditingController dcacodecontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController coststatecontroller = TextEditingController();
  TextEditingController uocontroller = TextEditingController();
  TextEditingController lanamecontroller = TextEditingController();
  TextEditingController bilnocontroller = TextEditingController();
  TextEditingController sancontroller = TextEditingController();
  TextEditingController rangeduecontroller = TextEditingController();
  TextEditingController custelephonenocontroller = TextEditingController();
  TextEditingController cusmobilenocontroller = TextEditingController();
  TextEditingController cusfaxnocontroller = TextEditingController();
  TextEditingController cusemailcontroller = TextEditingController();
  TextEditingController owner1controller = TextEditingController();
  TextEditingController owner2controller = TextEditingController();
  TextEditingController propaddr1controller = TextEditingController();
  TextEditingController propaddr2controller = TextEditingController();
  TextEditingController propaddr3controller = TextEditingController();
  TextEditingController propaddr4controller = TextEditingController();
  TextEditingController propaddr5controller = TextEditingController();
  TextEditingController buildingcontroller = TextEditingController();
  TextEditingController buildingidcontroller = TextEditingController();
  TextEditingController roadnamecontroller = TextEditingController();
  TextEditingController tamancontroller = TextEditingController();
  TextEditingController postcodecontroller = TextEditingController();
  TextEditingController suburbcontroller = TextEditingController();
  TextEditingController mailname1bilcontroller = TextEditingController();
  TextEditingController mailname2bilcontroller = TextEditingController();
  TextEditingController mailaddr1bilcontroller = TextEditingController();
  TextEditingController mailaddr2bilcontroller = TextEditingController();
  TextEditingController mailaddr3bilcontroller = TextEditingController();
  TextEditingController mailaddr4bilcontroller = TextEditingController();
  TextEditingController balanceamountdatecontroller = TextEditingController();
  TextEditingController balanceamountcopybilcontroller =
      TextEditingController();
  TextEditingController differencebetweenbalancecontroller =
      TextEditingController();
  TextEditingController visitdatecontroller = TextEditingController();
  TextEditingController updateremindercontroller = TextEditingController();
  TextEditingController occupiercontroller = TextEditingController();
  TextEditingController specifycorrectownernamecontroller =
      TextEditingController();
  TextEditingController ownertelephonenocontroller = TextEditingController();
  TextEditingController ownermobilenocontroller = TextEditingController();
  TextEditingController ownerfaxnocontroller = TextEditingController();
  TextEditingController owneremailcontroller = TextEditingController();
  TextEditingController tenantnamecontroller = TextEditingController();
  TextEditingController tenanttelephonenocontroller = TextEditingController();
  TextEditingController tenantmobilenocontroller = TextEditingController();
  TextEditingController tenantfaxcontroller = TextEditingController();
  TextEditingController tenantemailcontroller = TextEditingController();
  TextEditingController occupiernationalitycontroller = TextEditingController();
  TextEditingController noofvisitationcontroller = TextEditingController();
  TextEditingController nooffollowupcontroller = TextEditingController();
  TextEditingController propertyusagecontroller = TextEditingController();
  TextEditingController nameofshopcompanycontroller = TextEditingController();
  TextEditingController blackareacontroller = TextEditingController();
  TextEditingController reasoncustomercontroller = TextEditingController();
  TextEditingController businessclosecontroller = TextEditingController();
  TextEditingController remarkcontroller = TextEditingController();

  bool click = true;
  actionsheetFile(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: () {},
                child: const Align(
                    alignment: Alignment.topLeft, child: Text("Camera"))),
            CupertinoActionSheetAction(
                onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: kPrimaryPurpleColor,
            size: 25.0,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => DeptAssignID()),
            // );
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
            onPressed: () {
              openDialog(context);
            },
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
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10.0,
                  right: 20.0,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dept Assignment",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "List Of Task 2021-D-F28-RCF24F25-LND-(SELANGOR)(21/12/2021 to 16/02/2022)",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text("Upload Photo Here",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 15,
                    ),
                    // Drop Down
                    const Text(
                      "Image Type",
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
                        value: imginitvalue,
                        isExpanded: true,
                        items: imgtype.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            imginitvalue = value!;
                          });
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    // Drop Down

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Input File",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, bottom: 9),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 12),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        actionsheetFile(context);
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kPrimaryPurpleColor,
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ),
//
                    const SizedBox(
                      height: 45,
                    ),
                    const Text(
                      "Task Info",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Re Usable Widget

                    //1
                    textField("Exclude", excludecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //2
                    textField("IWK Special Instruction", iwkspecialcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //3
                    textField("DCA File Type", dcafilecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //4
                    textField("DCA Name", dcanamecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //5
                    textField("DCA Code", dcacodecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //6
                    textField("State", statecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //7
                    textField("Cost State", coststatecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //8
                    textField("UO", uocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //9
                    textField("La Name", lanamecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //10
                    textField("Bil No", bilnocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //11
                    textField("San", sancontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //12
                    textField("Range Due", rangeduecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //13
                    textField(
                        "Customer Telephone Number", custelephonenocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //14
                    textField("Customer Mobile Number", cusmobilenocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //15
                    textField("Customer Fax Number", cusfaxnocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //16
                    textField("Customer Email", cusemailcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //17
                    textField("Owner 1", owner1controller),
                    const SizedBox(
                      height: 30,
                    ),
                    //18
                    textField("Owner 2", owner2controller),
                    const SizedBox(
                      height: 30,
                    ),
                    //19
                    textField("Prop Address 1", propaddr1controller),
                    const SizedBox(
                      height: 30,
                    ),
                    //20
                    textField("Prop Address 2", propaddr2controller),
                    const SizedBox(
                      height: 30,
                    ),
                    //21
                    textField("Prop Address 3", propaddr3controller),
                    const SizedBox(
                      height: 30,
                    ),
                    //22
                    textField("Prop Address 4", propaddr4controller),
                    const SizedBox(
                      height: 30,
                    ),
                    //23
                    textField("Prop Address 5", propaddr5controller),
                    const SizedBox(
                      height: 30,
                    ),
                    //24
                    textField("Building", buildingcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //25
                    textField("Building Id", buildingidcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //26
                    textField("Road Name", roadnamecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //27
                    textField("Taman", tamancontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //28
                    textField("PostCode", postcodecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //29
                    textField("Suburb", suburbcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //30
                    textField("Mail Name 1 Bill", mailname1bilcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //31
                    textField("Mail Name 2 Bill", mailname2bilcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //32
                    textField("Mail Address 1 Bill", mailaddr1bilcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //33
                    textField("Mail Address 2 Bill", mailaddr2bilcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //34
                    textField("Mail Address 3 Bill", mailaddr3bilcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //35
                    textField("Mail Address 4 Bill", mailaddr4bilcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //36
                    textField(
                        "Balance Amount At Date", balanceamountdatecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //37
                    textField("Balance Amout As Copy Bill ",
                        balanceamountcopybilcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //38
                    textField(
                        "Difference Between Balance As Copy Bill And Balance At Date",
                        differencebetweenbalancecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //39
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Visit Date",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
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
                          controller: visitdatecontroller,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.calendar_today_rounded,color: kPrimaryPurpleColor,)),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: kPrimaryPurpleColor)),
                            contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 0),
                            fillColor: kPrimaryWhiteColor,
                            filled: true,
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: kPrimaryPurpleColor)),
                            border: const OutlineInputBorder(
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
                      height: 30,
                    ),

                    //40 // Date
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Update Reminder",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
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
                          controller: updateremindercontroller,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.calendar_today_rounded,color: kPrimaryPurpleColor)),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: kPrimaryPurpleColor)),
                            contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 0),
                            fillColor: kPrimaryWhiteColor,
                            filled: true,
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: kPrimaryPurpleColor)),
                            border: const OutlineInputBorder(
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
                    const SizedBox(
                      height: 30,
                    ),
                    //41
                    textField("Occupier", occupiercontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //42 Drop Down
                    const Text(
                      "Correct Owner Name",
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
                        value: ownerinitvalue,
                        isExpanded: true,
                        items: ownertype.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            ownerinitvalue = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //43
                    textField("Specify Correct Owner Name",
                        specifycorrectownernamecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //44
                    textField(
                        "Owner Telephone Number", ownertelephonenocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //45
                    textField("Owner Mobile Number", ownermobilenocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //46
                    textField("Owner Fax Number", ownerfaxnocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //47
                    textField("Owner Email", owneremailcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //48
                    textField("Tenant Name", tenantnamecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //49
                    textField(
                        "Tenant Telephone Number", tenanttelephonenocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //50
                    textField("Tenant Mobile Number", tenantmobilenocontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //51
                    textField("Tenant Fax Number", tenantfaxcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //52
                    textField("Tenant Email", tenantemailcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //53
                    textField(
                        "Occupier Nationality", occupiernationalitycontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //54
                    textField("No Of Visitation", noofvisitationcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //55
                    textField("No of Follow Up", nooffollowupcontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //56
                    textField("Property Usage", propertyusagecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //57
                    const Text(
                      "Type Of Property",
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
                        value: propertyinitvalue,
                        isExpanded: true,
                        items: propertytype.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            propertyinitvalue = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //58

                    textField(
                        "Name Of Shop Company", nameofshopcompanycontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //59
                    const Text(
                      "Nature Of Business",
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
                        value: businessinitvalue,
                        isExpanded: true,
                        items: businesstype.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            businessinitvalue = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //60

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
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            drcodeinitvalue = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //61
                    textField("Black Area", blackareacontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //62
                    textField("Reason Customer", reasoncustomercontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //63
                    textField("Business Close Down", businessclosecontroller),
                    const SizedBox(
                      height: 30,
                    ),
                    //64
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remark",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
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
                            contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 80),
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
                              const SnackBar(content: Text('Updating Data')),
                            );
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    // Button
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Center(
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 10,
              width: MediaQuery.of(context).size.width * 1 / 10,
              child: Column(
                children: const [
                  Center(
                    child: Text(
                      "Sample Confirmation",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text("Action Was Successfull",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                  )
                ],
              ),
            ),
            actions: [
              Center(
                child: SizedBox(
                  width: 80.0,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: const Text(
                      "OK",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
