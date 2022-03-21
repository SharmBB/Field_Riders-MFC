// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:riders_app/_helpers/constants.dart';
// import 'package:toggle_switch/toggle_switch.dart';

// class FieldScreen extends StatefulWidget {
//   const FieldScreen({Key? key}) : super(key: key);

//   @override
//   State<FieldScreen> createState() => _FieldScreenState();
// }

// class _FieldScreenState extends State<FieldScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           // ignore: prefer_const_constructors
//           icon: Icon(
//             Icons.arrow_back_rounded,
//             color: kPrimaryBlueColor,
//             size: 30.0,
//           ),
//           onPressed: () {
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(builder: (context) => HomePage()),
//             // );
//           },
//         ),
//         leadingWidth: 60,
//         centerTitle: true,
//         title: ToggleSwitch(
//           minWidth: 70.0,
//           minHeight: 35.0,
//           cornerRadius: 10.0,
//           activeBgColors: [
//             [kPrimaryWhiteColor],
//             [kPrimaryWhiteColor]
//           ],
//           activeFgColor: primaryColor,
//           inactiveBgColor: kPrimaryGreyColor,
//           inactiveFgColor: primaryColor,
//           initialLabelIndex: 1,
//           totalSwitches: 2,
//           labels: ['Office', 'Field'],
//           radiusStyle: true,
//           onToggle: (index) {
//             print('switched to: $index');
//           },
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: NotificationListener<OverscrollIndicatorNotification>(
//         onNotification: (OverscrollIndicatorNotification overscroll) {
//           // ignore: deprecated_member_use
//           overscroll.disallowGlow();
//           return false;
//         },
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Text(
//                   'List of assignment',
//                   style: TextStyle(
//                     color: kPrimaryPurpleColor,
//                     fontSize: 25.0,
//                   ),
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: screenWidth,
//                     height: 40,
//                     color: Colors.lightBlueAccent.shade100,
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         left: 20,
//                         top: 10.0,
//                         right: 20.0,
//                         bottom: 10,
//                       ),
//                       child: Text(
//                         '2021-12-13',
//                         style: TextStyle(
//                           color: kPrimaryGreyColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(
//                       20.0,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                         'Type',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(0.0),
//                             border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             hintText: 'Domestric DR',
//                             hintStyle: TextStyle(
//                               color: kPrimaryGreyColor,
//                               fontSize: 15.0,
//                             ),
                           
//                           ),
//                           onSaved: (String? value) {
//                             // This optional block of code can be used to run
//                             // code when the user saves the form.
//                           },
//                         ),
//                         Divider(
//                           thickness: 2,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                               Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                           Text(
//                         'Created',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                             SizedBox(
//                               height: 50,
//                               width: 100,
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.all(0.0),
//                                   border: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                   hintText: '2021-12-12',
//                                   hintStyle: TextStyle(
//                                     color: kPrimaryGreyColor,
//                                     fontSize: 15.0,
//                                   ),
                             
//                                 ),
//                                 onSaved: (String? value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                               ),
//                             ),
//                       ],
//                               ),

//                                        Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                           Text(
//                         'Due',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                             SizedBox(
//                               height: 50,
//                               width: 100,
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.all(0.0),
//                                   border: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                   hintText: '2021-12-12',
//                                   hintStyle: TextStyle(
//                                     color: kPrimaryGreyColor,
//                                     fontSize: 15.0,
//                                   ),
                                 
//                                 ),
//                                 onSaved: (String? value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                               ),
//                             ),
//                       ],
//                                        ),
//                           ],
//                         ),


//                         Divider(
//                           thickness: 2,
//                         ),
//                           Text(
//                         'Text Align',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(0.0),
//                             border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             hintText: '3',
//                             hintStyle: TextStyle(
//                               color: kPrimaryGreyColor,
//                               fontSize: 15.0,
//                             ),
                            
//                           ),
//                           onSaved: (String? value) {
//                             // This optional block of code can be used to run
//                             // code when the user saves the form.
//                           },
//                         ),
//                         Divider(
//                           thickness: 2,
//                         ),
//                            Text(
//                         'Progress',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(0.0),
//                             border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             hintText: '10% Complete',
//                             hintStyle: TextStyle(
//                               color: kPrimaryGreyColor,
//                               fontSize: 15.0,
//                             ),
                          
//                           ),
//                           onSaved: (String? value) {
//                             // This optional block of code can be used to run
//                             // code when the user saves the form.
//                           },
//                         ),
//                         Divider(
//                           thickness: 2,
//                         ),
//                         TextButton(
//                           style: TextButton.styleFrom(
//                             padding: const EdgeInsets.all(0),
//                             primary: kPrimaryBlueColor,
//                             textStyle: const TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           onPressed: () {},
//                           child: const Text('Manage'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     width: screenWidth,
//                     height: 40,
//                     color: Colors.lightBlueAccent.shade100,
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         left: 20,
//                         top: 10.0,
//                         right: 20.0,
//                         bottom: 10,
//                       ),
//                       child: Text(
//                         '2021-12-13',
//                         style: TextStyle(
//                           color: kPrimaryGreyColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                     Padding(
//                     padding: EdgeInsets.all(
//                       20.0,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                         'Type',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(0.0),
//                             border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             hintText: 'Domestric DR',
//                             hintStyle: TextStyle(
//                               color: kPrimaryGreyColor,
//                               fontSize: 15.0,
//                             ),
                           
//                           ),
//                           onSaved: (String? value) {
//                             // This optional block of code can be used to run
//                             // code when the user saves the form.
//                           },
//                         ),
//                         Divider(
//                           thickness: 2,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                               Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                           Text(
//                         'Created',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                             SizedBox(
//                               height: 50,
//                               width: 100,
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.all(0.0),
//                                   border: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                   hintText: '2021-12-12',
//                                   hintStyle: TextStyle(
//                                     color: kPrimaryGreyColor,
//                                     fontSize: 15.0,
//                                   ),
                             
//                                 ),
//                                 onSaved: (String? value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                               ),
//                             ),
//                       ],
//                               ),

//                                        Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                           Text(
//                         'Due',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                             SizedBox(
//                               height: 50,
//                               width: 100,
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.all(0.0),
//                                   border: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                   hintText: '2021-12-12',
//                                   hintStyle: TextStyle(
//                                     color: kPrimaryGreyColor,
//                                     fontSize: 15.0,
//                                   ),
                                 
//                                 ),
//                                 onSaved: (String? value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                               ),
//                             ),
//                       ],
//                                        ),
//                           ],
//                         ),


//                         Divider(
//                           thickness: 2,
//                         ),
//                           Text(
//                         'Text Align',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(0.0),
//                             border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             hintText: '3',
//                             hintStyle: TextStyle(
//                               color: kPrimaryGreyColor,
//                               fontSize: 15.0,
//                             ),
                            
//                           ),
//                           onSaved: (String? value) {
//                             // This optional block of code can be used to run
//                             // code when the user saves the form.
//                           },
//                         ),
//                         Divider(
//                           thickness: 2,
//                         ),
//                            Text(
//                         'Progress',
//                         style: TextStyle(
//                           color: primaryColor,
//                           fontSize: 15.0,
//                         ),
//                       ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(0.0),
//                             border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             hintText: '10% Complete',
//                             hintStyle: TextStyle(
//                               color: kPrimaryGreyColor,
//                               fontSize: 15.0,
//                             ),
                          
//                           ),
//                           onSaved: (String? value) {
//                             // This optional block of code can be used to run
//                             // code when the user saves the form.
//                           },
//                         ),
//                         Divider(
//                           thickness: 2,
//                         ),
//                         TextButton(
//                           style: TextButton.styleFrom(
//                             padding: const EdgeInsets.all(0),
//                             primary: kPrimaryBlueColor,
//                             textStyle: const TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           onPressed: () {},
//                           child: const Text('Manage'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
