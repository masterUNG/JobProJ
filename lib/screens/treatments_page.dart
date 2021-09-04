import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:therapist_buddy/variables.dart';
import 'patient_page.dart';

class TreatmentsPageWidget extends StatefulWidget {
  TreatmentsPageWidget({Key key}) : super(key: key);

  @override
  _TreatmentsPageWidgetState createState() => _TreatmentsPageWidgetState();
}

class _TreatmentsPageWidgetState extends State<TreatmentsPageWidget> {
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  void popupMenuButtonAction(String value) {
    if (value == "cancelTreatment") {
      showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text(
              'ยืนยันการยกเลิกการรักษา',
              style: GoogleFonts.getFont(
                'Kanit',
              ),
            ),
            content: Text(
              'เมื่อยกเลิกการรักษาแล้วจะไม่สามารถเรียกคืนการรักษานี้ได้อีก คุณแน่ใจหรือไม่ว่าต้องการยกเลิกการรักษานี้',
              style: GoogleFonts.getFont(
                'Kanit',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text(
                  'ยกเลิก',
                  style: GoogleFonts.getFont(
                    'Kanit',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(alertDialogContext);
                },
                child: Text(
                  'ยืนยัน',
                  style: GoogleFonts.getFont(
                    'Kanit',
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(18, 18, 18, 18),
                      child: Container(
                        width: double.infinity,
                        height: 41,
                        child: TextFormField(
                          onChanged: (_) => setState(() {}),
                          controller: textController,
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
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 20,
                            ),
                            suffixIcon: textController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => textController.clear(),
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
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 12, 0),
                        child: Icon(
                          Icons.perm_identity_rounded,
                          color: primaryColor,
                          size: 24,
                        ),
                      ),
                      Text(
                        'การรักษาปัจจุบัน (2)',
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
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        alignment: Alignment(1, -0.85),
                        children: [
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PatientPageWidget(),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(18, 18, 18, 18),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        'https://picsum.photos/seed/63/600',
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                36 -
                                                90 -
                                                16,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'ธนภัทร พัฒนา',
                                                  style: GoogleFonts.getFont(
                                                    'Kanit',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 40,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'โรค  :',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Kanit',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    36 -
                                                    90 -
                                                    16 -
                                                    40,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Office Syndrome',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Kanit',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
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
                                                width: 70,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'นัดหมาย  :',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Kanit',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    36 -
                                                    90 -
                                                    16 -
                                                    70,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '25 มิถุนายน 2564',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Kanit',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
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
                                                width: 118,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ท่าออกกำลังกาย  :',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Kanit',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    36 -
                                                    90 -
                                                    16 -
                                                    118,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ยกแขนด้านบน',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Kanit',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 'cancelTreatment',
                                  child: Text(
                                    'ยกเลิกการักษา',
                                    style: GoogleFonts.getFont(
                                      'Kanit',
                                    ),
                                  ),
                                ),
                              ];
                            },
                            onSelected: (String value) {
                              return popupMenuButtonAction(value);
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 2,
                        thickness: 2,
                        color: Color(0xFFF5F5F5),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
