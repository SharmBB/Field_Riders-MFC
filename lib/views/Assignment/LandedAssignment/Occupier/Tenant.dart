import 'package:flutter/material.dart';
import 'package:riders_app/_helpers/constants.dart';
import 'package:riders_app/views/ResuableTextFormFeild/reusabletextfield.dart';


final propertyusagetypeOwner = [
  'Choose',
  '(D)Domestic',
  '(C)Commercial',
  '(I)Industrial',
  '(GQ)Government Quaters',
  '(GP)Government Premise'
];

final propertyusagetype = [
  'Choose',
  '(D)Domestic',
  '(C)Commercial',
  '(I)Industrial',
  '(GQ)Government Quaters',
  '(GP)Government Premise'
];

final propertydomestictype = [
  'Choose',
  'D1 LC Single Storey Terrace House',
  'D2 LC Double Storey Terrace House',
  'D3 Low Cost Flat',
  'D4 LMC Single Storey Terrace Hse',
  'D5 LMC Double Storey Terrace Hse',
  'D6 Low Medium Cost  Flat',
  'D7 Low Medium Cost Apartment',
  'D8 Single Storey Terrace House',
  'D9 Double Storey Terrace House',
  'D10 Triple Storey Terrace House',
  'D11 1 1/2 Storey Terrace House',
  'D12 2 1/2 Storey Terrace House',
  'D13 3 1/2 Storey Terrace House',
  'D14 Single Storey Bungalow',
  'D15 Double Storey Bungalow',
  'D16 Triple Storey Bungalow',
  'D17 Single Storey Semi-D House',
  'D18 Double Storey Semi-D House',
  'D19 Triple Storey Semi-D House',
  'D20 Town House',
  'D21 Flat',
  'D22 Apartment',
  'D23 Service Apartment',
  'D24 Condominium',
  'D25 Villa',
  'D26 Water house ',
  'D27 Warden House',
  'D28 Shop Lot Used as Domestic',
  'D29 Kampung House',
  'D30 Temporary Settlement',
  'D31 Cluster House',
  'D32 Dormitory/Hostel',
  'D33 Squatters',
  'D36 GUARD HOUSE',
  'D37 LC Single Storey Semi-D House',
  'D38 2 1/2 Storey Detached House',
  'D39 2 1/2 Storey Bungalow',
  'D40 Low Cost Townhouse',
  'D41 Low Medium Cost Townhouse',
  'D42 Low Cost Cluster House',
  'D43 4 Storey Bungalow',
  'D44 One and Half Storey Bungalow'
];

