// // ignore_for_file: prefer_const_constructors

// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:custom_timer/custom_timer.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:riders_app/_helpers/constants.dart';
// import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Close.dart';
// import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Owner.dart';
// import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Tenant.dart';
// import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Vacant.dart';
// import 'package:riders_app/views/QR%20Screen/QR_scan.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:riders_app/views/ResuableTextFormFeild/reusabletextfield.dart';
// import 'package:image_watermark/image_watermark.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;


// class ComDomesticScreen extends StatefulWidget {
//   final String id;
//   final String san;
//   final String owner;
//   final String add;
//   final String date;
//   final String payment;
//   final String status;
//   const ComDomesticScreen(
//       {Key? key,
//       required this.id,
//       required this.san,
//       required this.owner,
//       required this.add,
//       required this.date,
//       required this.payment,
//       required this.status})
//       : super(key: key);

//   @override
//   State<ComDomesticScreen> createState() => _ComDomesticScreenState();
// }

// class _ComDomesticScreenState extends State<ComDomesticScreen> {
//   final _formKey = GlobalKey<FormState>();

//   late String id;
//   late String san;
//   late String owner1;
//   late String add;
//   late String date;
//   late String payment;
//   late String status;

//   @override
//   void initState() {
//     id = widget.id;
//     san = widget.san;
//     owner1 = widget.owner;
//     add = widget.add;
//     date = widget.date;
//     payment = widget.payment;
//     status = widget.status;
//     super.initState();
//   }

//   bool _isLoading = false;
//   bool occupier = false;
//   bool owner = false;
//   bool tenant = false;
//   bool close = false;

//   TextEditingController nameCompanycontroller = TextEditingController();
//   TextEditingController typebusinesscontroller = TextEditingController();

