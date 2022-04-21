// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:riders_app/_helpers/constants.dart';
// import 'package:riders_app/views/ResuableTextFormFeild/reusabletextfield.dart';



// class TaskManagementScreen extends StatefulWidget {
//   const TaskManagementScreen({Key? key}) : super(key: key);

//   @override
//   State<TaskManagementScreen> createState() => _TaskManagementScreenState();
// }

// class _TaskManagementScreenState extends State<TaskManagementScreen> {
//   String assigninitvalue = 'Select';
//   final assignments = [
//     'Select',
//     '20-2021-D-F28-RCF24F25-LND(SELANGOR)',
//     '29-VACANT BATCHJAN2022(TAIPING)'
//   ];
//   String manageinitvalue = 'Select';
//   final manage = [
//     'Select',
//     'DR Code',
//     'Nature of Business',
//     'Update Type of Property',
//     'Property Usage',
//     'Visit Date',
//     'Update Reminder',
//     'Complete Status'
//   ];

//   String DRcodeinitvalue = 'Select';
//   final DRcode = [
//     'Select',
//     'DR01-Payment Made After Dca Visit',
//     'DR02-Promised To Pay',
//     'DR03-Refuse To pay',
//     'DR04-Unable To pay',
//     'DR05- Vacant To pay',
//     'DR06-Vacant Land',
//     'DR07-Abandon',
//     'DR08-No Toilet',
//     'DR09-Demolished',
//     'DR10-Building Burnt',
//     'DR11-Under Renovation',
//     'DR12-Prop Cannot Be Located',
//     'DR13-Under Liquidation',
//     'DR14-Further Explanation & Follow Up Required ',
//     'DR15-Business Only Operated in The Evening',
//     'DR16-Request For Installment plan',
//     'DR17-Request For Statement Of Account (Soa)',
//     'DR18-Requested For Copy Bill',
//     'DR19-Colected Postdated Cheques',
//     'DR20-Other Remarks , Please Specify in Remark Column',
//     'DR21-Domestic Usage(For Commercial Assignment only)',
//     'DR22-Closed (Please Insert Total Of Visitation into Column "Number Of Visitation")',
//     'DR23-Leave Message To Call ',
//     'DR25-Tenant Claim Owner To Pay',
//     'DR26-Tenant Paid To Owner',
//     'DR27-New Tenant / Same Owner',
//     'DR28-Payment is Outstanding But Claim Paid',
//     'DR29-Store, Without SignBoard',
//     'DR30-Bankrupt/ Property under Court Case',
//     'DR31-Bulk Billing',
//     'DR32-No Water Meter',
//     'DR33-Under Receivership',
//     'DR34-Cooling Tower Usage(For Commercial Assignment only)',
//     'DR35-Owner Claim Tenant to Pay',
//     'DR36-Commercial Usage(For Domestic Assignment Only)',
//     'DR37-Customer Dispute On Charges',
//     'DR38-Nobody In The Area To Refer',
//     'DR39-Claim No Service Provide',
//     'DR40-Management Refuses To Cooperate',
//     'DR41-New Owner refuse To Pay Previous Owner Outstanding',
//     'DR42-Customer Refuse To Meet Dca',
//     'DR43-Property Agent Refuse To Cooperate',
//     'DR44-Black Area',
//     'DR45-Political Parties Advise Customer Not To Pay Iwk charge',
//     'DR46-Not Received Bill',
//     'DR47-Claim Payed to lst Tanker',
//     'DR48-Premise Occupy By Foreigner-Communication Issues',
//     'DR49-Owner is in Overseas',
//     'DR50-Welfare Society -Cant Affort to pay',
//     'DR51-Zombie Debts( The Whole Area/ Building is Abandone Or Abandone Project'
//   ];

