import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapist_buddy/models/pt_model.dart';
import 'package:therapist_buddy/utility/my_dialog.dart';
import 'package:therapist_buddy/widgets/show_logo.dart';
import 'package:therapist_buddy/widgets/show_progress.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/main.dart';
import 'package:therapist_buddy/variables.dart';
import 'change_password_page.dart';
import 'change_phone_number_page.dart';

class EditProfilePageWidget extends StatefulWidget {
  EditProfilePageWidget({Key key}) : super(key: key);

  @override
  _EditProfilePageWidgetState createState() => _EditProfilePageWidgetState();
}

class _EditProfilePageWidgetState extends State<EditProfilePageWidget> {
  TextEditingController firstNameTextfieldController;
  TextEditingController lastNameTextfieldController;
  TextEditingController phoneNumberTextfieldController;
  TextEditingController passwordTextfieldController;
  TextEditingController licenseNumberTextfieldController;
  bool passwordTextfieldVisibility;
  String nameTitleValue = "กภ.";
  String licenseTitleValue = "กภ.";
  String workplaceValue = "โรงพยาบาลสงขลานครินทร์";
  String birthDayValue = "1";
  String birthMonthValue = "ม.ค.";
  String birthYearValue = "2564";
  int genderValue = 1;
  double saveAreaHeight = 125;

  PtModel ptModel;
  File file;
  String docId;
  String pathAvatar;
  bool nameBol = false, lastNameBol = false;

  @override
  void initState() {
    super.initState();

    passwordTextfieldVisibility = false;

    readCurrentProfile();
  }

