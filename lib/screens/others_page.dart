import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapist_buddy/models/pt_model.dart';

import 'package:therapist_buddy/variables.dart';
import 'edit_profile_page.dart';
import 'login_page.dart';
import 'settings_page.dart';
import 'treatments_history_page.dart';

class OthersPageWidget extends StatefulWidget {
  OthersPageWidget({Key key}) : super(key: key);

  @override
  _OthersPageWidgetState createState() => _OthersPageWidgetState();
}

class _OthersPageWidgetState extends State<OthersPageWidget> {
  String currentToken;
  PtModel ptModel;
  String docId;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    docId = preferences.getString('phone');

    await Firebase.initializeApp().then((value) async {
      currentToken = await FirebaseMessaging.instance.getToken();

      await FirebaseFirestore.instance
          .collection('ptung')
          .doc(docId)
          .snapshots()
          .listen((event) async {
        bool status = true;
        if (status) {
          status = false;
          ptModel = PtModel.fromMap(event.data());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appbarHeight),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          title: Text(
            'TherapistBuddy',
            style: GoogleFonts.getFont(
              'Raleway',
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 73,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Color(0x3F000000),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePageWidget(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(9, 0, 15, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              'https://picsum.photos/seed/353/600',
                              width: 61,
                              height: 61,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          '??????????????????????????????????????????????????????',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 73,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Color(0x3F000000),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TreatmentsHistoryPageWidget(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(9, 0, 15, 0),
                          child: Container(
                            width: 61,
                            height: 61,
                            decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/healthHistory_icon.png',
                                  width: 37,
                                  fit: BoxFit.fitWidth,
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '????????????????????????????????????????????????????????????',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 73,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Color(0x3F000000),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPageWidget(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(9, 0, 15, 0),
                          child: Container(
                            width: 61,
                            height: 61,
                            decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/settings_icon.png',
                                  width: 34,
                                  fit: BoxFit.fitWidth,
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '??????????????????????????????',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 73,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Color(0x3F000000),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text(
                              '??????????????????????????????',
                              style: GoogleFonts.getFont(
                                'Kanit',
                              ),
                            ),
                            content: Text(
                              '?????????????????????????????????????????????????????????????????????????????????????????????????????????',
                              style: GoogleFonts.getFont(
                                'Kanit',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text(
                                  '??????????????????',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(alertDialogContext);

                                  // print('????????????????????? token ==>> $currentToken');

                                  // await FirebaseFirestore.instance
                                  //     .collection('ptung')
                                  //     .doc(docId)
                                  //     .collection('mytoken')
                                  //     .where('token', isEqualTo: currentToken)
                                  //     .snapshots()
                                  //     .listen((event) async {
                                  //   bool status = true;
                                  //   if (status) {
                                  //     status = false;
                                  //     for (var item in event.docs) {
                                  //       String docIdMyToken = item.id;
                                  //       print(
                                  //           '### docIdMyToken ==> $docIdMyToken');
                                  //       await FirebaseFirestore.instance
                                  //           .collection('ptung')
                                  //           .doc(docId)
                                  //           .collection('mytoken')
                                  //           .doc(docIdMyToken)
                                  //           .delete()
                                  //           .then((value) async {
                                  //         SharedPreferences preferences =
                                  //             await SharedPreferences
                                  //                 .getInstance();
                                  //         preferences.clear();

                                  //         await FirebaseMessaging.instance
                                  //             .deleteToken();

                                  //         Navigator.pushNamedAndRemoveUntil(
                                  //             context,
                                  //             '/login',
                                  //             (route) => false);
                                  //       });
                                  //     }
                                  //   }
                                  // });
                                }, //end
                                child: Text(
                                  '??????????????????',
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(9, 0, 15, 0),
                          child: Container(
                            width: 61,
                            height: 61,
                            decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/logout_icon.png',
                                  width: 32,
                                  fit: BoxFit.fitWidth,
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '??????????????????????????????',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
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
      ),
    );
  }
}
