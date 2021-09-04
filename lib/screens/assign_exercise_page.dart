import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';
import 'confirm_exercise_page.dart';
import 'patient_page.dart';
import 'exercise_introduction_for_assigning_page.dart';

class AssignExercisePageWidget extends StatefulWidget {
  AssignExercisePageWidget({Key key}) : super(key: key);

  @override
  _AssignExercisePageWidgetState createState() =>
      _AssignExercisePageWidgetState();
}

class _AssignExercisePageWidgetState extends State<AssignExercisePageWidget> {
  String diseaseValue = "Office Syndrome";
  String exerciseFrequencyValue = "ทุกวัน";
  bool _exercisesFinishBeforeNextAppointment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
                      'ละทิ้งการมอบหมายรายการออกกำลังกาย',
                      style: GoogleFonts.getFont(
                        'Kanit',
                      ),
                    ),
                    content: Text(
                      'คุณแน่ใจหรือไม่ว่าต้องการละทิ้งการมอบหมายรายการออกกำลังกายนี้',
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
                              builder: (context) => PatientPageWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        child: Text(
                          'ยืนยัน',
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
            'มอบหมาย',
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
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 25, 0, 8),
                child: Text(
                  'โรคของคนไข้',
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                      value: diseaseValue,
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      items: <String>[
                        'Office Syndrome',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          diseaseValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 18, 0, 8),
                child: Text(
                  'ท่าออกกำลังกาย',
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    'https://picsum.photos/seed/331/600',
                                    width: 92,
                                    height: 61,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ยกแขนด้านข้าง',
                                    style: GoogleFonts.getFont(
                                      'Kanit',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '0  ครั้ง/เซ็ต',
                                    style: GoogleFonts.getFont(
                                      'Kanit',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '0  เซ็ต/วัน',
                                    style: GoogleFonts.getFont(
                                      'Kanit',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment(1, 0),
                                  child: IconButton(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ExerciseIntroductionForAssigningPageWidget(),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    iconSize: 24,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFE5E5E5),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 18, 0, 12),
                child: Text(
                  'ตารางการออกกำลังกายต่อสัปดาห์',
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                      value: exerciseFrequencyValue,
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      items: <String>[
                        '1 วัน',
                        '2 วัน',
                        '3 วัน',
                        '4 วัน',
                        '5 วัน',
                        '6 วัน',
                        'ทุกวัน',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          exerciseFrequencyValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 18, 0, 12),
                child: Text(
                  'วันสิ้นสุดการออกกำลังกาย',
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '25 มิถุนายน 2564',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.calendarAlt,
                          color: Colors.white,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 14, 0, 0),
                child: Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: _exercisesFinishBeforeNextAppointment,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      toggleable: true,
                      onChanged: (value) {
                        setState(() {
                          _exercisesFinishBeforeNextAppointment = value;
                          print(
                              "_exercisesFinishBeforeNextAppointment = $_exercisesFinishBeforeNextAppointment");
                        });
                      },
                    ),
                    Text(
                      'ก่อนวันนัดครั้งต่อไป 1 วัน',
                      style: GoogleFonts.getFont(
                        'Kanit',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 40),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmExercisePageWidget(),
                        ),
                      );
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
