import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapist_buddy/models/pt_model.dart';
import 'package:therapist_buddy/utility/my_dialog.dart';
import 'package:therapist_buddy/widgets/show_progress.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import '../main.dart';
import 'package:therapist_buddy/variables.dart';
import 'forget_password_not_login_page.dart';
import 'signup_page.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController passwordTextfieldController;
  TextEditingController phoneNumberTextfieldController;
  TextEditingController verifyTextEditingController = TextEditingController();
  bool passwordTextfieldVisibility;

  final keyForm = GlobalKey<FormState>();
  bool load = true;

  @override
  void initState() {
    super.initState();
    passwordTextfieldController = TextEditingController();
    phoneNumberTextfieldController = TextEditingController();
    passwordTextfieldVisibility = false;
    findUserLogin();
  }

  Future<Null> findUserLogin() async {
    // print('### findUserLogin Work');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = preferences.getString('phone');
    print(' ####### data = $data');
    if (data == null) {
      setState(() {
        load = false;
      });
    } else {
      moveHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignupPageWidget(),
            ),
          );
        },
        backgroundColor: Colors.white,
        elevation: 0,
        label: Text(
          '???????????????????????????????????????',
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            'Kanit',
            color: primaryColor,
            fontWeight: FontWeight.w300,
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: load ? ShowProgress() : buildContent(context),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0),
      child: Form(
        key: keyForm,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width * 0.35,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
              child: Text(
                'TherapistBuddy',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Raleway',
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
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
                        color: primaryColor,
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
                      child: TextFormField(maxLength: 9,
                        validator: (value) {
                          if (value.isEmpty) {
                            return '????????????????????????????????????????????????????????????????????????';
                          } else {
                            return null;
                          }
                        },
                        controller: phoneNumberTextfieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: '?????????????????????????????????????????????',
                          hintStyle: GoogleFonts.getFont(
                            'Kanit',
                            color: Color(0xFFA7A8AF),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
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
              padding: EdgeInsets.fromLTRB(33, 8, 33, 0),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return '???????????? Password ??????????????????';
                  } else {
                    return null;
                  }
                },
                controller: passwordTextfieldController,
                obscureText: !passwordTextfieldVisibility,
                decoration: InputDecoration(
                  hintText: '????????????????????????',
                  hintStyle: GoogleFonts.getFont(
                    'Kanit',
                    color: Color(0xFFA7A8AF),
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 1.5,
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
              padding: EdgeInsets.fromLTRB(33, 20, 33, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ForgetPasswordNotLoginPageWidget(),
                        ),
                      );
                    },
                    child: Text(
                      '???????????????????????????????????????????????????????????????',
                      style: GoogleFonts.getFont('Kanit',
                          color: Color(0xFF7A7A7A),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (keyForm.currentState.validate()) {
                    String phoneNumber = phoneNumberTextfieldController.text;
                    print("phoneNumber = $phoneNumber");

                    checkAuthen(phoneNumber);
                  }
                },
                text: '?????????????????????',
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
          ],
        ),
      ),
    );
  }

  Future<Null> checkAuthen(String phoneNumber) async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('ptung')
          .doc(phoneNumber)
          .snapshots()
          .listen((event) async {
        print('event on checkAuten = ${event.data()}');
        if (event.data() == null) {
          MyDialog().normalDialog(context, 'Phone False ?',
              '??????????????? $phoneNumber ?????? ?????????????????????????????????????????????');
        } else {
          PtModel model = PtModel.fromMap(event.data());
          if (passwordTextfieldController.text == model.password) {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences
                .setString('phone', phoneNumber)
                .then((value) => moveHomePage());
          } else {
            MyDialog().normalDialog(
                context, 'Password False', '??????????????????????????? Password ????????????');
          }
        }
      });
    });
  }

  void moveHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => NavBarPage(initialPage: 'Home_page'),
      ),
      (r) => false,
    );
  }
}