//   String NOBinitvalue = 'Select';
//   final NOBvalue = [
//     'Select',
//     'NB01-Hardware Shop',
//     'NB02-Tailor Shop',
//     'NB03-Laundry / Dry Cleaning',
//     'NB04-Malay Restaurant',
//     'NB05-Chinese Restaurant',
//     'NB06-Indian Restaurant',
//     'NB07-Western Restaurant',
//     'NB08-Middle East Restaurant',
//     'NB09-Japanese Restaurant',
//     'NB10-Korean Restaurant',
//     'NB11-Thai Restaurant',
//     'NB12-Fast Food Restaurant',
//     'NB13-Food Court',
//     'NB14-Canteen',
//     'NB15-Surau',
//     'NB16-Temple',
//     'NB17-Masjid',
//     'NB18-Church',
//     'NB19-Workshop',
//     'NB20-Car Service Centre',
//     'NB21-Car Accessories Shop',
//     'NB22-Car Wash',
//     'NB23-Car Park',
//     'NB24-Bicycle Shop / Repair',
//     'NB25-Motorbike Shop / Repair',
//     'NB26-Office',
//     'NB27-Bank',
//     'NB28-Accessories Shop',
//     'NB29-Lighting Shop',
//     'NB30-Electrical Shop',
//     'NB31-Liquors Shop',
//     'NB32-Sundry Shop',
//     'NB33-Poultry Shop',
//     'NB34-Prayer Shop',
//     'NB35-Provision Shop',
//     'NB36-Bridal Shop',
//     'NB37-Printing Shop',
//     'NB38-Watch / Clock Shop',
//     'NB39-Carpet Shop',
//     'NB40-Candy Shop',
//     'NB41-Pawn Shop',
//     'NB42-Handicraft Shop',
//     'NB43-Textile / Garment Shop',
//     'NB44-Book Store / Stationery Shop',
//     'NB45-Handphone / Telecommunication Shop',
//     'NB46-Barber Shop',
//     'NB47-Frame Shop',
//     'NB48-Pet Shop',
//     'NB49-Shoes Shop',
//     'NB50-It Related Shop',
//     'NB51-Photo Shop',
//     'NB52-Music Cd Shop',
//     'NB53-Scrap Shop',
//     'NB54-Video Shop',
//     'NB55-Frozen Food Shop',
//     'NB56-Toys Shop',
//     'NB57-Souvenir Shop',
//     'NB58-Travel Agency',
//     'NB59-Maid Agency',
//     'NB60-Job Placement Agency',
//     'NB61-Library',
//     'NB62-Public Hall',
//     'NB63-Plant Nursery',
//     'NB64-Public Toilet',
//     'NB65-Market',
//     'NB66-Pharmacy',
//     'NB67-Optician',
//     'NB68-Driving School',
//     'NB69-Used Car Dealer',
//     'NB70-Post Office',
//     'NB71-Gallery',
//     'NB72-Florist',
//     'NB73-Private Club',
//     'NB74-Goldsmith',
//     'NB75-Store',
//     'NB76-Boutique',
//     'NB77-Locksmith',
//     'NB78-Cinema',
//     'NB79-Customer Service Centre',
//     'NB80-Chinese Medical Hall',
//     'NB81-Fishing Equipment',
//     'NB82-Fruit Shop',
//     'NB83-Dancing School',
//     'NB84-Music School',
//     'NB85-Bus Station',
//     'NB86-Wholesale Outlet',
//     'NB87-Commercial Complex',
//     'NB88-Showroom',
//     'NB89-Bakery',
//     'NB90-Insurance Company',
//     'NB91-National Security',
//     'NB92-Healthcare Centre',
//     'NB93-Rehabilitation Centre',
//     'NB94-Day Care Centre',
//     'NB95-Sports Centre',
//     'NB96-Beauty Centre',
//     'NB97-Tuition Centre',
//     'NB98-Furniture Shop / Home Furnishing',
//     'NB99-Golf Club',
//     'NB100-Casket &amp Funeral Services',
//     'NB101-Charity Home',
//     'NB102-Old Folk Home',
//     'NB103-Petrol Station',
//     'NB104-Transportation Services',
//     'NB105-Hotel',
//     'NB106-Hostel',
//     'NB107-Chalet',
//     'NB108-Resort',
//     'NB109-Private School',
//     'NB110-Govt School',
//     'NB111-Religious School',
//     'NB112-Kindergarten',
//     'NB113-University',
//     'NB114-Private Clinic',
//     'NB115-Govt Clinic',
//     'NB116-Private Hospital',
//     'NB117-Govt Hospital',
//     'NB118-Internet Café',
//     'NB119-Pubs / Disco',
//     'NB120-Fitness Centre / Gymnasium',
//     'NB121-Recording Studio',
//     'NB122-Private College',
//     'NB123-Factory',
//     'NB124-Engineering Factory',
//     'NB125-Home Décor',
//     'NB126-Entertainment Outlet (I.E.Karoake)',
//     'NB127-Supermarket / Minimarket',
//     'NB128-Hypermarket',
//     'NB129-Departmental Store (Jaya Jusco,Sogo,Etc)',
//     'NB130-Gaming Outlet (Sports Toto,Magnum,Etc)',
//     'NB131-24 Hrs Sundry Shop (7 Eleven)',
//     'NB132-Courier Service Shop',
//     'NB133-New Car Dealer',
//     'NB134-Warehouse',
//     'NB135-Museum',
//     'NB136-Govt Bodies',
//     'NB137-Logistics (Shipping/Flight)',
//     'NB138-Saloon / Spa Centre',
//     'NB139-Cafe',
//     'NB140-Gas Shop',
//     'NB141-Spice Shop',
//     'NB142-Snack Shop',
//     'NB143-Ice Supplier',
//     'NB144-Todler Items Shop',
//     'NB145-Cleaning Services',
//     'NB146-Theme Park',
//   ];

