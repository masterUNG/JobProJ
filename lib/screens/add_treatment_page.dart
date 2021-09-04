import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';

class AddTreatmentPageWidget extends StatefulWidget {
  AddTreatmentPageWidget({Key key}) : super(key: key);

  @override
  _AddTreatmentPageWidgetState createState() => _AddTreatmentPageWidgetState();
}

class _AddTreatmentPageWidgetState extends State<AddTreatmentPageWidget> {
  int searchTypeValue = 1;
  TextEditingController userIDTextController;
  TextEditingController patientNameTextController;

  @override
  void initState() {
    super.initState();
    userIDTextController = TextEditingController();
    patientNameTextController = TextEditingController();
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: searchTypeValue,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                searchTypeValue = value;
                                print("searchTypeValue = $searchTypeValue");
                              });
                            },
                          ),
                          Text(
                            'ไอดีผู้ใช้ของคนไข้',
                            style: GoogleFonts.getFont(
                              'Kanit',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: searchTypeValue,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                searchTypeValue = value;
                                print("radioButtonValue = $searchTypeValue");
                              });
                            },
                          ),
                          Text(
                            'รายชื่อคนไข้',
                            style: GoogleFonts.getFont(
                              'Kanit',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              searchTypeValue == 1
                  ? Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(18, 0, 18, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 41,
                                    child: TextFormField(
                                      onChanged: (_) => setState(() {}),
                                      controller: userIDTextController,
                                      obscureText: false,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'โปรดใส่ไอดีผู้ใช้ของคนไข้',
                                        hintStyle: GoogleFonts.getFont(
                                          'Kanit',
                                          color: Color(0xFFA7A8AF),
                                          fontSize: 16,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFF0F2F5),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(18, 10, 0, 10),
                                        suffixIcon:
                                            userIDTextController.text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () => setState(
                                                      () => userIDTextController
                                                          .clear(),
                                                    ),
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Colors.black,
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Kanit',
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 41,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF0F2F5),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(30),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.search_rounded,
                                          color: primaryColor,
                                          size: 23,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment(0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 115,
                                  height: 115,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://image.freepik.com/free-photo/confident-young-asia-female-doctor-white-medical-uniform-with-stethoscope-looking-camera-smiling-while-video-conference-call-with-patient-health-hospital_7861-3136.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(30, 5, 30, 8),
                                  child: Text(
                                    'ธนวิชญ์ แซ่ลิ่ม',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Kanit',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 21,
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'รักษา',
                                  options: FFButtonOptions(
                                    width: 150,
                                    height: 40,
                                    color: primaryColor,
                                    textStyle: GoogleFonts.getFont(
                                      'Kanit',
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    borderRadius: 30,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(18, 0, 18, 8),
                            child: Container(
                              width: double.infinity,
                              height: 41,
                              child: TextFormField(
                                onChanged: (_) => setState(() {}),
                                controller: patientNameTextController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'ค้นหา',
                                  hintStyle: GoogleFonts.getFont(
                                    'Kanit',
                                    color: Color(0xFFA7A8AF),
                                    fontSize: 16,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFF0F2F5),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  suffixIcon:
                                      patientNameTextController.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () => setState(
                                                () => patientNameTextController
                                                    .clear(),
                                              ),
                                              child: Icon(
                                                Icons.clear,
                                                color: Colors.black,
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                ),
                                style: GoogleFonts.getFont(
                                  'Kanit',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                MediaQuery.of(context).padding.bottom -
                                appbarHeight -
                                70 -
                                42 -
                                8 -
                                bottomNavigationBarHeight,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              18, 12, 18, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 66,
                                                height: 66,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  'https://picsum.photos/seed/54/600',
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    14, 0, 0, 0),
                                                child: Container(
                                                  width: 200,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'จ๊อบ แซ่ลิ่ม',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Kanit',
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment(1, 0),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                    icon: Icon(
                                                      Icons.add_circle_rounded,
                                                      color: primaryColor,
                                                      size: 35,
                                                    ),
                                                    iconSize: 35,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
