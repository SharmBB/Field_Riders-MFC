import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.deepPurple),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child:  Text(
              'Scan',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.qr_code_scanner,
              color: Colors.deepPurple,
            ),
          ),
        ],
      //   backgroundColor: Colors.transparent,
          elevation: 0,
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Task Management",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Batch Process Management",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
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
                height: 35,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
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
                height: 20,
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
                height: 35,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
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
                height: 20,
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
                height: 35,
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<String>(
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
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Project Description",
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
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
                height: 20,
              ),
              const Text(
                "IWK ID",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.deepPurple),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 4),
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
                height: 10,
              ),

              Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 4),
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
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
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