//   String updatetypeinitvalue = 'Select';
//   final updatetypevalue = [
//     'Select',
//     'C1-Single Storey Shop house',
//     'C2-Double Storey Shop house',
//     'C3-3 Storey Shop house',
//     'C4-4 Storey Shop house',
//     'C5-5 Storey Shop house',
//     'C6-6 Storey Shop house',
//     'C7-Multi Storey Shop House',
//     'C8-Commercial Building',
//     'C9-Shopping Complex',
//     'C10-Commercial Podium',
//     'C11-Highrise Building',
//     'C12-TNB Substation',
//     'C13-Hospital',
//     'C14-Bank',
//     'C15-Embassy',
//     'C16-Showroom',
//     'C17-Hall',
//     'C18-Stadium',
//     'C19-Store',
//     'C20-Petrol Station',
//     'C21-Workshop / Service station',
//     'C22-Food Court',
//     'C23-Fast Food Outlet',
//     'C24-Bazaar',
//     'C25-Market',
//     'C26-Supermarket',
//     'C27-Hypermarket',
//     'C28-Private School',
//     'C29-Private University',
//     'C30-College',
//     'C31-Airport',
//     'C32-Sea Port',
//     'C32-Sea Port',
//     'C34-Railway Station',
//     'C35-Bus Station / Terminal',
//     'C36-Lorry Station / Terminal',
//     'C37-LRT Station',
//     'C38-Toll Booth',
//     'C39-Driving School Center',
//     'C40-Car Wash',
//     'C41-Parking Lot',
//     'C42-Public Swimming Pool',
//     'C43-Public Library',
//     'C44-Public Toilet',
//     'C45-Hotel',
//     'C46-Chalet',
//     'C47-Resort',
//     'C48-Cinema',
//     'C49-Zoo',
//     'C50-Museum',
//     'C51-Equestrian',
//     'C52-Sports Complex',
//     'C53-Theme Park',
//     'C54-Rest House',
//     'C55-Club House',
//     'C56-Golf Driving Range',
//     'C57-Golf Course',
//     'C58-Shooting Range',
//     'C59-Nature Park',
//     'C60-Light Industrial',
//     'C61-Treatment Plant - IWK',
//     'C62-Cemetery/Crematoriums',
//     'C63-Nursery (Plant)',
//     'C64-Abattoir',
//     'C65-Water Pump House',
//     'C66-Domestic Used as Commercial',
//     'C67-IWKs office',
//     'D1-LC Single Storey Terrace House',
//     'D2-LC Double Storey Terrace House',
//     'D3-Low Cost Flat',
//     'D4-LMC Single Storey Terrace Hse',
//     'D5-LMC Double Storey Terrace Hse',
//     'D6-Low Medium Cost  Flat',
//     'D7-Low Medium Cost Apartment',
//     'D8-Single Storey Terrace House',
//     'D9-Double Storey Terrace House',
//     'D10-Triple Storey Terrace House',
//     'D11-1 1/2 Storey Terrace House',
//     'D12-2 1/2 Storey Terrace House',
//     'D13-3 1/2 Storey Terrace House',
//     'D14-Single Storey Bungalow',
//     'D15-Double Storey Bungalow',
//     'D16-Triple Storey Bungalow',
//     'D17-Single Storey Semi-D House',
//     'D18-Double Storey Semi-D House',
//     'D19-Triple Storey Semi-D House',
//     'D20-Town House',
//     'D21-Flat',
//     'D22-Apartment',
//     'D23-Service Apartment',
//     'D24-Condominium',
//     'D25-Villa',
//     'D26-Water house ("Rumah Air")',
//     'D27-Warden House',
//     'D28-Shop Lot Used as Domestic',
//     'D29-Kampung House',
//     'D30-Temporary Settlement',
//     'D31-Cluster House',
//     'D32-Dormitory/Hostel',
//     'D33-Squatters',
//     'G1-Government building',
//     'G2-Govt.Bldg used for Comme',
//     'G3-Commercial Bldg used for',
//     'G4-Government domestic class',
//     'G5-Government domestic class',
//     'G6-Government domestic class',
//     'G7-Government domestic class',
//     'G8-Government domestic class',
//     'G9-Government domestic class',
//     'G10-Government domestic class',
//     'G11-Government domestic class H',
//     'G12-Government domestic class I',
//     'I1-Industry With Effluent',
//     'I2-Industry Without Effluent',
//     'F1-Factory With Affluent',
//     'F2-Factory Without Affluent',
//     'E1-Mosque',
//     'E2-Surau',
//     'E3-Hindu Temple',
//     'E4-Chinese Temple',
//     'E5-Sikh Temple',
//     'E6-Siamise Temple',
//     'E7-Church',
//     'E8-Cemetery / Crematorium',
//     'E9-Orphanage',
//     'E10-Old Folks Home',
//     'E11-Charitable/Non-Profit Org',
//     'V1-Future Development(New Area)',
//     'V2-Duplicate address',
//     'V3-Unsold Property',
//     'V4-Property does not exist',
//     'V5-Vacant Land',
//     'V6-Demolished',
//     'C68-Management Office',
//     'E12-Main Meter',
//     'E13-Hydrant Meter',
//     'E14-Rubbish Chute',
//     'E15-Workshed-Construction Meter',
//     'E16-Standpipe',
//     'E17-Garden tap',
//     'E18-Swimming pool',
//     'V7-Property Burnt',
//     'V8-Property Under Construction',
//     'V9-Property Under Renovation',
//     'D34-FELDA/FELCRA HOUSING',
//     'V10-QTRS/GOVT.P(1 BULK MTR-BILL GOVTP)',
//     'D35-STUDIO HOUSE',
//     'I3-Warehouse-Industry',
//     'D37-LC Single Storey Semi-D House',
//     'D38-2 1/2 Storey Detached House',
//     'C69-Team Building Kem (Commercial)',
//     'C70-Water Treatment Plant',
//     'C71-Parcel Account',
//     'D39-2 1/2 Storey Bungalow',
//     'C72-Farm',
//     'C73-Carpark-Multi Storey',
//     'C74-Driving School',
//     'C75-Stall',
//     'D40-Low Cost Townhouse',
//     'C76-SOHO (Small Office Home Office)',
//     'C77-Quarry',
//     'C78-Mining area',
//     'D41-Low Medium Cost Townhouse',
//     'C79-Petrol Station with food outlet',
//     'C80-Restaurant',
//     'C81-Telecommunication Substation',
//     'C82-Ferry Station / Terminal',
//     'D42-Low Cost Cluster House',
//     'C83-SOFO (Small Office Flexible Office)',
//     'C84-SOVO (Small Office Versatile Off)',
//     'C85-Taxi Station / Terminal',
//     'D43-4 Storey Bungalow',
//     'D44-One and Half Storey Bungalow'
//   ];