final drcodetype = [
  'Choose',
  '1 DR01 PAYMENT MADE AFTER DCA VISIT',
  '2 DR02 PROMISED TO PAY',
  '3 DR03 REFUSE TO PAY',
  '4 DR04 UNABLE TO PAY',
  '5 DR05 VACANT PREMISE',
  '6 DR06 VACANT LAND',
  '7 DR07 ABANDON',
  '8 DR08 NO TOILET',
  '9 DR09 DEMOLISHED',
  '10 DR10 BUILDING BURNT',
  '11 DR11 UNDER RENOVATION',
  '12 DR12 PROP CANNOT BE LOCATED',
  '13 DR13 UNDER LIQUIDATION',
  '14 DR14 FURTHER EXPLANATION ',
  '15 DR15 BUSINESS ONLY OPERATED IN THE EVENING',
  '16 DR16 REQUESTED FOR INSTALLMENT PLAN',
  '17 DR17 REQUESTED FOR STATEMENT OF ACCOUNT (SOA)',
  '18 DR18 REQUESTED FOR COPY BILL',
  '19 DR19 COLLECTED POSTDATED CHEQUES',
  '20 DR20 OTHER REMARKS, PLEASE SPECIFY IN REMARK COLUMN',
  '21 DR21 DOMESTIC USAGE (FOR COMMERCIAL ASSIGNMENT ONLY)',
  '22 DR22 CLOSED (PLEASE INSERT TOTAL OF VISITATION INTO COLUMN "NUMBER OF VISITATION")',
  '23 DR23 LEAVE MESSAGE TO CALL',
  '24 DR25 TENANT CLAIM OWNER TO PAY',
  '25 DR26 TENANT PAID TO OWNER',
  '26 DR27 NEW TENANT/SAME OWNER',
  '27 DR28 PAYMENT IS OUSTANDING BUT CLAIM PAID',
  '28 DR29 STORE, WITHOUT SIGNBOARD',
  '29 DR32 NO WATER METER',
  '30 DR33 UNDER RECEIVERSHIP',
  '31 DR34 COOLING TOWER USAGE  (FOR COMMERCIAL ASSIGNMENT ONLY)',
  '32 DR35 OWNER CLAIM TENANT TO PAY',
  '33 DR36 COMMERCIAL USAGE (FOR DOMESTIC ASSIGNMENT ONLY)',
  '34 DR37 CUSTOMER DISPUTE ON CHARGES',
  '35 DR38 NOBODY IN THE AREA TO REFER',
  '36 DR39 CLAIM NO SERVICE PROVIDED',
  '37 DR40 MANAGEMENT REFUSE TO COOPERATE',
  '38 DR41 NEW OWNER REFUSE TO PAY PREVIOUS OWNER OUTSTANDING',
  '39 DR42 CUSTOMER REFUSE TO MEET DCA',
  '40 DR43 PROPERTY AGENT REFUSE TO COOPERATE',
  '41 DR45 POLITICAL PARTIES ADVISE CUSTOMER NOT TO PAY IWK CHARGE',
  '42 DR46 NOT RECEIVED BILL',
  '43 DR47 CLAIM PAYED TO IST TANKER',
  '44 DR48 PREMISE OCCUPY BY FOREIGNER-COMMUNICATION ISSUES',
  '45 DR49 OWNER IS IN OVERSEAS',
  '46 DR50 WELFARE SOCIETY-CANT AFFORD TO PAY',
];

Widget Tenant(
    context,
    tenantnamecontroller,
    tenanttelnocontroller,
    selectedNationality,
    propertyusageinitvalue,
    propertydomestictypeinitvalue,
    drcodeinitvalue,
    remarkcontroller) {
  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        textField("Tenant's name", tenantnamecontroller,"Your Answer",""),
        const SizedBox(
          height: 20,
        ),
        textField("Tenant's tel no", tenanttelnocontroller,"Your Answer","number"),
        const SizedBox(
          height: 20,
        ),
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
                    groupValue: selectedNationality,
                    onChanged: (value) {
                      setState(() {
                        selectedNationality = value!;
                      });
                    }),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Malaysian",
                  style: TextStyle(fontSize: 14, color: primaryColor),
                )
              ],
            ),
            Row(
              children: [
                Radio<String>(
                    value: "Foreigner",
                    groupValue: selectedNationality,
                    onChanged: (value) {
                      setState(() {
                        selectedNationality = value!;
                      });
                    }),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Foreigner",
                  style: TextStyle(fontSize: 14, color: primaryColor),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Property usage",
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
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                underline: Container(),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.deepPurple,
                ),
                value: propertyusageinitvalue,
                isExpanded: true,
                items: propertyusagetype.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: TextStyle(fontSize: 14, color: primaryColor)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    propertyusageinitvalue = value!;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
// Drop Down
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Property Type",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding:  EdgeInsets.only(left: 20, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(25),
              ),
              width: MediaQuery.of(context).size.width,
              child: DropdownButton<String>(
                underline: Container(),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.deepPurple,
                ),
                value: propertydomestictypeinitvalue,
                isExpanded: true,
                items: propertydomestictype.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: TextStyle(fontSize: 14, color: primaryColor)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    propertydomestictypeinitvalue = value!;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        // Drop Down

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        style: TextStyle(fontSize: 14, color: primaryColor)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    drcodeinitvalue = value!;
                  });
                },
              ),
            ),
          ],
        ),

        SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Remark",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              cursorColor: kPrimaryPurpleColor,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Remark Required';
                }
              },
              controller: remarkcontroller,
              maxLines: 5,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Remark",
                hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: kPrimaryPurpleColor)),
                contentPadding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                fillColor: kPrimaryWhiteColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: kPrimaryPurpleColor)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: kPrimaryPurpleColor),
                  gapPadding: 0,
                ),
              ),
            )
          ],
        ),
      ],
    );
  });
}
