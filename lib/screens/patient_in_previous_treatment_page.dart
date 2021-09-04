import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:therapist_buddy/variables.dart';
import 'assigned_exercises_in_previous_treatment_page.dart';
import 'patient_all_exercises_page.dart';
import 'patient_treatment_results_page.dart';
import 'patient_profile_page.dart';
import 'package:therapist_buddy/screens/treatment_details_in_previous_treatment_page.dart';

class PatientInPreviousTreatmentPageWidget extends StatefulWidget {
  PatientInPreviousTreatmentPageWidget({Key key}) : super(key: key);

  @override
  _PatientInPreviousTreatmentPageWidgetState createState() =>
      _PatientInPreviousTreatmentPageWidgetState();
}

class _PatientInPreviousTreatmentPageWidgetState
    extends State<PatientInPreviousTreatmentPageWidget> {
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Container(
                  width: 38,
                  height: 38,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/766/600',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ธนวิชญ์ แซ่ลิ่ม',
                      style: GoogleFonts.getFont(
                        'Kanit',
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                      ),
                    )
                  ],
                ),
              )
            ],
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
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientProfilePageWidget(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 24,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                'https://picsum.photos/seed/963/600',
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ข้อมูลโปรไฟล์คนไข้',
                                    style: GoogleFonts.getFont(
                                      'Kanit',
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 28,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ชื่อ',
                                              style: GoogleFonts.getFont(
                                                'Kanit',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 16,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 0, 5, 0),
                                              child: Text(
                                                ':',
                                                style: GoogleFonts.getFont(
                                                  'Kanit',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                24 -
                                                32 -
                                                90 -
                                                14 -
                                                28 -
                                                16,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ธนวิชญ์ แซ่ลิ่ม',
                                              style: GoogleFonts.getFont(
                                                'Kanit',
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 28,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'อายุ',
                                              style: GoogleFonts.getFont(
                                                'Kanit',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 16,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 0, 5, 0),
                                              child: Text(
                                                ':',
                                                style: GoogleFonts.getFont(
                                                  'Kanit',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                24 -
                                                32 -
                                                90 -
                                                14 -
                                                28 -
                                                16,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '20 ปี',
                                              style: GoogleFonts.getFont(
                                                'Kanit',
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(18, 18, 18, 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'ข้อมูลการรักษา',
                            style: GoogleFonts.getFont(
                              'Kanit',
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TreatmentDetailsInPreviousPageWidget(),
                                ),
                              );
                            },
                            child: Text(
                              'ดูเพิ่มเติม',
                              style: GoogleFonts.getFont(
                                'Kanit',
                                color: primaryColor,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 45,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'โรค  :',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 36 - 45,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Office Syndrome',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 101,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'เริ่มการรักษา  :',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 36 - 101,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '15 มิถุนายน 2564',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 128,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'เสร็จสิ้นการรักษา  :',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 36 - 128,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '15 มิถุนายน 2565',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 195,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'สถานะการเสร็จสิ้นการรักษา  :',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 36 - 195,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ยกเลิกการรักษา',
                                  style: GoogleFonts.getFont(
                                    'Kanit',
                                    color: defaultRed,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 18, 18, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'ท่าออกกำลังกายที่มอบหมาย',
                              style: GoogleFonts.getFont(
                                'Kanit',
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AssignedExercisesInPreviousTreatmentPageWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                'ดูรายละเอียด',
                                style: GoogleFonts.getFont(
                                  'Kanit',
                                  color: primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 0, 18),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                      child: Container(
                                        width: 155,
                                        child: Card(
                                          margin: EdgeInsets.all(0),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Colors.white,
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                  bottomRight:
                                                      Radius.circular(0),
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                ),
                                                child: Image.network(
                                                  'https://image.freepik.com/free-photo/young-asian-woman-practicing-yoga-living-room_7861-1619.jpg',
                                                  width: 155,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 8, 0, 0),
                                                child: Container(
                                                  width: 130,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'ยกแขนด้านข้าง',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Kanit',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 10),
                                                child: Container(
                                                  width: 130,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '10 ครั้ง/เซ็ต, 1 เซ็ต/วัน',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Kanit',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 15,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(18, 0, 18, 10),
                          child: Text(
                            'การออกกำลังกายของคนไข้',
                            style: GoogleFonts.getFont(
                              'Kanit',
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
                          child: Stack(
                            alignment: Alignment(1, 0),
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(18, 0, 18, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/seed/759/600',
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                14, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '6 สัปดาห์ที่',
                                                  style: GoogleFonts.getFont(
                                                    'Kanit',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  '10 ส.ค. 64 - 10 ธ.ค. 64',
                                                  style: GoogleFonts.getFont(
                                                    'Kanit',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 16,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  18, 0, 11, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 7, 0),
                                                    child: Container(
                                                      width: 25,
                                                      height: 25,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/112/600',
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(18, 0, 18, 10),
                                      child: Text(
                                        'ความสำเร็จ : 100%',
                                        style: GoogleFonts.getFont(
                                          'Kanit',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        lineHeight: 5.0,
                                        animation: true,
                                        percent: 1,
                                        backgroundColor: Color(0xffF5F5F5),
                                        progressColor: defaultGreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
                                child: IconButton(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PatientAllExercisesPageWidget(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  iconSize: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 18, 0, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                          child: Text(
                            "ผลการรักษา",
                            style: GoogleFonts.getFont(
                              'Kanit',
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(18, 13, 18, 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Office Syndrome",
                                          style: GoogleFonts.getFont(
                                            'Kanit',
                                            color: primaryColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PatientTreatmentResultsPageWidget(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "ดูเพิ่มเติม",
                                            style: GoogleFonts.getFont(
                                              'Kanit',
                                              color: primaryColor,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(14, 0, 55, 14),
                                    child: Container(
                                      width: double.infinity,
                                      height: 200,
                                      child: LineChart(
                                        LineChartData(
                                          minX: 0,
                                          maxX: 3,
                                          minY: 0,
                                          maxY: 5,
                                          titlesData: FlTitlesData(
                                            show: true,
                                            bottomTitles: SideTitles(
                                              showTitles: true,
                                              getTextStyles: (value) {
                                                return TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Kanit',
                                                  fontSize: 15,
                                                );
                                              },
                                              getTitles: (value) {
                                                switch (value.toInt()) {
                                                  case 0:
                                                    return '14 มิ.ย. 64';
                                                  case 1:
                                                    return '17 มิ.ย. 64';
                                                  case 2:
                                                    return '20 มิ.ย. 64';
                                                  case 3:
                                                    return '25 มิ.ย. 64';
                                                }
                                                return '';
                                              },
                                              margin: 12,
                                            ),
                                            leftTitles: SideTitles(
                                              showTitles: true,
                                              getTextStyles: (value) {
                                                return TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Kanit',
                                                  fontSize: 15,
                                                );
                                              },
                                              getTitles: (value) {
                                                switch (value.toInt()) {
                                                  case 1:
                                                    return '1';
                                                  case 2:
                                                    return '2';
                                                  case 3:
                                                    return '3';
                                                  case 4:
                                                    return '4';
                                                  case 5:
                                                    return '5';
                                                }
                                                return '';
                                              },
                                              margin: 18,
                                            ),
                                          ),
                                          gridData: FlGridData(
                                            show: true,
                                            getDrawingHorizontalLine: (value) {
                                              return FlLine(
                                                color: Color(0xffF5F5F5),
                                                strokeWidth: 1,
                                              );
                                            },
                                            drawVerticalLine: true,
                                            getDrawingVerticalLine: (value) {
                                              return FlLine(
                                                color: Color(0xffF5F5F5),
                                                strokeWidth: 1,
                                              );
                                            },
                                          ),
                                          borderData: FlBorderData(
                                            show: true,
                                            border: Border.all(
                                              color: Color(0xffF5F5F5),
                                              width: 1,
                                            ),
                                          ),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(0, 2),
                                                FlSpot(1, 3),
                                                FlSpot(2, 3.5),
                                                FlSpot(3, 4),
                                              ],
                                              colors: lineChartColor,
                                              barWidth: 3,
                                              belowBarData: BarAreaData(
                                                show: true,
                                                colors: lineChartColor
                                                    .map((color) =>
                                                        color.withOpacity(0.3))
                                                    .toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
