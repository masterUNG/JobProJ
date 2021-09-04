import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';
import 'login_page.dart';

class DeleteAccountPageWidget extends StatefulWidget {
  DeleteAccountPageWidget({Key key}) : super(key: key);

  @override
  _DeleteAccountPageWidgetState createState() =>
      _DeleteAccountPageWidgetState();
}

class _DeleteAccountPageWidgetState extends State<DeleteAccountPageWidget> {
  TextEditingController passwordTextfieldController;
  bool passwordTextfieldVisibility;
  TextEditingController phoneNumberTextfieldController;

  @override
  void initState() {
    super.initState();
    passwordTextfieldController = TextEditingController();
    passwordTextfieldVisibility = false;
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
            'ลบบัญชี',
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
            Align(
              alignment: Alignment(-1, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                child: Text(
                  'หมายเลขโทรศัพท์',
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
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: TextFormField(
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
                  'รหัสผ่าน',
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
                  contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => passwordTextfieldVisibility =
                          !passwordTextfieldVisibility,
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text(
                          'ยืนยันการลบบัญชี',
                          style: GoogleFonts.getFont(
                            'Kanit',
                          ),
                        ),
                        content: Text(
                          'คุณแน่ใจหรือไม่ว่าต้องการลบบัญชีนี้',
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
                                  builder: (context) => LoginPageWidget(),
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
                text: 'ยืนยัน',
                options: FFButtonOptions(
                  width: 190,
                  height: 49,
                  color: Color(0xFFFA3E3E),
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
