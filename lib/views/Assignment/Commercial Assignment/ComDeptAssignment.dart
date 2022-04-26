// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/ResuableTextFormFeild/reusabletextfield.dart';
import 'package:riders_app/views/Calendar/Calendar.dart';




class ComDeptAssignmentScreen extends StatefulWidget {
  const ComDeptAssignmentScreen({Key? key}) : super(key: key);

  @override
  State<ComDeptAssignmentScreen> createState() => _ComDeptAssignmentScreenState();
}

class _ComDeptAssignmentScreenState extends State<ComDeptAssignmentScreen> {
  final _formKey = GlobalKey<FormState>();

  String typeofbusinessinitvalue = "choose";
  final typeofbusinesstype = [
    'choose',
    'NB13 24 HRS SUNDRY SHOP (7 ELEVEN)',
    'NB28 ACCESSORIES SHOP',
    'NB89	BAKERY',
    'NB27	BANK',
    'NB46	BARBER SHOP',
    'NB96	BEAUTY CENTRE',
    'NB24	BICYCLE SHOP / REPAIR',
    'NB44	BOOK STORE / STATIONERY SHOP',
    'NB76	BOUTIQUE',
    'NB36	BRIDAL SHOP',
    'NB85	BUS STATION',
    'NB139 CAFE',
    'NB40	CANDY SHOP',
    'NB14	CANTEEN',
    'NB21	CAR ACCESSORIES SHOP',
    'NB23	CAR PARK',
    'NB20	CAR SERVICE CENTRE',
    'NB22	CAR WASH',
    'NB39	CARPET SHOP',
    'NB100 CASKET & FUNERAL SERVICES',
    'NB107 CHALET',
    'NB101 CHARITY HOME',
    'NB80	CHINESE MEDICAL HALL',
    'NB05	CHINESE RESTAURANT',
    'NB18	CHURCH',
    'NB78	CINEMA',
    'NB145 CLEANING SERVICES',
    'NB87	COMMERCIAL COMPLEX',
    'NB132 COURIER SERVICE SHOP',
    'NB79	CUSTOMER SERVICE CENTRE',
    'NB83	DANCING SCHOOL',
    'NB94	DAY CARE CENTRE',
    'NB129 DEPARTMENTAL STORE (JAYA JUSCO,SOGO,ETC)',
    'NB68	DRIVING SCHOOL',
    'NB30	ELECTRICAL SHOP',
    'NB124 ENGINEERING FACTORY',
    'NB126 ENTERTAINMENT OUTLET (I.E.KAROAKE)',
    'B123	FACTORY',
    'NB12	FAST FOOD RESTAURANT',
    'NB81	FISHING EQUIPMENT',
    'NB120 FITNESS CENTRE / GYMNASIUM',
    'NB72	FLORIST',
    'NB13	FOOD COURT',
    'NB47	FRAME SHOP',
    'NB55	FROZEN FOOD SHOP',
    'NB82	FRUIT SHOP',
    'NB98	FURNITURE SHOP / HOME FURNISHING',
    'NB71	GALLERY',
    'NB130 GAMING OUTLET (SPORTS TOTO,MAGNUM,ETC)',
    'NB140 GAS SHOP',
    'NB74	GOLDSMITH',
    'NB99	GOLF CLUB',
    'NB136 GOVT BODIES',
    'NB115 GOVT CLINIC',
    'NB117 GOVT HOSPITAL',
    'NB110 GOVT SCHOOL',
    'NB42	HANDICRAFT SHOP',
    'NB45	HANDPHONE / TELECOMMUNICATION SHOP',
    'NB01	HARDWARE SHOP',
    'NB92	HEALTHCARE CENTRE',
    'NB125 HOME DÉCOR',
    'NB106 HOSTEL',
    'NB105 HOTEL',
    'NB128 HYPERMARKET',
    'NB143 ICE SUPPLIER',
    'NB06	INDIAN RESTAURANT',
    'NB90	INSURANCE COMPANY',
    'NB118 INTERNET CAFÉ',
    'NB50	IT RELATED SHOP',
    'NB09	JAPANESE RESTAURANT',
    'NB60	JOB PLACEMENT AGENCY',
    'NB112 KINDERGARTEN',
    'NB10	KOREAN RESTAURANT',
    'NB03	LAUNDRY / DRY CLEANING',
    'NB61	LIBRARY',
    'NB29	LIGHTING SHOP',
    'NB31	LIQUORS SHOP',
    'NB77	LOCKSMITH',
    'NB137 LOGISTICS (SHIPPING/FLIGHT)',
    'NB59	MAID AGENCY',
    'NB04	MALAY RESTAURANT',
    'NB65	MARKET',
    'NB17	MASJID',
    'NB08	MIDDLE EAST RESTAURANT',
    'NB25	MOTORBIKE SHOP / REPAIR',
    'NB135 MUSEUM',
    'NB52	MUSIC CD SHOP',
    'NB84	MUSIC SCHOOL',
    'NB91	NATIONAL SECURITY',
    'NB133 NEW CAR DEALER',
    'NB26	OFFICE',
    'NB102 OLD FOLK HOME',
    'NB67	OPTICIAN',
    'NB41	PAWN SHOP',
    'NB48	PET SHOP',
    'NB103 PETROL STATION',
    'NB66	PHARMACY',
    'NB51	PHOTO SHOP',
    'NB63	PLANT NURSERY',
    'NB70	POST OFFICE',
    'NB33	POULTRY SHOP',
    'NB34	PRAYER SHOP',
    'NB37	PRINTING SHOP',
    'NB114 PRIVATE CLINIC',
    'NB73	PRIVATE CLUB',
    'NB122 PRIVATE COLLEGE',
    'NB116 PRIVATE HOSPITAL',
    'NB109 PRIVATE SCHOOL',
    'NB35	PROVISION SHOP',
    'NB62	PUBLIC HALL',
    'NB64	PUBLIC TOILET',
    'NB119 PUBS / DISCO',
    'NB121 RECORDING STUDIO',
    'NB93	REHABILITATION CENTRE',
    'NB111 RELIGIOUS SCHOOL',
    'NB108 RESORT',
    'NB138 SALOON / SPA CENTRE',
    'NB53	SCRAP SHOP',
    'NB49	SHOES SHOP',
    'NB88	SHOWROOM',
    'NB142 SNACK SHOP',
    'NB57	SOUVENIR SHOP',
    'NB141 SPICE SHOP',
    'NB95	SPORTS CENTRE',
    'NB75	STORE',
    'NB32	SUNDRY SHOP',
    'NB127 SUPERMARKET / MINIMARKET',
    'NB15	SURAU',
    'NB02	TAILOR SHOP',
    'NB16	TEMPLE',
    'NB43	TEXTILE / GARMENT SHOP',
    'NB11	THAI RESTAURANT',
    'NB146 THEME PARK',
    'NB144 TODLER ITEMS SHOP',
    'NB56	TOYS SHOP',
    'NB104 TRANSPORTATION SERVICES',
    'NB58	TRAVEL AGENCY',
    'NB97	TUITION CENTRE',
    'NB113 UNIVERSITY',
    'NB69	USED CAR DEALER',
    'NB54	VIDEO SHOP',
    'NB134 WAREHOUSE',
    'NB38	WATCH / CLOCK SHOP',
    'NB07	WESTERN RESTAURANT',
    'NB86	WHOLESALE OUTLET',
    'NB19	WORKSHOP'
  ];

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