//   String statusinitvalue = 'Select';
//   final statusvalue = [
//     'Select',
//     'Complete',
//     'Uncomplete',
//   ];

//   String propertyusageinitvalue = 'Select';
//   final propertyusagepevalue = ['Select', 'C', 'D'];

//   TextEditingController visitdatecontroller = TextEditingController();
//   TextEditingController updatecontroller = TextEditingController();
//   TextEditingController remarkcontroller = TextEditingController();
//   TextEditingController fromcontroller = TextEditingController();
//   TextEditingController tocontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.deepPurple),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: const Text(
//               'Scan',
//               style: TextStyle(color: Colors.deepPurple),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(right: 10),
//             child: Icon(
//               Icons.qr_code_scanner,
//               color: Colors.deepPurple,
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.white,
//       body: NotificationListener<OverscrollIndicatorNotification>(
//         onNotification: (OverscrollIndicatorNotification overscroll) {
//           // ignore: deprecated_member_use
//           overscroll.disallowGlow();
//           return false;
//         },
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Task Management",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Text(
//                   "Batch Process Management",
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Text(
//                   "* Please Enter all required information to process task by batch ",
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//                 // const SizedBox(
//                 //   height: 20,
//                 // ),
//                 // Drop Down Assignment
//                 // const Text(
//                 //   "Assignment",
//                 //   style: TextStyle(color: Colors.grey, fontSize: 12),
//                 // ),
//                 // const SizedBox(
//                 //   height: 10,
//                 // ),
//                 // Container(
//                 //   padding: const EdgeInsets.only(left: 20, right: 20),
//                 //   decoration: BoxDecoration(
//                 //     border: Border.all(color: Colors.deepPurple),
//                 //     borderRadius: BorderRadius.circular(20),
//                 //   ),
//                 //   height: 45,
//                 //   width: MediaQuery.of(context).size.width,
//                 //   child: DropdownButton<String>(
//                 //     underline: Container(),
//                 //     icon: const Icon(
//                 //       Icons.keyboard_arrow_down,
//                 //       color: Colors.deepPurple,
//                 //     ),
//                 //     value: assigninitvalue,
//                 //     isExpanded: true,
//                 //     items: assignments.map((String value) {
//                 //       return DropdownMenuItem<String>(
//                 //         value: value,
//                 //         child: Text(value),
//                 //       );
//                 //     }).toList(),
//                 //     onChanged: (String? value) {
//                 //       setState(() {
//                 //         assigninitvalue = value!;
//                 //       });
//                 //     },
//                 //   ),
//                 // ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 // Dropdown Type of Manage

//                 const Text(
//                   "Type Of Manage",
//                   style: TextStyle(color: Colors.grey, fontSize: 12),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.deepPurple),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   height: 45,
//                   width: MediaQuery.of(context).size.width,
//                   child: DropdownButton<String>(
//                     underline: Container(),
//                     icon: const Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Colors.deepPurple,
//                     ),
//                     value: manageinitvalue,
//                     isExpanded: true,
//                     items: manage.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (String? value) {
//                       setState(() {
//                         manageinitvalue = value!;
//                       });
//                     },
//                   ),
//                 ),

//                 // Drop Down DR code
//                 manageinitvalue == "DR Code"
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             "DR Code",
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 20, right: 20),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.deepPurple),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             height: 45,
//                             width: MediaQuery.of(context).size.width,
//                             child: DropdownButton<String>(
//                               underline: Container(),
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Colors.deepPurple,
//                               ),
//                               value: DRcodeinitvalue,
//                               isExpanded: true,
//                               items: DRcode.map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String? value) {
//                                 setState(() {
//                                   DRcodeinitvalue = value!;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       )
//                     : SizedBox(),
//                 // Drop Down
//                 manageinitvalue == "Nature of Business"
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             "NOB Code",
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 20, right: 20),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.deepPurple),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             height: 45,
//                             width: MediaQuery.of(context).size.width,
//                             child: DropdownButton<String>(
//                               underline: Container(),
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Colors.deepPurple,
//                               ),
//                               value: NOBinitvalue,
//                               isExpanded: true,
//                               items: NOBvalue.map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String? value) {
//                                 setState(() {
//                                   NOBinitvalue = value!;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       )
//                     : SizedBox(),
//                 // Drop Down
//                 manageinitvalue == "Update Type of Property"
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             "Type Of Property",
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 20, right: 20),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.deepPurple),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             height: 45,
//                             width: MediaQuery.of(context).size.width,
//                             child: DropdownButton<String>(
//                               underline: Container(),
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Colors.deepPurple,
//                               ),
//                               value: updatetypeinitvalue,
//                               isExpanded: true,
//                               items: updatetypevalue.map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String? value) {
//                                 setState(() {
//                                   updatetypeinitvalue = value!;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       )
//                     : SizedBox(),
//                 // DropDown
//                 manageinitvalue == "Property Usage"
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             "Property Usage",
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 20, right: 20),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.deepPurple),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             height: 45,
//                             width: MediaQuery.of(context).size.width,
//                             child: DropdownButton<String>(
//                               underline: Container(),
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Colors.deepPurple,
//                               ),
//                               value: propertyusageinitvalue,
//                               isExpanded: true,
//                               items: propertyusagepevalue.map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String? value) {
//                                 setState(() {
//                                   propertyusageinitvalue = value!;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       )
//                     : SizedBox(),
//                 // Date
//                 manageinitvalue == "Visit Date"
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             "Visit Date",
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             readOnly: true,
//                             style: const TextStyle(
//                                 fontSize: 16, color: Colors.black),
//                             cursorColor: kPrimaryPurpleColor,
//                             keyboardType: TextInputType.none,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Field Required';
//                               }
//                             },
//                             controller: visitdatecontroller,
//                             textInputAction: TextInputAction.none,
//                             decoration: InputDecoration(
//                               suffixIcon: IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(
//                                     Icons.calendar_today_rounded,
//                                     color: kPrimaryPurpleColor,
//                                   )),
//                               focusedBorder: const OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(25.0)),
//                                   borderSide:
//                                       BorderSide(color: kPrimaryPurpleColor)),
//                               contentPadding:
//                                   EdgeInsets.fromLTRB(25, 10, 10, 0),
//                               fillColor: kPrimaryWhiteColor,
//                               filled: true,
//                               enabledBorder: const OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(25.0)),
//                                   borderSide:
//                                       BorderSide(color: kPrimaryPurpleColor)),
//                               border: const OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(25.0)),
//                                 borderSide:
//                                     BorderSide(color: kPrimaryPurpleColor),
//                                 gapPadding: 0,
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     : SizedBox(),
// // date 2
//                 manageinitvalue == "Update Reminder"
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             "Update Reminder",
//                             style: TextStyle(fontSize: 12, color: Colors.grey),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             readOnly: true,
//                             style: const TextStyle(
//                                 fontSize: 16, color: Colors.black),
//                             cursorColor: kPrimaryPurpleColor,
//                             keyboardType: TextInputType.none,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Field Required';
//                               }
//                             },
//                             controller: updatecontroller,
//                             textInputAction: TextInputAction.none,
//                             decoration: InputDecoration(
//                               suffixIcon: IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(
//                                     Icons.calendar_today_rounded,
//                                     color: kPrimaryPurpleColor,
//                                   )),
//                               focusedBorder: const OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(25.0)),
//                                   borderSide:
//                                       BorderSide(color: kPrimaryPurpleColor)),
//                               contentPadding:
//                                   EdgeInsets.fromLTRB(25, 10, 10, 0),
//                               fillColor: kPrimaryWhiteColor,
//                               filled: true,
//                               enabledBorder: const OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(25.0)),
//                                   borderSide:
//                                       BorderSide(color: kPrimaryPurpleColor)),
//                               border: const OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(25.0)),
//                                 borderSide:
//                                     BorderSide(color: kPrimaryPurpleColor),
//                                 gapPadding: 0,
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     : SizedBox(),
//                 // DropDown
//                 manageinitvalue == "Complete Status"
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Text(
//                             "Complete Status",
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 20, right: 20),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.deepPurple),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             height: 45,
//                             width: MediaQuery.of(context).size.width,
//                             child: DropdownButton<String>(
//                               underline: Container(),
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Colors.deepPurple,
//                               ),
//                               value: statusinitvalue,
//                               isExpanded: true,
//                               items: statusvalue.map((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (String? value) {
//                                 setState(() {
//                                   statusinitvalue = value!;
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       )
//                     : SizedBox(),
//                 SizedBox(
//                   height: 20,
//                 ),

