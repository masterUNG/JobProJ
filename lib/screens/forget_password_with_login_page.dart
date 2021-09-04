import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';
import 'otp_verification_in_forget_password_with_login_page.dart';

class ForgetPasswordWithLoginPageWidget extends StatefulWidget {
  ForgetPasswordWithLoginPageWidget({Key key}) : super(key: key);

  @override
  _ForgetPasswordWithLoginPageWidgetState createState() =>
      _ForgetPasswordWithLoginPageWidgetState();
}

class _ForgetPasswordWithLoginPageWidgetState
    extends State<ForgetPasswordWithLoginPageWidget> {
  TextEditingController phoneNumberTextfieldController;

  @override
  void initState() {
    super.initState();
    phoneNumberTextfieldController = TextEditingController();
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
            'ลืมรหัสผ่าน',
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
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(33, 25, 33, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
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
                        width: 1.5,
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
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: TextFormField(
                        controller: phoneNumberTextfieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'หมายเลขโทรศัพท์',
                          hintStyle: GoogleFonts.getFont(
                            'Kanit',
                            color: Color(0xFFA7A8AF),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: secondaryColor,
                              width: 1.5,
                            ),
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 1.5,
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OTPVerificationInForgetPasswordWithLoginPageWidget(),
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
            )
          ],
        ),
      ),
    );
  }
}
