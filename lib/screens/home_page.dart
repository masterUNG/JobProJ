import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:therapist_buddy/variables.dart';
import 'all_appointments_page.dart';
import 'package:therapist_buddy/screens/patient_this_week_exercises_page.dart';
import 'appointment_page.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appbarHeight),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
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
                              'การนัดหมายวันนี้',
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
                                        AllAppointmentsPageWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                'ดูการนัดหมายทั้งหมด',
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
                                padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appointmentCard(context),
                                  ],
                                ),
                              ),
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
                            'การออกกำลังกายของคนไข้สัปดาห์นี้',
                            style: GoogleFonts.getFont(
                              'Kanit',
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            patientThisWeekExerciseResult(context),
                          ],
                        )
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 18, 0, 8),
                        child: Text(
                          'ผลการประเมิณการรักษาล่าสุดของคนไข้',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          eachPatientTreatmentResultsContainer(),
                        ],
                      ),
                    ],
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

Widget appointmentCard(context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
    child: InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppointmentPageWidget(),
          ),
        );
      },
      child: Container(
        width: 110,
        child: Card(
          margin: EdgeInsets.all(0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Image.network(
                  'https://picsum.photos/seed/897/600',
                  width: 110,
                  height: 85,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Text(
                  'ธนวิชญ์',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  'แซ่ลิ่ม',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Text(
                  '10.00 - 12.00 น.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget patientThisWeekExerciseResult(context) {
  return Padding(
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
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ธนวิชญ์ แซ่ลิ่ม',
                            style: GoogleFonts.getFont(
                              'Kanit',
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'สัปดาห์ที่ 1 : ',
                                style: GoogleFonts.getFont(
                                  'Kanit',
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
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
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 11, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 7, 0),
                              child: Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
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
                padding: EdgeInsets.fromLTRB(18, 0, 18, 10),
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
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 20,
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
                  builder: (context) => PatientThisWeekExercisesPageWidget(),
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
  );
}

Widget eachPatientTreatmentResultsContainer() {
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 18),
          child: Text(
            'ธนวิชญ์ แซ่ลิ่ม',
            style: GoogleFonts.getFont(
              'Kanit',
              color: primaryColor,
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            treatmentResultContainer(),
          ],
        )
      ],
    ),
  );
}

Widget treatmentResultContainer() {
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularPercentIndicator(
            radius: 133.0,
            lineWidth: 12.0,
            animation: true,
            percent: 0.5,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '5.0',
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 93,
                  child: Text(
                    'Office Syndrome',
                    style: GoogleFonts.getFont(
                      'Kanit',
                      color: Color(0xff7A7A7A),
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Color(0xffF5F5F5),
            progressColor: defaultYellow,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(21, 0, 21, 0),
            child: Container(
              width: 1.5,
              height: 133,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
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
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'วันที่ : 25 ส.ค. 2564',
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
                Text(
                  'คะแนน : 5/5',
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
                Text(
                  'สถานะ : ปานกลาง',
                  style: GoogleFonts.getFont(
                    'Kanit',
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