//   String typeofbusinessinitvalue = "choose";
//   final typeofbusinesstype = [
//     'choose',
//     '13 24 HRS SUNDRY SHOP (7 ELEVEN)',
//     '28 ACCESSORIES SHOP',
//     '89	BAKERY',
//     '27	BANK',
//     '46	BARBER SHOP',
//     '96	BEAUTY CENTRE',
//     '24	BICYCLE SHOP / REPAIR',
//     '44	BOOK STORE / STATIONERY SHOP',
//     '76	BOUTIQUE',
//     '36	BRIDAL SHOP',
//     '85	BUS STATION',
//     '139 CAFE',
//     '40	CANDY SHOP',
//     '14	CANTEEN',
//     '21	CAR ACCESSORIES SHOP',
//     '23	CAR PARK',
//     '20	CAR SERVICE CENTRE',
//     '22	CAR WASH',
//     '39	CARPET SHOP',
//     '100 CASKET & FUNERAL SERVICES',
//     '107 CHALET',
//     '101 CHARITY HOME',
//     '80	CHINESE MEDICAL HALL',
//     '05	CHINESE RESTAURANT',
//     '18	CHURCH',
//     '78	CINEMA',
//     '145 CLEANING SERVICES',
//     '87	COMMERCIAL COMPLEX',
//     '132 COURIER SERVICE SHOP',
//     '79	CUSTOMER SERVICE CENTRE',
//     '83	DANCING SCHOOL',
//     '94	DAY CARE CENTRE',
//     '129 DEPARTMENTAL STORE (JAYA JUSCO,SOGO,ETC)',
//     '68	DRIVING SCHOOL',
//     '30	ELECTRICAL SHOP',
//     '124 ENGINEERING FACTORY',
//     '126 ENTERTAINMENT OUTLET (I.E.KAROAKE)',
//     '123	FACTORY',
//     '12	FAST FOOD RESTAURANT',
//     '81	FISHING EQUIPMENT',
//     '120 FITNESS CENTRE / GYMNASIUM',
//     '72	FLORIST',
//     '13	FOOD COURT',
//     '47	FRAME SHOP',
//     '55	FROZEN FOOD SHOP',
//     '82	FRUIT SHOP',
//     '98	FURNITURE SHOP / HOME FURNISHING',
//     '71	GALLERY',
//     '130 GAMING OUTLET (SPORTS TOTO,MAGNUM,ETC)',
//     '140 GAS SHOP',
//     '74	GOLDSMITH',
//     '99	GOLF CLUB',
//     '136 GOVT BODIES',
//     '115 GOVT CLINIC',
//     '117 GOVT HOSPITAL',
//     '110 GOVT SCHOOL',
//     '42	HANDICRAFT SHOP',
//     '45	HANDPHONE / TELECOMMUNICATION SHOP',
//     '01	HARDWARE SHOP',
//     '92	HEALTHCARE CENTRE',
//     '125 HOME DÉCOR',
//     '106 HOSTEL',
//     '105 HOTEL',
//     '128 HYPERMARKET',
//     '143 ICE SUPPLIER',
//     '06	INDIAN RESTAURANT',
//     '90	INSURANCE COMPANY',
//     '118 INTERNET CAFÉ',
//     '50	IT RELATED SHOP',
//     '09	JAPANESE RESTAURANT',
//     '60	JOB PLACEMENT AGENCY',
//     '112 KINDERGARTEN',
//     '10	KOREAN RESTAURANT',
//     '03	LAUNDRY / DRY CLEANING',
//     '61	LIBRARY',
//     '29	LIGHTING SHOP',
//     '31	LIQUORS SHOP',
//     '77	LOCKSMITH',
//     '137 LOGISTICS (SHIPPING/FLIGHT)',
//     '59	MAID AGENCY',
//     '04	MALAY RESTAURANT',
//     '65	MARKET',
//     '17	MASJID',
//     '08	MIDDLE EAST RESTAURANT',
//     '25	MOTORBIKE SHOP / REPAIR',
//     '135 MUSEUM',
//     '52	MUSIC CD SHOP',
//     '84	MUSIC SCHOOL',
//     '91	NATIONAL SECURITY',
//     '133 NEW CAR DEALER',
//     '26	OFFICE',
//     '102 OLD FOLK HOME',
//     '67	OPTICIAN',
//     '41	PAWN SHOP',
//     '48	PET SHOP',
//     '103 PETROL STATION',
//     '66	PHARMACY',
//     '51	PHOTO SHOP',
//     '63	PLANT NURSERY',
//     '70	POST OFFICE',
//     '33	POULTRY SHOP',
//     '34	PRAYER SHOP',
//     '37	PRINTING SHOP',
//     '114 PRIVATE CLINIC',
//     '73	PRIVATE CLUB',
//     '122 PRIVATE COLLEGE',
//     '116 PRIVATE HOSPITAL',
//     '109 PRIVATE SCHOOL',
//     '35	PROVISION SHOP',
//     '62	PUBLIC HALL',
//     '64	PUBLIC TOILET',
//     '119 PUBS / DISCO',
//     '121 RECORDING STUDIO',
//     '93	REHABILITATION CENTRE',
//     '111 RELIGIOUS SCHOOL',
//     '108 RESORT',
//     '138 SALOON / SPA CENTRE',
//     '53	SCRAP SHOP',
//     '49	SHOES SHOP',
//     '88	SHOWROOM',
//     '142 SNACK SHOP',
//     '57	SOUVENIR SHOP',
//     '141 SPICE SHOP',
//     '95	SPORTS CENTRE',
//     '75	STORE',
//     '32	SUNDRY SHOP',
//     '127 SUPERMARKET / MINIMARKET',
//     '15	SURAU',
//     '02	TAILOR SHOP',
//     '16	TEMPLE',
//     '43	TEXTILE / GARMENT SHOP',
//     '11	THAI RESTAURANT',
//     '146 THEME PARK',
//     '144 TODLER ITEMS SHOP',
//     '56	TOYS SHOP',
//     '104 TRANSPORTATION SERVICES',
//     '58	TRAVEL AGENCY',
//     '97	TUITION CENTRE',
//     '113 UNIVERSITY',
//     '69	USED CAR DEALER',
//     '54	VIDEO SHOP',
//     '134 WAREHOUSE',
//     '38	WATCH / CLOCK SHOP',
//     '07	WESTERN RESTAURANT',
//     '86	WHOLESALE OUTLET',
//     '19	WORKSHOP'
//   ];

// //Common Inputs
//   TextEditingController imagecontroller = TextEditingController();

