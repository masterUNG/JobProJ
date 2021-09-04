import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:therapist_buddy/variables.dart';

class TreatmentDetailsInPreviousPageWidget extends StatefulWidget {
  const TreatmentDetailsInPreviousPageWidget({Key key}) : super(key: key);

  @override
  _TreatmentDetailsInPreviousPageWidgetState createState() =>
      _TreatmentDetailsInPreviousPageWidgetState();
}

class _TreatmentDetailsInPreviousPageWidgetState
    extends State<TreatmentDetailsInPreviousPageWidget> {
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
            'ข้อมูลการรักษา',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
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
                        'ชื่อคนไข้',
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
                        'โรคที่ทำการรักษา',
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
                        'วันที่เริ่มทำการรักษา',
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
                          '1 กันยายน 2564',
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
                        'วันที่เสร็จสิ้นการรักษา',
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
                          '25 กันยายน 2564',
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
                        'สถานะการเสร็จสิ้นการรักษา',
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
                          'ยกเลิกการรักษา',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: defaultRed,
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