  Future<Null> readCurrentProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    docId = preferences.getString('phone');
    print('### docId ที่ login อยู่ --> $docId');
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('ptung')
          .doc(docId)
          .snapshots()
          .listen((event) {
        setState(() {
          ptModel = PtModel.fromMap(event.data());

          firstNameTextfieldController =
              TextEditingController(text: ptModel.firstName);
          lastNameTextfieldController =
              TextEditingController(text: ptModel.lastName);
          phoneNumberTextfieldController =
              TextEditingController(text: ptModel.phoneNumber);
          passwordTextfieldController =
              TextEditingController(text: ptModel.password);
          licenseNumberTextfieldController =
              TextEditingController(text: ptModel.licenseNumber);

          pathAvatar = ptModel.pathAvatar;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ptModel == null ? ShowProgress() : buildContent(context),
      ),
    );
  }

  Future<Null> takePhoto() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowLogo(),
          title: Text('เปลี่ยนรูปโปรไฟล์'),
          subtitle: Text('คุณต้อง ถ่ายภาพ หรือ เลือกจาก คลังภาพ'),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  var result = await ImagePicker().getImage(
                      source: ImageSource.camera,
                      maxWidth: 800,
                      maxHeight: 800);
                  setState(() {
                    file = File(result.path);
                  });
                },
                child: Text('Camera'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  var result = await ImagePicker().getImage(
                      source: ImageSource.gallery,
                      maxWidth: 800,
                      maxHeight: 800);
                  setState(() {
                    file = File(result.path);
                  });
                },
                child: Text('Gallery'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Stack(
              alignment: Alignment(0, 0.9),
              children: [
                Container(
                  width: 125,
                  height: 125,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ptModel.pathAvatar == null
                      ? Image.asset(
                          'assets/images/profileDefault_pic.png',
                          fit: BoxFit.cover,
                        )
                      : file == null
                          ? CachedNetworkImage(
                              imageUrl: ptModel.pathAvatar,
                              placeholder: (context, url) => ShowProgress(),
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              file,
                              fit: BoxFit.cover,
                            ),
                ),
                Align(
                  alignment: Alignment(0.25, 0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F2F5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: () => takePhoto(),
                        icon: Icon(
                          Icons.edit_rounded,
                          color: Colors.black,
                          size: 16,
                        )),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                'ชื่อ',
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 95,
                  height: 49,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    border: Border.all(
                      color: secondaryColor,
                      width: 1,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: nameTitleValue,
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      items: <String>[
                        'กภ.',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          nameTitleValue = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextFormField(
                      onChanged: (value) => nameBol = true,
                      controller: firstNameTextfieldController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                      ),
                      style: GoogleFonts.getFont(
                        'Kanit',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 8, 0, 0),
              child: Text(
                'นามสกุล',
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: TextFormField(
              onChanged: (value) => lastNameBol = true,
              controller: lastNameTextfieldController,
              obscureText: false,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
              ),
              style: GoogleFonts.getFont(
                'Kanit',
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              maxLines: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    'หมายเลขโทรศัพท์',
                    style: GoogleFonts.getFont(
                      'Kanit',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-1, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePhoneNumberPageWidget(),
                          ),
                        );
                      },
                      child: Text(
                        'เปลี่ยน',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Color(0xFF7A7A7A),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 95,
                  height: 49,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: secondaryColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/thailandFlag_pic.jpg',
                        width: 28,
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        child: Text(
                          '+66',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: secondaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextFormField(
                      readOnly: true,
                      controller: phoneNumberTextfieldController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                      ),
                      style: GoogleFonts.getFont(
                        'Kanit',
                        color: secondaryColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    'รหัสผ่าน',
                    style: GoogleFonts.getFont(
                      'Kanit',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-1, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePasswordPageWidget(),
                          ),
                        );
                      },
                      child: Text(
                        'เปลี่ยนรหัสผ่าน',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Color(0xFF7A7A7A),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: TextFormField(
              readOnly: true,
              controller: passwordTextfieldController,
              obscureText: !passwordTextfieldVisibility,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
              ),
              style: GoogleFonts.getFont(
                'Kanit',
                color: secondaryColor,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              maxLines: 1,
            ),
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
              child: Text(
                'เลขที่ใบประกอบ',
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 95,
                  height: 49,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    border: Border.all(
                      color: secondaryColor,
                      width: 1,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: licenseTitleValue,
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      items: <String>[
                        'กภ.',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          licenseTitleValue = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextFormField(
                      controller: licenseNumberTextfieldController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 1,
                          ),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                      ),
                      style: GoogleFonts.getFont(
                        'Kanit',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 8, 0, 0),
              child: Text(
                'สถานพยาบาลที่ปฏิบัติงานอยู่',
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: Container(
              width: double.infinity,
              height: 49,
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(
                  color: secondaryColor,
                  width: 1,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: workplaceValue,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  items: <String>[
                    'โรงพยาบาลสงขลานครินทร์',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String value) {
                    setState(() {
                      workplaceValue = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 8, 0, 0),
              child: Text(
                'วันเกิด',
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width - 60 - 20) / 3,
                  height: 49,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    border: Border.all(
                      color: secondaryColor,
                      width: 1,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: birthDayValue,
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      items: <String>[
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9',
                        '10',
                        '11',
                        '12',
                        '13',
                        '14',
                        '15',
                        '16',
                        '17',
                        '18',
                        '19',
                        '20',
                        '21',
                        '22',
                        '23',
                        '24',
                        '25',
                        '26',
                        '27',
                        '28',
                        '29',
                        '30',
                        '31',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          birthDayValue = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 60 - 20) / 3,
                    height: 49,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                      border: Border.all(
                        color: secondaryColor,
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: birthMonthValue,
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        items: <String>[
                          'ม.ค.',
                          'ก.พ.',
                          'มี.ค.',
                          'เม.ย.',
                          'พ.ค.',
                          'มิ.ย.',
                          'ก.ค.',
                          'ส.ค.',
                          'ก.ย.',
                          'ต.ค.',
                          'พ.ย.',
                          'ธ.ค.',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            birthMonthValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 60 - 20) / 3,
                    height: 49,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                      border: Border.all(
                        color: secondaryColor,
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: birthYearValue,
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        items: <String>[
                          '2440',
                          '2441',
                          '2442',
                          '2443',
                          '2444',
                          '2445',
                          '2446',
                          '2447',
                          '2448',
                          '2449',
                          '2450',
                          '2451',
                          '2452',
                          '2453',
                          '2454',
                          '2455',
                          '2456',
                          '2457',
                          '2458',
                          '2459',
                          '2460',
                          '2461',
                          '2462',
                          '2463',
                          '2464',
                          '2465',
                          '2466',
                          '2467',
                          '2468',
                          '2469',
                          '2470',
                          '2471',
                          '2472',
                          '2473',
                          '2474',
                          '2475',
                          '2476',
                          '2477',
                          '2478',
                          '2479',
                          '2480',
                          '2481',
                          '2482',
                          '2483',
                          '2484',
                          '2485',
                          '2486',
                          '2487',
                          '2488',
                          '2489',
                          '2490',
                          '2491',
                          '2492',
                          '2493',
                          '2494',
                          '2495',
                          '2496',
                          '2497',
                          '2498',
                          '2499',
                          '2500',
                          '2501',
                          '2502',
                          '2503',
                          '2504',
                          '2505',
                          '2506',
                          '2507',
                          '2508',
                          '2509',
                          '2510',
                          '2511',
                          '2512',
                          '2513',
                          '2514',
                          '2515',
                          '2516',
                          '2517',
                          '2518',
                          '2519',
                          '2520',
                          '2521',
                          '2522',
                          '2523',
                          '2524',
                          '2525',
                          '2526',
                          '2527',
                          '2528',
                          '2529',
                          '2530',
                          '2531',
                          '2532',
                          '2533',
                          '2534',
                          '2535',
                          '2536',
                          '2537',
                          '2538',
                          '2539',
                          '2540',
                          '2541',
                          '2542',
                          '2543',
                          '2544',
                          '2545',
                          '2546',
                          '2547',
                          '2548',
                          '2549',
                          '2550',
                          '2551',
                          '2552',
                          '2553',
                          '2554',
                          '2555',
                          '2556',
                          '2557',
                          '2558',
                          '2559',
                          '2560',
                          '2561',
                          '2562',
                          '2563',
                          '2564',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            birthYearValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 8, 0, 0),
              child: Text(
                'เพศ',
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1, 0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(18, 8, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: genderValue,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          setState(() {
                            genderValue = value;
                            print("genderValue = $genderValue");
                          });
                        },
                      ),
                      Text(
                        'ชาย',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: genderValue,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          setState(() {
                            genderValue = value;
                            print("genderValue = $genderValue");
                          });
                        },
                      ),
                      Text(
                        'หญิง',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: genderValue,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          setState(() {
                            genderValue = value;
                            print("genderValue = $genderValue");
                          });
                        },
                      ),
                      Text(
                        'อื่นๆ',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: genderValue,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          setState(() {
                            genderValue = value;
                            print("radioButtonValue = $genderValue");
                          });
                        },
                      ),
                      Text(
                        'ไม่ระบุ',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
            child: FFButtonWidget(
              onPressed: () {
                MyDialog().progressDialog(context);

                if (file != null) {
                  processUploadImage();
                } else {
                  // go to process Update Data
                  processUpdateFirebase();
                }

                // print('### pathAvatat = $pathAvatar');
              },
              text: 'บันทึก',
              options: FFButtonOptions(
                width: 190,
                height: 49,
                color: primaryColor,
                textStyle: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: 32,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Null> processUploadImage() async {
    await Firebase.initializeApp().then((value) async {
      String nameImage = 'tp$docId.jpg';
      FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      var refer = firebaseStorage.ref().child('pt/$nameImage');
      UploadTask task = refer.putFile(file);
      await task.whenComplete(() async {
        await refer.getDownloadURL().then((value) {
          pathAvatar = value;
          processUpdateFirebase();
        });
      });
    });
  }

  Future<Null> processUpdateFirebase() async {
    print('### pathAvata ==>> $pathAvatar');

    Map<String, dynamic> data = {};

    if (nameBol) {
      data['firstName'] = firstNameTextfieldController.text;
    }

    if (lastNameBol) {
      data['lastName'] = lastNameTextfieldController.text;
    }

    data['pathAvatar'] = pathAvatar;

    print('### data ==>> $data');

    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('ptung')
          .doc(docId)
          .update(data)
          .then((value) {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    });
  }

  Future<Null> showAlertFinishSave(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Container(
              height: 245,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xff1AC05E),
                    size: 80,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                    child: AutoSizeText(
                      "แก้ไขโปรไฟล์\nเรียบร้อยแล้ว",
                      style: GoogleFonts.getFont(
                        'Kanit',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "ปิด",
                    options: FFButtonOptions(
                      width: 145,
                      height: 40,
                      color: Color(0xFF34ADFA),
                      textStyle: GoogleFonts.getFont(
                        'Kanit',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      borderSide: BorderSide.none,
                      borderRadius: 32,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appbarHeight),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text(
                    'บันทึกการเปลี่ยนแปลง',
                    style: GoogleFonts.getFont(
                      'Kanit',
                    ),
                  ),
                  content: Text(
                    'คุณต้องการบันทึกการเปลี่ยนแปลงโปรไฟล์ก่อนออกจากหน้านี้หรือไม่',
                    style: GoogleFonts.getFont(
                      'Kanit',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text(
                        'ยกเลิก',
                        style: GoogleFonts.getFont(
                          'Kanit',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(alertDialogContext);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'Others_page'),
                          ),
                          (r) => false,
                        );
                      },
                      child: Text(
                        'ไม่บันทึก',
                        style: GoogleFonts.getFont(
                          'Kanit',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(alertDialogContext);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'Others_page'),
                          ),
                          (r) => false,
                        );
                      },
                      child: Text(
                        'บันทึก',
                        style: GoogleFonts.getFont(
                          'Kanit',
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: primaryColor,
            size: 24,
          ),
          iconSize: 24,
        ),
        title: Text(
          'แก้ไขโปรไฟล์',
          style: GoogleFonts.getFont(
            'Kanit',
            color: primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 21,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
    );
  }
}