//   String occupierinitvalue = 'Choose';
//   final occupiertype = [
//     'Choose',
//     'Owner',
//     'Tenant',
//     'Vacant',
//     'Closed',
//   ];
//   String? selectedNationality = '';
//   String propertydomestictypeinitvalue = 'Choose';
//   String propertyusageinitvalue = 'Choose';
//   String drcodeinitvalue = 'Choose';
//   TextEditingController remarkcontroller = TextEditingController();


//   //OWNER INPUTS
//   String ownernamecorrectinitvalue = 'Yes';
//   TextEditingController correctownernamecontroller = TextEditingController();
//   TextEditingController ownertelnocontroller = TextEditingController();

//   //Tenant Inputs
//   String tenantpropertyusageinitvalueOwner = 'Choose';
//   TextEditingController tenantnamecontroller = TextEditingController();
//   TextEditingController tenanttelnocontroller = TextEditingController();


//   //Vacant Inputs
//   String? vacantselectedMeter = '';
//   TextEditingController vacantremarkcontroller = TextEditingController();
//   TextEditingController vacantwaterMetercontroller = TextEditingController();

//   File? vacantimage;
//   File? vacantimageMeter;
//   var vacantImageS;
  

//   _getFromCamera() async {
//     PickedFile? pickedFile = await ImagePicker()
//         .getImage(source: ImageSource.camera, imageQuality: 50
//              maxWidth: 600,
//               maxHeight: 600,
//             );
//     if (pickedFile != null) {
//       setState(() {
//         vacantimage = File(pickedFile.path);
//         vacantImageS = pickedFile.path;
//         print(vacantImageS);
//         //uploadFile();
//       });
//     }

//     var t = await vacantimage!.readAsBytes();
//     imgBytes = Uint8List.fromList(t);

//     watermarkedImgBytes = await image_watermark.addTextWatermark(
      
//       imgBytes,

//       ///image bytes
//       watermarkText, //watermark text
//       20, //
//       30,

//       color: Colors.white, //default : Colors.white
//     );

//        // String string_water = base64Encode(watermarkedImgBytes);
//         final dir = await getTemporaryDirectory();
//         await dir.create(recursive: true);
//          tempFile = File(path.join(dir.path, pickedFile!.path));
//         await tempFile!.writeAsBytes(base64.decode(base64Encode(watermarkedImgBytes)));

//   setState(() {
//          vacantimageMeter = tempFile!;
//               });
//   }





//     File? _image1;
//   List<File>? imageFileList = [];
//   List<File>? imageFileListWater = [];

//   var imgBytes;
//   var watermarkedImgBytes;

//   String watermarkText = "FO_Rider";
//   File? tempFile;

//   _getMultiFromCamera() async {
//     PickedFile? pickedFile = await ImagePicker()
//         .getImage(source: ImageSource.camera, imageQuality: 50
//             maxWidth: 600,
//              maxHeight: 600,
//             );
//     if (pickedFile != null) {
//       setState(() {
//         _image1 = File(pickedFile.path);
//         //uploadFile();

//         imageFileList!.add(_image1!);
//       });
//     }

//     var t = await _image1!.readAsBytes();
//     imgBytes = Uint8List.fromList(t);

//     watermarkedImgBytes = await image_watermark.addTextWatermark(
      
//       imgBytes,

//       ///image bytes
//       watermarkText, //watermark text
//       20, //
//       30,

//       color: Colors.white, //default : Colors.white
//     );

//        // String string_water = base64Encode(watermarkedImgBytes);
//         final dir = await getTemporaryDirectory();
//         await dir.create(recursive: true);
//          tempFile = File(path.join(dir.path, pickedFile!.path));
//         await tempFile!.writeAsBytes(base64.decode(base64Encode(watermarkedImgBytes)));

//   setState(() {
//          imageFileListWater!.add(tempFile!);
//               });
    

//     print(imageFileList);
//   }

  


  

//   // final multiPicker = ImagePicker();
//   // List<File>? imageFileList = [];

//   // Future getMultiImages() async {
//   //   _camera = false;

//   //   // _imageCamera.clear();

