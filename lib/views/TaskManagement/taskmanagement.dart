import 'package:flutter/material.dart';
import 'package:riders_app/views/HomeScreen/HomePage.dart';
import 'package:riders_app/views/Login/login.dart';
import 'package:riders_app/views/field/feild.dart';

class TaskManagementScreen extends StatefulWidget {
  const TaskManagementScreen({Key? key}) : super(key: key);

  @override
  State<TaskManagementScreen> createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen> {
  String assigninitvalue = 'Assignment1';
  final assignments = [
    'Assignment1',
    'Assignment2',
    'Assignment3',
    'Assignment4',
    'Assignment5'
  ];
  String manageinitvalue = 'DR Code';
  final manage = ['DR Code', 'DR Code2', 'DR Code 3', 'DR Code 4'];

  String DRcodeinitvalue = 'DR04-unable To pay';
  final DRcode = [
    'DR04-unable To pay',
    'DR05-unable To pay',
    'DR06-unable To pay',
    'DR07-unable To pay'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.deepPurple),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Scan',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.qr_code_scanner,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Task Management",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Batch Process Management",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "* Please Enter all required information to process task by batch ",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              // Drop Down Assignment
              Text(
                "Assignment",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
                  underline: Container(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.deepPurple,
                  ),
                  value: assigninitvalue,
                  isExpanded: true,
                  items: assignments.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      assigninitvalue = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Dropdown Type of Manage
              Text(
                "Type Of Manage",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
                  underline: Container(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.deepPurple,
                  ),
                  value: manageinitvalue,
                  isExpanded: true,
                  items: manage.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      manageinitvalue = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Drop Down DR code
              Text(
                "DR Code",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
                  underline: Container(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.deepPurple,
                  ),
                  value: DRcodeinitvalue,
                  isExpanded: true,
                  items: DRcode.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      DRcodeinitvalue = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(
                "Project Description",
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text(
                    "Type",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 140),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Vacant",
                        hintStyle: TextStyle(fontSize: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                ],
              ),

              Row(
                children: [
                  const Expanded(
                      child: Text(
                    "Date",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "21-12-2021-16-02-2022",
                        hintStyle: TextStyle(fontSize: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                "IWK ID",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.deepPurple),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 9),
                  child: TextFormField(
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "From",
                        hintStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 9),
                  child: TextFormField(
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "To",
                        hintStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: RaisedButton(
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FieldScreen()),
                    );
                  },
                  child: const Text(
                    "Processing",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
