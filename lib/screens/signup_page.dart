import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:therapist_buddy/models/pt_model.dart';
import 'package:therapist_buddy/screens/login_page.dart';
import 'package:therapist_buddy/utility/my_dialog.dart';
import 'package:therapist_buddy/widgets/show_logo.dart';
import 'package:therapist_buddy/widgets/show_title.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';
import 'otp_verification_in_signup_page.dart';

class SignupPageWidget extends StatefulWidget {
  SignupPageWidget({Key key}) : super(key: key);

  @override
  _SignupPageWidgetState createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> {
  TextEditingController firstNameTextfieldController;
  TextEditingController lastNameTextfieldController;
  TextEditingController phoneNumberTextfieldController;
  TextEditingController passwordTextfieldController;
  TextEditingController repeatPasswordTextfieldController;
  TextEditingController licenseNumberTextfieldController;
  bool passwordTextfieldVisibility;
  bool repeatPasswordTextfieldVisibility;
  String nameTitleValue = "กภ.";
  String licenseTitleValue = "กภ.";
  String workplaceValue = "โรงพยาบาลสงขลานครินทร์";
  String birthDayValue = "1";
  String birthMonthValue = "ม.ค.";
  String birthYearValue = "2564";
  int genderValue = 1;

  File file;
  final formKey = GlobalKey<FormState>();
  bool statusPassword8 = true;

  @override
  void initState() {
    super.initState();
    firstNameTextfieldController = TextEditingController();
    lastNameTextfieldController = TextEditingController();
    phoneNumberTextfieldController = TextEditingController();
    passwordTextfieldController = TextEditingController();
    repeatPasswordTextfieldController = TextEditingController();
    licenseNumberTextfieldController = TextEditingController();
    passwordTextfieldVisibility = false;
    repeatPasswordTextfieldVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
            behavior: HitTestBehavior.opaque,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildAvatar(),
                  ShowTitle(title: 'ชื่อ'),
                  fildName(),
                  ShowTitle(title: 'นามสกุล'),
                  fieldSurname(),
                  buildPhoneTitle(),
                  fieldPhone(),
                  buildPassTitle(),
                  fieldPassword(),
                  buildRePassTitle(),
                  fieldRePass(),
                  ShowTitle(title: 'เลขที่ใบประกอบ'),
                  fieldIdWork(),
                  ShowTitle(title: 'สถานพยาบาลที่ปฏิบัติงานอยู่'),
                  dropDownHopital(),
                  ShowTitle(title: 'วันเกิด'),
                  dropDownBirthDay(context),
                  ShowTitle(title: 'เพศ'),
                  radioGendle(),
                  buttonNext()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buttonNext() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
      child: FFButtonWidget(
        onPressed: () async {
          refeshStatusPassword8();
          if (formKey.currentState.validate()) {
            if (file != null) {
              String firstName = firstNameTextfieldController.text;
              String lastName = lastNameTextfieldController.text;
              String phoneNumber = phoneNumberTextfieldController.text;
              String password = passwordTextfieldController.text;
              String licenseNumber = licenseNumberTextfieldController.text;

              List<String> gendles = [
                '',
                'ชาย',
                'หญิง',
                'อื่นๆ',
                'ไม่ระบุ',
              ];

              String genderStr = gendles[genderValue];

              print(
                  'initialName = $nameTitleValue, firstName = $firstName, lastName = $lastName, phonrNumber = $phoneNumber');
              print(
                  'password = $password, license = $licenseNumber, workplackValue = $workplaceValue');
              print(
                  'dd = $birthDayValue, mm = $birthMonthValue , yy = $birthYearValue, gendle = $genderStr');

              await Firebase.initializeApp().then((value) async {
                await FirebaseFirestore.instance
                    .collection('ptung')
                    .doc(phoneNumber)
                    .snapshots()
                    .listen((event) async {
                  print('event.data ==>  ${event.data()}');
                  if (event.data() == null) {
                    MyDialog().progressDialog(context);

                    String nameFile = 'tp$phoneNumber.jpg';

                    Reference reference =
                        FirebaseStorage.instance.ref().child('pt/$nameFile');
                    UploadTask task = reference.putFile(file);
                    await task.whenComplete(() async {
                      Navigator.pop(context);
                      String pathAvatar = await reference.getDownloadURL();

                      PtModel model = PtModel(
                          nameTitleValue: nameTitleValue,
                          firstName: firstName,
                          lastName: lastName,
                          phoneNumber: phoneNumber,
                          password: password,
                          licenseNumber: licenseNumber,
                          workplaceValue: workplaceValue,
                          birthDayValue: birthDayValue,
                          birthMonthValue: birthMonthValue,
                          birthYearValue: birthYearValue,
                          genderStr: genderStr,
                          pathAvatar: pathAvatar, tokens: []);
                      Map<String, dynamic> data = model.toMap();

                      await FirebaseFirestore.instance
                          .collection('ptung')
                          .doc(phoneNumber)
                          .set(data)
                          .then((value) {
                        print('Success Insert Data');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPageWidget(),
                            ),
                            (route) => false);
                      });
                    });
                  } else {
                    MyDialog().normalDialog(
                        context, 'เบอร์ซ้ำ ?', 'เบอร์โทรนี่ มีคนอื่นใช้ไปแล้ว');
                  }
                });
              });
            } else {
              MyDialog()
                  .normalDialog(context, 'No Avatar ?', 'Please Take Photo');
            }
          } // endif

          // await Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>
          //         OTPVerificationInSignupPageWidget(),
          //   ),
          // );
        },
        text: 'ถัดไป',
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
    );
  }

  Align radioGendle() {
    return Align(
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
                      print("genderValue = $genderValue");
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
    );
  }

  Padding dropDownBirthDay(BuildContext context) {
    return Padding(
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
    );
  }

  Padding dropDownHopital() {
    return Padding(
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
              'Hopital2',
              'Hopital3',
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
    );
  }

  Padding fieldIdWork() {
    return Padding(
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'กรุณากรอก ด้วยคะ';
                  } else {
                    return null;
                  }
                },
                controller: licenseNumberTextfieldController,
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
                keyboardType: TextInputType.number,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding fieldRePass() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณากรอก ด้วยคะ';
          } else {
            if (value.toString() != passwordTextfieldController.text) {
              return 'Repassword ไม่เหมือน Password';
            } else {
              return null;
            }
          }
        },
        controller: repeatPasswordTextfieldController,
        obscureText: !repeatPasswordTextfieldVisibility,
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
          suffixIcon: InkWell(
            onTap: () => setState(
              () => repeatPasswordTextfieldVisibility =
                  !repeatPasswordTextfieldVisibility,
            ),
            child: Icon(
              repeatPasswordTextfieldVisibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Color(0xFFA7A8AF),
              size: 20,
            ),
          ),
        ),
        style: GoogleFonts.getFont(
          'Kanit',
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        maxLines: 1,
      ),
    );
  }

  Padding buildRePassTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment(-1, 0),
            child: Text(
              'ใส่รหัสผ่านอีกครั้ง',
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
              child: Text(
                '(รหัสผ่านไม่ตรงกัน)',
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void refeshStatusPassword8() {
    setState(() {});
  }

  Padding fieldPassword() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณากรอก ด้วยคะ';
          } else {
            if (value.length < 8) {
              statusPassword8 = false;
              return 'Password ต้อง มากกว่า 8';
            } else {
              statusPassword8 = true;
              return null;
            }
          }
        },
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
              color: primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20, 18, 20, 18),
          suffixIcon: InkWell(
            onTap: () => setState(
              () => passwordTextfieldVisibility = !passwordTextfieldVisibility,
            ),
            child: Icon(
              passwordTextfieldVisibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Color(0xFFA7A8AF),
              size: 20,
            ),
          ),
        ),
        style: GoogleFonts.getFont(
          'Kanit',
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        maxLines: 1,
      ),
    );
  }

  Padding buildPassTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
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
                child: statusPassword8
                    ? Text(
                        '(ใส่รหัสผ่านอย่างน้อย 8 ตัว)',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Color(0xFFB1B2B8),
                          fontSize: 14,
                        ),
                      )
                    : Text(
                        '(ใส่รหัสผ่านอย่างน้อย 8 ตัว)',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      )),
          )
        ],
      ),
    );
  }

  Padding fieldPhone() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: Container(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'กรุณากรอก ด้วยคะ';
                    } else {
                      return null;
                    }
                  },
                  maxLength: 9,
                  controller: phoneNumberTextfieldController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "123456789",
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
                  keyboardType: TextInputType.number,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildPhoneTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
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
              child: Text(
                '(หมายเลขนี้ถูกใช้งานแล้ว)',
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding fieldSurname() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณากรอก ด้วยคะ';
          } else {
            return null;
          }
        },
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
    );
  }

  Padding fildName() {
    return Padding(
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'กรุณากรอก ด้วยคะ';
                  } else {
                    return null;
                  }
                },
                controller: firstNameTextfieldController,
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
          )
        ],
      ),
    );
  }

  Future<Null> processTakePhoto(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result.path);
      });
    } catch (e) {}
  }

  Future<Null> confirmSourceDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowLogo(),
          title: ShowTitle(title: 'กรุณา เลือกแหล่งกำหนิดภาพ'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              processTakePhoto(ImageSource.camera);
            },
            child: Text('Camera'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              processTakePhoto(ImageSource.gallery);
            },
            child: Text('Gallery'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Padding buildAvatar() {
    return Padding(
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
            child: file == null
                ? Image.asset(
                    'assets/images/profileDefault_pic.png',
                    fit: BoxFit.cover,
                  )
                : Image.file(file),
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
                onPressed: () => confirmSourceDialog(),
                icon: Icon(
                  Icons.edit_rounded,
                  color: Colors.black,
                  size: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appbarHeight),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: primaryColor,
            size: 24,
          ),
          iconSize: 24,
        ),
        title: Text(
          'ลงทะเบียน',
          style: GoogleFonts.getFont(
            'Kanit',
            color: primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 21,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
    );
  }
}