//   //   final List<XFile>? selectedImages = await multiPicker.pickMultiImage();
//   //   selectedImages!.forEach((image) {
//   //     setState(() {
//   //       imageFileList!.add(File(image.path));
//   //     });

//   //     print(imageFileList);
//   //   });
//   // }

//   final CustomTimerController _controller = CustomTimerController();

//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_rounded,
//             color: kPrimaryPurpleColor,
//             size: 25.0,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.qr_code_scanner),
//             color: Colors.deepPurple,
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => QRScanPage(),
//                   ));
//             },
//           ),
//           // IconButton(
//           //   icon: const Icon(Icons.download_sharp),
//           //   color: Colors.deepPurple,
//           //   onPressed: () {},
//           // )
//         ],
//       ),
//       body: NotificationListener<OverscrollIndicatorNotification>(
//           onNotification: (OverscrollIndicatorNotification overscroll) {
//             // ignore: deprecated_member_use
//             overscroll.disallowGlow();
//             return false;
//           },
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 20,
//                 right: 20.0,
//                 bottom: 20,
//                 top: 10,
//               ),
//               child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             width: 70,
//                             decoration: BoxDecoration(
//                                 color: kPrimaryPurpleColor,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(20))),
//                             child: Padding(
//                               padding: EdgeInsets.all(5),
//                               child: CustomTimer(
//                                 controller: _controller,
//                                 from: Duration(minutes: 05),
//                                 to: Duration(hours: 0),
//                                 onBuildAction: CustomTimerAction.auto_start,
//                                 builder: (CustomTimerRemainingTime remaining) {
//                                   return Text(
//                                     "${remaining.minutes}:${remaining.seconds}",
//                                     style: TextStyle(
//                                         fontSize: 14.0,
//                                         color: kPrimaryWhiteColor),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon: Icon(
//                               Icons.timer_outlined,
//                               color: kPrimaryPurpleColor,
//                             ),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "ID: ",
//                             style: TextStyle(
//                               color: kPrimaryPurpleColor,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             id,
//                             style: TextStyle(
//                               color: kPrimaryPurpleColor,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         "Bill:X6356185",
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                             color: kPrimaryPurpleColor),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "SAN: ",
//                             style: TextStyle(
//                               color: kPrimaryPurpleColor,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             san,
//                             style: TextStyle(
//                               color: kPrimaryPurpleColor,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(
//                         height: 20,
//                       ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Owner1: ",
//                             style: TextStyle(
//                               color: kPrimaryPurpleColor,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             owner1,
//                             style: TextStyle(
//                               color: kPrimaryPurpleColor,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         "Owner2: Name 2",
//                         // "@ NEW HOW . (If Owner 2 is available show else don't need )",
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                             color: kPrimaryPurpleColor),
//                       ),