  TextEditingController imagecontroller = TextEditingController();

   TextEditingController nameCompanycontroller = TextEditingController();
    TextEditingController typebusinesscontroller = TextEditingController();

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
  //

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
          icon: Icon(
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
          child:   Padding(
                padding: EdgeInsets.all(
                  20,
                ),
            child: Form(
              key: _formKey,
             
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            const Text(
                      "Dept Assignment",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
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
                                       controller: _controller ,
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
                        ],),
                  
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
                            child: Text(value,
                                style: TextStyle(
                                    fontSize: 14, color: primaryColor)),
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
                      height: 20,
                    ),
                    // Drop Down

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Input File",
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
                              onTap: () async{
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
                                        width: screenWidth * (10 / 20),
                                        height: screenHeight * (10 / 20),
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
                                        itemBuilder: (context, index) => Stack(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(0.5))),
                                              child: Image.file(
                                                File(
                                                    imageFileList![index].path),
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
                      ],
                    ),
                    const SizedBox(
                            height: 40,
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
                          
                            ],
                          ),
                        ],
                      ),

                        const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Company",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Re Usable Widget

                    //1
                    textField("Name of the Company", nameCompanycontroller,"Your Answer",""),
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
                            typeofbusinessinitvalue= value!;
                          });
                        },
                      ),
                    ),
                 
                 