//                 ///Remark
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Remark",
//                       style: const TextStyle(fontSize: 12, color: Colors.grey),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       style: const TextStyle(fontSize: 16, color: Colors.black),
//                       cursorColor: kPrimaryPurpleColor,
//                       keyboardType: TextInputType.text,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Remark Required';
//                         }
//                       },
//                       controller: remarkcontroller,
//                       maxLines: 5,
//                       textInputAction: TextInputAction.done,
//                       decoration: InputDecoration(
//                         hintText: "Remark",
//                         hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(25.0)),
//                             borderSide: BorderSide(color: kPrimaryPurpleColor)),
//                         contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 10),
//                         fillColor: kPrimaryWhiteColor,
//                         filled: true,
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(25.0)),
//                             borderSide: BorderSide(color: kPrimaryPurpleColor)),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                           borderSide: BorderSide(color: kPrimaryPurpleColor),
//                           gapPadding: 0,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),

//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   "Project Description",
//                   style: TextStyle(
//                       color: Colors.deepPurple, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Type",
//                       style: TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                     Text(
//                       "Vacant",
//                       style: TextStyle(
//                         color: kPrimaryGreyColor,
//                         fontSize: 14.0,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Date",
//                       style: TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                     Text(
//                       "21-12-2021 - 16-02-2022",
//                       style: TextStyle(
//                         color: kPrimaryGreyColor,
//                         fontSize: 14.0,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   "IWK ID",
//                   style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.deepPurple),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),

//                 textField("From", fromcontroller,"Your Answer"),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 textField("To", tocontroller,"Your Answer"),

//                 const SizedBox(
//                   height: 30,
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: 50,
//                   child: RaisedButton(
//                     color: kPrimaryPurpleColor,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30)),
//                     onPressed: () {},
//                     child: const Text(
//                       "Processing",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
