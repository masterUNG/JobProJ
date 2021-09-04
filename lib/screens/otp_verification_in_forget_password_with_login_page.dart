import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';
import 'set_new_password_with_login_page.dart';

class OTPVerificationInForgetPasswordWithLoginPageWidget
    extends StatefulWidget {
  OTPVerificationInForgetPasswordWithLoginPageWidget({Key key})
      : super(key: key);

  @override
  _OTPVerificationInForgetPasswordWithLoginPageWidgetState createState() =>
      _OTPVerificationInForgetPasswordWithLoginPageWidgetState();
}

class _OTPVerificationInForgetPasswordWithLoginPageWidgetState
    extends State<OTPVerificationInForgetPasswordWithLoginPageWidget> {
  TextEditingController oTPCodeTextfieldController;

  @override
  void initState() {
    super.initState();
    oTPCodeTextfieldController = TextEditingController();
  }

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
            'ใส่รหัสยืนยันตัวตน',
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(50, 25, 50, 0),
              child: Text(
                'รหัสยืนยันตัวตนจะถูกส่งไปทาง sms ที่',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
            ),
            Text(
              '(+66) 812345678',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Kanit',
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 25, 30, 0),
              child: TextFormField(
                controller: oTPCodeTextfieldController,
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
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.black,
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetNewPasswordWithLoginPageWidget(),
                    ),
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'กรุณารอ',
                    style: GoogleFonts.getFont(
                      'Kanit',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      '60',
                      style: GoogleFonts.getFont(
                        'Kanit',
                        color: primaryColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Text(
                    'วินาทีก่อนกดส่งอีกครั้ง',
                    style: GoogleFonts.getFont(
                      'Kanit',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
