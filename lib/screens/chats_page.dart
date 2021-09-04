import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:therapist_buddy/variables.dart';

class ChatsPageWidget extends StatefulWidget {
  ChatsPageWidget({Key key}) : super(key: key);

  @override
  _ChatsPageWidgetState createState() => _ChatsPageWidgetState();
}

class _ChatsPageWidgetState extends State<ChatsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
    );
  }
}
