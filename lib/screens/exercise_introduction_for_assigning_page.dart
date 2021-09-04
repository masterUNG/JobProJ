import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';

import 'package:therapist_buddy/variables.dart';

class ExerciseIntroductionForAssigningPageWidget extends StatefulWidget {
  ExerciseIntroductionForAssigningPageWidget({Key key}) : super(key: key);

  @override
  _ExerciseIntroductionForAssigningPageWidgetState createState() =>
      _ExerciseIntroductionForAssigningPageWidgetState();
}

class _ExerciseIntroductionForAssigningPageWidgetState
    extends State<ExerciseIntroductionForAssigningPageWidget> {
  int numberOfTimes = 0;
  int numberOfSets = 0;

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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  appbarHeight -
                  85,
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 200) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "จำนวน",
                                style: GoogleFonts.getFont(
                                  'Kanit',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.remove_rounded,
                                  size: 25,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                              Container(
                                width: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$numberOfTimes",
                                      style: GoogleFonts.getFont(
                                        'Kanit',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.add_rounded,
                                  size: 25,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 200) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "ครั้ง/เซ็ต",
                                style: GoogleFonts.getFont(
                                  'Kanit',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 200) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "จำนวน",
                                style: GoogleFonts.getFont(
                                  'Kanit',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.remove_rounded,
                                  size: 25,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                              Container(
                                width: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$numberOfSets",
                                      style: GoogleFonts.getFont(
                                        'Kanit',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.add_rounded,
                                  size: 25,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 200) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "เซ็ต/วัน",
                                style: GoogleFonts.getFont(
                                  'Kanit',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 85,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(2, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "เพิ่ม",
                      style: GoogleFonts.getFont(
                        'Kanit',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      // fixedSize:
                      //     Size(MediaQuery.of(context).size.width - 36, 48),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