//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         "Range5: >120 months",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.red),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         "Arrears:1,226.25",
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                             color: kPrimaryPurpleColor),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Total Payable Amount: ",
//                             style: TextStyle(
//                               color: kPrimaryPurpleColor,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             payment,
//                             style: TextStyle(
//                               color: kPrimaryPurpleColor,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(
//                         height: 30,
//                       ),
//                       // Take Photo DropDown
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Take Photo",
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: 250,
//                             width: screenWidth,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.deepPurple),
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.all(10),
//                               child: GestureDetector(
//                                 onTap: () async {
//                                   _controller.pause();
//                                   _getMultiFromCamera();
//                                 },
//                                 child: Container(
//                                   child: imageFileListWater!.isEmpty
//                                       ? Container(
//                                           decoration: BoxDecoration(
//                                             color: Colors.grey[100],
//                                             // borderRadius: BorderRadius.circular(50)
//                                           ),
//                                           width: screenWidth * 0.9,
//                                           height: screenHeight * 0.3,
//                                           child: Icon(
//                                             Icons.camera_alt,
//                                             color: Colors.grey[400],
//                                           ),
//                                         )
//                                       : GridView.builder(
//                                           itemCount: imageFileListWater!.isEmpty
//                                               ? 1
//                                               : imageFileListWater!.length,
//                                           gridDelegate:
//                                               SliverGridDelegateWithFixedCrossAxisCount(
//                                             crossAxisCount: 2,
//                                             mainAxisSpacing: 20,
//                                             crossAxisSpacing: 20,
//                                             // width / height: fixed for *all* items
//                                             childAspectRatio: 0.75,
//                                           ),
//                                           itemBuilder: (context, index) =>
//                                               Stack(
//                                             children: <Widget>[
//                                               Container(
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     border: Border.all(
//                                                         color: Colors.grey
//                                                             .withOpacity(0.5))),
//                                                 child: Image.file(
//                                                   File(imageFileListWater![index]
//                                                       .path),
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Stack(
//                                                 children: <Widget>[
//                                                   Positioned(
//                                                     right: -10,
//                                                     top: -10,
//                                                     child: GestureDetector(
//                                                       onTap: () {
//                                                         setState(() {
//                                                           imageFileListWater!
//                                                               .removeAt(index);
//                                                         });
//                                                       },
//                                                       child: Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                           left: 2,
//                                                           bottom: 2,
//                                                         ),
//                                                         height: 40,
//                                                         width: 40,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors
//                                                               .redAccent[400],
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       100),
//                                                         ),
//                                                         child: Align(
//                                                           alignment: Alignment
//                                                               .bottomLeft,
//                                                           child: Icon(
//                                                             Icons.cancel,
//                                                             color: Colors.white,
//                                                             size: 30,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Positioned(
//                                                 left: -10,
//                                                 bottom: -10,
//                                                 child: GestureDetector(
//                                                   onTap: () {
//                                                     print(index);
//                                                   },
//                                                   child: Container(
//                                                     padding: EdgeInsets.only(
//                                                       left: 5,
//                                                       bottom: 10,
//                                                     ),
//                                                     height: 40,
//                                                     width: 40,
//                                                     decoration: BoxDecoration(
//                                                       color:
//                                                           Colors.redAccent[400],
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               100),
//                                                     ),
//                                                     child: Align(
//                                                       alignment: Alignment
//                                                           .bottomCenter,
//                                                       child: Text(
//                                                         (index + 1).toString(),
//                                                         style: TextStyle(
//                                                           fontSize: 22,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),

//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Stop/Start Timer",
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               FlatButton(
//                                 child: Text("Photo Upload"),
//                                 onPressed: () {
//                                   _controller.start();
//                                 },
//                                 color: kPrimaryPurpleColor,
//                               ),
//                               SizedBox(
//                                 width: 60,
//                               ),
//                               // FlatButton(
//                               //   child: Text("Pause"),
//                               //   onPressed: () {
//                               //     _controller.pause();
//                               //   },
//                               //   color: kPrimaryPurpleColor,
//                               // ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       const Text(
//                         "Company",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w600),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),

//                       //Re Usable Widget

//                       //1
//                       textField("Name of the Company", nameCompanycontroller,"Your Answer",""),
//                       const SizedBox(
//                         height: 20,
//                       ),

//                       //Re Usable Widget

//                       //42 Drop Down
//                       const Text(
//                         "Type of Business",
//                         style: TextStyle(color: Colors.grey, fontSize: 12),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.only(left: 20, right: 10),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.deepPurple),
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         height: 45,
//                         width: MediaQuery.of(context).size.width,
//                         child: DropdownButton<String>(
//                           underline: Container(),
//                           icon: const Icon(
//                             Icons.keyboard_arrow_down,
//                             color: Colors.deepPurple,
//                           ),
//                           value: typeofbusinessinitvalue,
//                           isExpanded: true,
//                           items: typeofbusinesstype.map((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value,
//                                   style: TextStyle(
//                                       fontSize: 14, color: primaryColor)),
//                             );
//                           }).toList(),
//                           onChanged: (String? value) {
//                             setState(() {
//                               typeofbusinessinitvalue = value!;
//                             });
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),

//                       // Occupier DropDown

//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Occupier(Owner/Tenant )",
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 20, right: 10),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.deepPurple),
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             height: 45,
//                             width: MediaQuery.of(context).size.width,
//                             child: DropdownButton<String>(
//                               underline: Container(),
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Colors.deepPurple,
//                               ),
//                               value: occupierinitvalue,
//                               isExpanded: true,
//                               items: occupiertype.map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value,
//                                       style: TextStyle(
//                                           fontSize: 14, color: primaryColor)),
//                                 );
//                               }).toList(),
//                               onChanged: (String? value) async {
//                                 setState(() {
//                                   //  print( ownernamecorrectinitvalue, ownertelnocontroller, correctownernamecontroller, _selectedNationality, propertydomestictypeinitvalue, drcodeinitvalue, remarkcontroller);

