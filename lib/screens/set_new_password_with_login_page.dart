import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';
import 'edit_profile_page.dart';

class SetNewPasswordWithLoginPageWidget extends StatefulWidget {
  SetNewPasswordWithLoginPageWidget({Key key}) : super(key: key);

  @override
  _SetNewPasswordWithLoginPageWidgetState createState() =>
      _SetNewPasswordWithLoginPageWidgetState();
}

class _SetNewPasswordWithLoginPageWidgetState
    extends State<SetNewPasswordWithLoginPageWidget> {
  TextEditingController passwordTextfieldController;
  bool passwordTextfieldVisibility;
  TextEditingController repeatPasswordTextfieldController;
  bool repeatPasswordTextfieldVisibility;

  @override
  void initState() {
    super.initState();
    passwordTextfieldController = TextEditingController();
    passwordTextfieldVisibility = false;
    repeatPasswordTextfieldController = TextEditingController();
    repeatPasswordTextfieldVisibility = false;
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
            'เปลี่ยนรหัสผ่าน',
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
              padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
              child: Text(
                'ตั้งรหัสผ่านใหม่',
                style: GoogleFonts.getFont(
                  'Kanit',
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      'ใส่รหัสผ่าน',
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
                        '(ใส่รหัสผ่านอย่างน้อย 8 ตัว)',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Color(0xFFB1B2B8),
                          fontSize: 14,
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
              child: TextFormField(
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePageWidget(),
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
            )
          ],
        ),
      ),
    );
  }
}
