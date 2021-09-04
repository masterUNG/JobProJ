import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';

import 'package:therapist_buddy/variables.dart';

class ExerciseIntroductionPageWidget extends StatefulWidget {
  ExerciseIntroductionPageWidget({Key key}) : super(key: key);

  @override
  _ExerciseIntroductionPageWidgetState createState() =>
      _ExerciseIntroductionPageWidgetState();
}

class _ExerciseIntroductionPageWidgetState
    extends State<ExerciseIntroductionPageWidget> {
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
            'ยกแขนด้านข้าง',
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
            children: [
              FlutterFlowYoutubePlayer(
                url: 'https://www.youtube.com/watch?v=C30hQ0ZSFoM',
                width: MediaQuery.of(context).size.width,
                autoPlay: false,
                looping: false,
                mute: false,
                showControls: true,
                showFullScreen: true,
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ชื่อ',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'ยกแขนด้านข้าง',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontSize: 16,
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
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ประเภทผู้ป่วย',
                        style: GoogleFonts.getFont(
                          'Kanit',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'Office Syndrome',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontSize: 16,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