//
                    const SizedBox(
                      height: 40,
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
                    textField("Exclude", excludecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //2
                    textField("IWK Special Instruction", iwkspecialcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //3
                    textField("DCA File Type", dcafilecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //4
                    textField("DCA Name", dcanamecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //5
                    textField("DCA Code", dcacodecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //6
                    textField("State", statecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //7
                    textField("Cost State", coststatecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //8
                    textField("UO", uocontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //9
                    textField("La Name", lanamecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //10
                    textField("Bil No", bilnocontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //11
                    textField("San", sancontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //12
                    textField("Range Due", rangeduecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //13
                    textField(
                        "Customer Telephone Number", custelephonenocontroller,"Your Answer","number"),
                    const SizedBox(
                      height: 30,
                    ),
                    //14
                    textField("Customer Mobile Number", cusmobilenocontroller,"Your Answer","number"),
                    const SizedBox(
                      height: 30,
                    ),
                    //15
                    textField("Customer Fax Number", cusfaxnocontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //16
                    textField("Customer Email", cusemailcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //17
                    textField("Owner 1", owner1controller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //18
                    textField("Owner 2", owner2controller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //19
                    textField("Prop Address 1", propaddr1controller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //20
                    textField("Prop Address 2", propaddr2controller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //21
                    textField("Prop Address 3", propaddr3controller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //22
                    textField("Prop Address 4", propaddr4controller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //23
                    textField("Prop Address 5", propaddr5controller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //24
                    textField("Building", buildingcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //25
                    textField("Building Id", buildingidcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //26
                    textField("Road Name", roadnamecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //27
                    textField("Taman", tamancontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //28
                    textField("PostCode", postcodecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //29
                    textField("Suburb", suburbcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //30
                    textField("Mail Name 1 Bill", mailname1bilcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //31
                    textField("Mail Name 2 Bill", mailname2bilcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //32
                    textField("Mail Address 1 Bill", mailaddr1bilcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //33
                    textField("Mail Address 2 Bill", mailaddr2bilcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //34
                    textField("Mail Address 3 Bill", mailaddr3bilcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //35
                    textField("Mail Address 4 Bill", mailaddr4bilcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //36
                    textField(
                        "Balance Amount At Date", balanceamountdatecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //37
                    textField("Balance Amout As Copy Bill ",
                        balanceamountcopybilcontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //38
                    textField(
                        "Difference Between Balance As Copy Bill And Balance At Date",
                        differencebetweenbalancecontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //39
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Visit Date",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          cursorColor: kPrimaryPurpleColor,
                          keyboardType: TextInputType.none,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Required';
                            }
                          },
                          showCursor: false,
                          controller: visitdatecontroller,
                          textInputAction: TextInputAction.none,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  await openDate(context, );
                                  // showPicker(context);
                                  visitdatecontroller.text =
                                      customFormat.format(selectedDate);
                                },
                                icon: Icon(
                                  Icons.calendar_today_rounded,
                                  color: kPrimaryPurpleColor,
                                )),
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
                        Text(
                          "Update Reminder",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          cursorColor: kPrimaryPurpleColor,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Required';
                            }
                          },
                          controller: updateremindercontroller,
                          textInputAction: TextInputAction.none,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  await openDate(context, );
                                  // showPicker(context);
                                  updateremindercontroller.text =
                                      customFormat.format(selectedDate);
                                },
                                icon: Icon(Icons.calendar_today_rounded,
                                    color: kPrimaryPurpleColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: kPrimaryPurpleColor)),
                            contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 0),
                            fillColor: kPrimaryWhiteColor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
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
                    textField("Occupier", occupiercontroller,"",""),
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
                            child: Text(value,
                                style: TextStyle(
                                    fontSize: 14, color: primaryColor)),
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
                        specifycorrectownernamecontroller,"",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //44
                    textField(
                        "Owner Telephone Number", ownertelephonenocontroller,"","number"),
                    const SizedBox(
                      height: 30,
                    ),
                    //45
                    textField("Owner Mobile Number", ownermobilenocontroller,"","number"),
                    const SizedBox(
                      height: 30,
                    ),
                    //46
                    textField("Owner Fax Number", ownerfaxnocontroller,"","number"),
                    const SizedBox(
                      height: 30,
                    ),
                    //47
                    textField("Owner Email", owneremailcontroller,"",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //48
                    textField("Tenant Name", tenantnamecontroller,"",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //49
                    textField(
                        "Tenant Telephone Number", tenanttelephonenocontroller,"","number"),
                    const SizedBox(
                      height: 30,
                    ),
                    //50
                    textField("Tenant Mobile Number", tenantmobilenocontroller,"","number"),
                    const SizedBox(
                      height: 30,
                    ),
                    //51
                    textField("Tenant Fax Number", tenantfaxcontroller,"","number"),
                    const SizedBox(
                      height: 30,
                    ),
                    //52
                    textField("Tenant Email", tenantemailcontroller,"",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //53
                    textField(
                        "Occupier Nationality", occupiernationalitycontroller,"",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //54
                    textField("No Of Visitation", noofvisitationcontroller,"",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //55
                    textField("No of Follow Up", nooffollowupcontroller,"",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //56
                    textField("Property Usage", propertyusagecontroller,"",""),
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
                            child: Text(value,
                                style: TextStyle(
                                    fontSize: 14, color: primaryColor)),
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
                        "Name Of Shop Company", nameofshopcompanycontroller,"Your Answer",""),
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
                            child: Text(value,
                                style: TextStyle(
                                    fontSize: 14, color: primaryColor)),
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
                    const SizedBox(
                      height: 30,
                    ),
                    //61
                    textField("Black Area", blackareacontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //62
                    textField("Reason Customer", reasoncustomercontroller,"Your Answer",""),
                    const SizedBox(
                      height: 30,
                    ),
                    //63
                    textField("Business Close Down", businessclosecontroller,"Your Answer",""),
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
                          openSubmit(context);
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