//                                   occupierinitvalue = value!;
//                                   print(occupierinitvalue);
//                                   if (occupierinitvalue == 'Vacant') {
//                                     close = false;
//                                     occupier = true;
//                                     tenant = false;
//                                     owner = false;
//                                   } else if (occupierinitvalue == 'Closed') {
//                                     close = true;
//                                     occupier = false;
//                                     tenant == false;
//                                     owner = false;
//                                   } else if (occupierinitvalue == 'Owner') {
//                                     owner = true;
//                                     tenant = false;
//                                     occupier = false;
//                                     close = false;
//                                   } else if (occupierinitvalue == 'Tenant') {
//                                     tenant = true;
//                                     owner = false;
//                                     occupier = false;
//                                     close = false;
//                                   } else {
//                                     tenant = false;
//                                     owner = false;
//                                     occupier = false;
//                                     close = false;
//                                   }
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),

//                       owner == true
//                           ? Owner(
//                               context,
//                               ownernamecorrectinitvalue,
//                               ownertelnocontroller,
//                               correctownernamecontroller,
//                               selectedNationality,
//                               propertyusageinitvalue,
//                               propertydomestictypeinitvalue,
//                               drcodeinitvalue,
//                               remarkcontroller)
//                           : SizedBox(),

//                       tenant == true
//                           ? Tenant(
//                               context,
//                               tenantnamecontroller,
//                               tenanttelnocontroller,
//                               selectedNationality,
//                               propertyusageinitvalue,
//                               propertydomestictypeinitvalue,
//                               drcodeinitvalue,
//                               remarkcontroller)
//                           : SizedBox(),

//                       // Property Usage DropDown
//                       occupier == true
//                           ? StatefulBuilder(builder:
//                               (BuildContext context, StateSetter setState) {
//                               return Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Vacant(
//                                     context,
//                                  propertyusageinitvalue,
//                               propertydomestictypeinitvalue,
//                               drcodeinitvalue,
//                                     remarkcontroller,
//                                     vacantselectedMeter,
                               
//                                   ),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Meter Number",
//                                         style: const TextStyle(
//                                             fontSize: 12, color: Colors.grey),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Container(
//                                         height: 250,
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                               color: Colors.deepPurple),
//                                           borderRadius:
//                                               BorderRadius.circular(25),
//                                         ),
//                                         child: Padding(
//                                           padding: EdgeInsets.all(10),
//                                           child: GestureDetector(
//                                               onTap: () {
//                                                 setState(() async {
//                                                   _getFromCamera();
//                                                 });
//                                               },
//                                               child: Container(
//                                                 child: vacantimageMeter != null
//                                                     ? ClipRRect(
//                                                         // borderRadius: BorderRadius.circular(5),
//                                                         child: Image.file(
//                                                           vacantimageMeter!,
//                                                           fit: BoxFit.contain,
//                                                         ),
//                                                       )
//                                                     : Container(
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color:
//                                                               Colors.grey[100],
//                                                           image:
//                                                               DecorationImage(
//                                                             image: AssetImage(
//                                                                 "assets/Meter.jpg"),
//                                                             fit: BoxFit.cover,
//                                                           ),
//                                                           // borderRadius: BorderRadius.circular(50)
//                                                         ),
//                                                         width: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .width *
//                                                             (10 / 20),
//                                                         height: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height *
//                                                             (10 / 20),
//                                                       ),
//                                               )),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   textField("", vacantwaterMetercontroller,
//                                       "Your Answer", ""),
//                                 ],
//                               );
//                             })
//                           : SizedBox(),

//                       close == true
//                           ? Close(
//                               context,
//                               propertyusageinitvalue,
//                               propertydomestictypeinitvalue,
//                               drcodeinitvalue,
//                               remarkcontroller)
//                           : SizedBox(),

