import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';
import 'patient_page.dart';

class ConfirmEditedExercisePageWidget extends StatefulWidget {
  ConfirmEditedExercisePageWidget({Key key}) : super(key: key);

  @override
  _ConfirmEditedExercisePageWidgetState createState() =>
      _ConfirmEditedExercisePageWidgetState();
}

class _ConfirmEditedExercisePageWidgetState
    extends State<ConfirmEditedExercisePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
            'ยืนยันการมอบหมาย',
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
                padding: EdgeInsets.fromLTRB(30, 20, 0, 8),
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
                  height: 52,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Office Syndrome',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        )
                      ],
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                                  '5  ครั้ง/เซ็ต',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '1  เซ็ต/วัน',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 3, 0, 8),
                child: Text(
                  'ตารางการออกกำลังกาย',
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
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ทุกวัน',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 18, 0, 8),
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
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ก่อนวันนัดครั้งต่อไป 1 วัน',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 40),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientPageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    text: 'ยืนยัน',
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
