// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/Assignment/LandedAssignment/DeptAssignID.dart';
import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Close.dart';
import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Owner.dart';
import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Tenant.dart';
import 'package:riders_app/views/Assignment/LandedAssignment/Occupier/Vacant.dart';
import 'package:riders_app/views/ResuableTextFormFeild/reusabletextfield.dart';

class ComDomesticScreen extends StatefulWidget {
  const ComDomesticScreen({Key? key}) : super(key: key);

  @override
  State<ComDomesticScreen> createState() => _ComDomesticScreenState();
}

class _ComDomesticScreenState extends State<ComDomesticScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController imagecontroller = TextEditingController();

  String occupierinitvalue = 'Choose';
  final occupiertype = [
    'Choose',
    'Owner',
    'Tenant',
    'Vacant',
    'Closed',
  ];

  bool occupier = false;
  bool owner = false;
  bool tenant = false;
  bool close = false;

  TextEditingController nameCompanycontroller = TextEditingController();
  TextEditingController typebusinesscontroller = TextEditingController();

  String typeofbusinessinitvalue = "choose";
  final typeofbusinesstype = [
    'choose',
    '13 24 HRS SUNDRY SHOP (7 ELEVEN)',
    '28 ACCESSORIES SHOP',
    '89	BAKERY',
    '27	BANK',
    '46	BARBER SHOP',
    '96	BEAUTY CENTRE',
    '24	BICYCLE SHOP / REPAIR',
    '44	BOOK STORE / STATIONERY SHOP',
    '76	BOUTIQUE',
    '36	BRIDAL SHOP',
    '85	BUS STATION',
    '139 CAFE',
    '40	CANDY SHOP',
    '14	CANTEEN',
    '21	CAR ACCESSORIES SHOP',
    '23	CAR PARK',
    '20	CAR SERVICE CENTRE',
    '22	CAR WASH',
    '39	CARPET SHOP',
    '100 CASKET & FUNERAL SERVICES',
    '107 CHALET',
    '101 CHARITY HOME',
    '80	CHINESE MEDICAL HALL',
    '05	CHINESE RESTAURANT',
    '18	CHURCH',
    '78	CINEMA',
    '145 CLEANING SERVICES',
    '87	COMMERCIAL COMPLEX',
    '132 COURIER SERVICE SHOP',
    '79	CUSTOMER SERVICE CENTRE',
    '83	DANCING SCHOOL',
    '94	DAY CARE CENTRE',
    '129 DEPARTMENTAL STORE (JAYA JUSCO,SOGO,ETC)',
    '68	DRIVING SCHOOL',
    '30	ELECTRICAL SHOP',
    '124 ENGINEERING FACTORY',
    '126 ENTERTAINMENT OUTLET (I.E.KAROAKE)',
    '123	FACTORY',
    '12	FAST FOOD RESTAURANT',
    '81	FISHING EQUIPMENT',
    '120 FITNESS CENTRE / GYMNASIUM',
    '72	FLORIST',
    '13	FOOD COURT',
    '47	FRAME SHOP',
    '55	FROZEN FOOD SHOP',
    '82	FRUIT SHOP',
    '98	FURNITURE SHOP / HOME FURNISHING',
    '71	GALLERY',
    '130 GAMING OUTLET (SPORTS TOTO,MAGNUM,ETC)',
    '140 GAS SHOP',
    '74	GOLDSMITH',
    '99	GOLF CLUB',
    '136 GOVT BODIES',
    '115 GOVT CLINIC',
    '117 GOVT HOSPITAL',
    '110 GOVT SCHOOL',
    '42	HANDICRAFT SHOP',
    '45	HANDPHONE / TELECOMMUNICATION SHOP',
    '01	HARDWARE SHOP',
    '92	HEALTHCARE CENTRE',
    '125 HOME DÉCOR',
    '106 HOSTEL',
    '105 HOTEL',
    '128 HYPERMARKET',
    '143 ICE SUPPLIER',
    '06	INDIAN RESTAURANT',
    '90	INSURANCE COMPANY',
    '118 INTERNET CAFÉ',
    '50	IT RELATED SHOP',
    '09	JAPANESE RESTAURANT',
    '60	JOB PLACEMENT AGENCY',
    '112 KINDERGARTEN',
    '10	KOREAN RESTAURANT',
    '03	LAUNDRY / DRY CLEANING',
    '61	LIBRARY',
    '29	LIGHTING SHOP',
    '31	LIQUORS SHOP',
    '77	LOCKSMITH',
    '137 LOGISTICS (SHIPPING/FLIGHT)',
    '59	MAID AGENCY',
    '04	MALAY RESTAURANT',
    '65	MARKET',
    '17	MASJID',
    '08	MIDDLE EAST RESTAURANT',
    '25	MOTORBIKE SHOP / REPAIR',
    '135 MUSEUM',
    '52	MUSIC CD SHOP',
    '84	MUSIC SCHOOL',
    '91	NATIONAL SECURITY',
    '133 NEW CAR DEALER',
    '26	OFFICE',
    '102 OLD FOLK HOME',
    '67	OPTICIAN',
    '41	PAWN SHOP',
    '48	PET SHOP',
    '103 PETROL STATION',
    '66	PHARMACY',
    '51	PHOTO SHOP',
    '63	PLANT NURSERY',
    '70	POST OFFICE',
    '33	POULTRY SHOP',
    '34	PRAYER SHOP',
    '37	PRINTING SHOP',
    '114 PRIVATE CLINIC',
    '73	PRIVATE CLUB',
    '122 PRIVATE COLLEGE',
    '116 PRIVATE HOSPITAL',
    '109 PRIVATE SCHOOL',
    '35	PROVISION SHOP',
    '62	PUBLIC HALL',
    '64	PUBLIC TOILET',
    '119 PUBS / DISCO',
    '121 RECORDING STUDIO',
    '93	REHABILITATION CENTRE',
    '111 RELIGIOUS SCHOOL',
    '108 RESORT',
    '138 SALOON / SPA CENTRE',
    '53	SCRAP SHOP',
    '49	SHOES SHOP',
    '88	SHOWROOM',
    '142 SNACK SHOP',
    '57	SOUVENIR SHOP',
    '141 SPICE SHOP',
    '95	SPORTS CENTRE',
    '75	STORE',
    '32	SUNDRY SHOP',
    '127 SUPERMARKET / MINIMARKET',
    '15	SURAU',
    '02	TAILOR SHOP',
    '16	TEMPLE',
    '43	TEXTILE / GARMENT SHOP',
    '11	THAI RESTAURANT',
    '146 THEME PARK',
    '144 TODLER ITEMS SHOP',
    '56	TOYS SHOP',
    '104 TRANSPORTATION SERVICES',
    '58	TRAVEL AGENCY',
    '97	TUITION CENTRE',
    '113 UNIVERSITY',
    '69	USED CAR DEALER',
    '54	VIDEO SHOP',
    '134 WAREHOUSE',
    '38	WATCH / CLOCK SHOP',
    '07	WESTERN RESTAURANT',
    '86	WHOLESALE OUTLET',
    '19	WORKSHOP'
  ];

  //OWNER INPUTS
  String ownernamecorrectinitvalue = 'Yes';
  TextEditingController correctownernamecontroller = TextEditingController();
  TextEditingController ownertelnocontroller = TextEditingController();
  String ownerpropertyusageinitvalue = 'Choose';
  String? ownerselectedNationality = '';
  String ownerpropertydomestictypeinitvalue = 'Choose';
  String ownerdrcodeinitvalue = 'Choose';
  TextEditingController ownerremarkcontroller = TextEditingController();

  //Tenant Inputs
  String tenantpropertyusageinitvalueOwner = 'Choose';
  String? tenantselectedNationality = '';
  String tenantpropertyusageinitvalue = 'Choose';
  String tenantpropertydomestictypeinitvalue = 'Choose';
  String tenantdrcodeinitvalue = 'Choose';
  TextEditingController tenantnamecontroller = TextEditingController();
  TextEditingController tenanttelnocontroller = TextEditingController();
  TextEditingController tenantremarkcontroller = TextEditingController();

  //Vacant Inputs
  String? vacantselectedMeter = '';
  String vacantpropertyusageinitvalue = 'Choose';
  String vacantpropertydomestictypeinitvalue = 'Choose';
  String vacantdrcodeinitvalue = '5 DR05 VACANT PREMISE';
  TextEditingController vacantremarkcontroller = TextEditingController();
  TextEditingController vacantwaterMetercontroller = TextEditingController();
  File? vacantimage;

  //Close Inputs
  String closepropertyusageinitvalueOwner = 'Choose';
  String closepropertyusageinitvalue = 'Choose';
  String closepropertydomestictypeinitvalue = 'Choose';
  String closedrcodeinitvalue =
      '22 DR22 CLOSED (PLEASE INSERT TOTAL OF VISITATION INTO COLUMN "NUMBER OF VISITATION")';
  TextEditingController closeremarkcontroller = TextEditingController();

  // File? _image;
  // bool image = false;

  // _getFromCamera() async {
  //   PickedFile? pickedFile = await ImagePicker()
  //       .getImage(source: ImageSource.camera, imageQuality: 50
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

  // actionsheetTakePhoto(BuildContext context) {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) {
  //       return CupertinoActionSheet(
  //         actions: [
  //           CupertinoActionSheetAction(
  //               onPressed: () async {
  //                 _camera = true;
  //                 _getMultiFromCamera();
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Align(
  //                   alignment: Alignment.topLeft, child: Text("Camera"))),
  //           CupertinoActionSheetAction(
  //               onPressed: () async {
  //                 // _getFromGallery();
  //                 getMultiImages();
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Align(
  //                   alignment: Alignment.topLeft, child: Text("Upload"))),
  //         ],
  //         cancelButton: CupertinoActionSheetAction(
  //           child: const Text("Cancel"),
  //           onPressed: () => Navigator.of(context).pop(),
  //         ),
  //       );
  //     },
  //   );
  // }

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

  // final multiPicker = ImagePicker();
  // List<File>? imageFileList = [];

  // Future getMultiImages() async {
  //   _camera = false;

  //   // _imageCamera.clear();

  //   final List<XFile>? selectedImages = await multiPicker.pickMultiImage();
  //   selectedImages!.forEach((image) {
  //     setState(() {
  //       imageFileList!.add(File(image.path));
  //     });

  //     print(imageFileList);
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  final CustomTimerController _controller = CustomTimerController();

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
                     Navigator.pop(context);
          },
        ),
        actions: [
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
              padding: EdgeInsets.only(
                left: 20,
                right: 20.0,
                bottom: 20,
                top: 10,
              ),
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
                        "Owner1: Name1",
                        // "@ NEW HOW . (If Owner 2 is available show else don't need )",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryPurpleColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Owner2: Name 2",
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
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
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: Icon(
                                                      Icons.cancel,
                                                      color:
                                                          Colors.redAccent[400],
                                                      size: 40,
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
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Stop/Start Timer",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlatButton(
                                child: Text("Photo Upload"),
                                onPressed: () {
                                  _controller.start();
                                },
                                color: kPrimaryPurpleColor,
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              // FlatButton(
                              //   child: Text("Pause"),
                              //   onPressed: () {
                              //     _controller.pause();
                              //   },
                              //   color: kPrimaryPurpleColor,
                              // ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Company",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //Re Usable Widget

                      //1
                      textField("Name of the Company", nameCompanycontroller,"Your Answer"),
                      const SizedBox(
                        height: 20,
                      ),

                      //Re Usable Widget

                      //42 Drop Down
                      const Text(
                        "Type of Business",
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
                          value: typeofbusinessinitvalue,
                          isExpanded: true,
                          items: typeofbusinesstype.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 14, color: primaryColor)),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              typeofbusinessinitvalue = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      // Occupier DropDown

                      const Text(
                        "Occupier",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Occupier(Owner/Tenant )",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(
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
                                  //  print( ownernamecorrectinitvalue, ownertelnocontroller, correctownernamecontroller, _selectedNationality, propertydomestictypeinitvalue, drcodeinitvalue, remarkcontroller);

                                  occupierinitvalue = value!;
                                  if (occupierinitvalue ==
                                      'Vacant**(please take photo for watermark)') {
                                    close = false;
                                    occupier = true;
                                    tenant = false;
                                    owner = false;
                                  } else if (occupierinitvalue == 'Closed') {
                                    close = true;
                                    occupier = false;
                                    tenant == false;
                                    owner = false;
                                  } else if (occupierinitvalue == 'Owner') {
                                    owner = true;
                                    tenant = false;
                                    occupier = false;
                                    close = false;
                                  } else if (occupierinitvalue == 'Tenant') {
                                    tenant = true;
                                    owner = false;
                                    occupier = false;
                                    close = false;
                                  } else {
                                    tenant = false;
                                    owner = false;
                                    occupier = false;
                                    close = false;
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      owner == true
                          ? Owner(
                              context,
                              ownernamecorrectinitvalue,
                              ownertelnocontroller,
                              correctownernamecontroller,
                              ownerselectedNationality,
                              ownerpropertyusageinitvalue,
                              ownerpropertydomestictypeinitvalue,
                              ownerdrcodeinitvalue,
                              ownerremarkcontroller)
                          : SizedBox(),

                      tenant == true
                          ? Tenant(
                              context,
                              tenantnamecontroller,
                              tenanttelnocontroller,
                              tenantselectedNationality,
                              tenantpropertyusageinitvalue,
                              tenantpropertydomestictypeinitvalue,
                              tenantdrcodeinitvalue,
                              tenantremarkcontroller)
                          : SizedBox(),

                      // Property Usage DropDown
                      occupier == true
                          ? Vacant(
                              context,
                              vacantpropertyusageinitvalue,
                              vacantpropertydomestictypeinitvalue,
                              vacantdrcodeinitvalue,
                              vacantremarkcontroller,
                              vacantselectedMeter,
                              vacantwaterMetercontroller)
                          : SizedBox(),

                      close == true
                          ? Close(
                              context,
                              closepropertyusageinitvalue,
                              closepropertydomestictypeinitvalue,
                              closedrcodeinitvalue,
                              closeremarkcontroller)
                          : SizedBox(),

                      SizedBox(
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
                              openSubmit(context);
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

  Future openSubmit(BuildContext context) => showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.9,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.white,
                content: Column(
                  children: [
                    Text(
                      "Sucessfull Added",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryPurpleColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("All Records Inserted",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                  ],
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      width: 80,
                      height: 40,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryPurpleColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: Text(
                          "OK",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        }),
      );
}
