import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';
import 'patient_page.dart';
import 'confirm_appointment_in_edit_appointment_page.dart';

class EditAppointmentPageWidget extends StatefulWidget {
  EditAppointmentPageWidget({Key key}) : super(key: key);

  @override
  _EditAppointmentPageWidgetState createState() =>
      _EditAppointmentPageWidgetState();
}

class _EditAppointmentPageWidgetState extends State<EditAppointmentPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text(
                  'ยืนยันการลบการนัดหมาย',
                  style: GoogleFonts.getFont(
                    'Kanit',
                  ),
                ),
                content: Text(
                  'คุณแน่ใจหรือไม่ว่าต้องการลบการนัดหมายนี้',
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
        backgroundColor: Colors.white,
        elevation: 0,
        label: Text(
          'ลบการนัดหมาย',
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            'Kanit',
            color: primaryColor,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                      'ละทิ้งการแก้ไขการนัดหมาย',
                      style: GoogleFonts.getFont(
                        'Kanit',
                      ),
                    ),
                    content: Text(
                      'คุณแน่ใจหรือไม่ว่าต้องการละทิ้งการแก้ไขการนัดหมายนี้',
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
            'แก้ไขการนัดหมายคนไข้',
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 25, 0, 8),
              child: Text(
                'วันที่',
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  border: Border.all(
                    color: secondaryColor,
                    width: 1,
                  ),
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
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.calendarAlt,
                        color: primaryColor,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 18, 0, 8),
              child: Text(
                'เวลา',
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        border: Border.all(
                          color: secondaryColor,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '10.00 น.',
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
                  Container(
                    width: 50,
                    height: 52,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ถึง',
                          textAlign: TextAlign.center,
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
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        border: Border.all(
                          color: secondaryColor,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '12.00 น.',
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
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ConfirmAppointmentInEditAppointmentPageWidget(),
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
            ),
          ],
        ),
      ),
    );
  }
}
