import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:therapist_buddy/variables.dart';

class PatientProfilePageWidget extends StatefulWidget {
  PatientProfilePageWidget({Key key}) : super(key: key);

  @override
  _PatientProfilePageWidgetState createState() =>
      _PatientProfilePageWidgetState();
}

class _PatientProfilePageWidgetState extends State<PatientProfilePageWidget> {
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
            'ข้อมูลโปรไฟล์คนไข้',
            style: GoogleFonts.getFont(
              'Kanit',
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 21,
            ),
            maxLines: 1,
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
            Stack(
              alignment: Alignment(0, 0),
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Image.network(
                    'https://www.prachachat.net/wp-content/uploads/2020/08/1-193.png',
                    width: double.infinity,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 260,
                    decoration: BoxDecoration(
                      color: Color(0x73494949),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          'https://image.freepik.com/free-photo/confident-young-asia-female-doctor-white-medical-uniform-with-stethoscope-looking-camera-smiling-while-video-conference-call-with-patient-health-hospital_7861-3136.jpg',
                        ).image,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
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
                      decoration: BoxDecoration(),
                      child: Text(
                        'ธนวิชญ์ แซ่ลิ่ม',
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
                      'อายุ',
                      style: GoogleFonts.getFont(
                        'Kanit',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Text(
                        '20 ปี',
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
    );
  }
}