//                       SizedBox(
//                         height: 50,
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         height: 50,
//                         child: RaisedButton(
//                           color: Colors.deepPurple,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30)),
//                           onPressed: () async {
//                             // if (_formKey.currentState!.validate()) {
//                             //   openSubmit(context);
//                             // }

//                             submitSubscription();
//                           },
//                           child: const Text(
//                             "Submit",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//             ),
//           )),
//     );
//   }

//   Future<int> submitSubscription() async {
//     setState(() {
//       _isLoading = true;
//     });

//     ///MultiPart request
//     var request = http.MultipartRequest(
//       //   var auth ="http://api.mangakiku.com/api/addUser",
//       'PUT',
//       Uri.parse("https://dcaapi.moodfor.codes/domestics/" + id),
//     );
//     Map<String, String> headers = {
//       "Content-type": "multipart/form-data",
//       'Accept': "multipart/form-data",
//     };


    


//     request.files.add(
//       http.MultipartFile(
//         'WatermeterNumber',
//         vacantimageMeter!.readAsBytes().asStream(),
//         vacantimageMeter!.lengthSync(),
//         filename: vacantimageMeter!.path.split("/").last,
//         contentType: MediaType('image', 'jpg'),
//       ),
//     );
    
//        for (var i = 0; i < imageFileListWater!.length; i++) {
//   print("kITHU::::" + imageFileListWater![i].path.split("/").last,);
//       request.files.add(
//       http.MultipartFile(
//         'multifiles',
//         imageFileListWater![i].readAsBytes().asStream(),
//         imageFileListWater![i].lengthSync(),

//         filename: imageFileListWater![i].path.split("/").last,
//         contentType: MediaType('image', 'jpg'),
//       ),
//     );

// }


//     print(occupierinitvalue);
//     request.headers.addAll(headers);
//     request.fields.addAll({
//       "bill": "shan 32",
//       "san": san,
//       "Owner1": owner1,
//       "Address": add,
//       "Range5": "",
//       "Arrears": "",
//       "TotalPayableAmount": "21.2121",
//       "Occupier": occupierinitvalue,
//       "Ownernamecorrect": ownernamecorrectinitvalue,
//       "correctownername": correctownernamecontroller.text,
//       "OwnerTelno": ownertelnocontroller.text,
//       "Tenantname": tenantnamecontroller.text,
//       "TenantTelno": tenanttelnocontroller.text,
//       "OccupierNationality": selectedNationality.toString(),
//       "PropertyUsage": propertyusageinitvalue,
//       "PropertytypeDomestic": propertydomestictypeinitvalue,
//       "DRCode": drcodeinitvalue,
//       "Remarks": remarkcontroller.text,
//       "DR05VACANTPREMISE": vacantselectedMeter.toString(),

   
//       // "WatermeterNumber": "WatermeterNumber_domestic_1650011410833.jpg",
//       // "multifiles": "img1.jpg",
//       // "multifiles": "img2.jpg",
//       // "multifiles": "img3.jpg",
//     });
//     // print("request: " + request.toString());
//     var res = await request.send();
//     // print("This is response:" + res.toString());

//     final respStr = await res.stream.bytesToString();
//     // print(respStr);

//     final body = json.decode(respStr);
//     print(body);

//     // bodyError = body['message'];

//     if (body["errorMessage"] == false) {
//       // Navigator.of(context).pushReplacement(
//       //   MaterialPageRoute(builder: (BuildContext context) => HomePage()),
//       // );
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//     }

//     return res.statusCode;
//   }

//   Future openSubmit(BuildContext context) => showDialog(
//         context: context,
//         builder: (context) => StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//           return Center(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height * 0.27,
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: AlertDialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 backgroundColor: Colors.white,
//                 content: Column(
//                   children: [
//                     Text(
//                       "Sucessfull Added",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: kPrimaryPurpleColor),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text("All Records Inserted",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey,
//                         )),
//                   ],
//                 ),
//                 actions: [
//                   Center(
//                     child: SizedBox(
//                       width: 80,
//                       height: 40,
//                       child: TextButton(
//                         style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(kPrimaryPurpleColor),
//                             shape: MaterialStateProperty.all(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20)))),
//                         child: Text(
//                           "OK",
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       );
// }
