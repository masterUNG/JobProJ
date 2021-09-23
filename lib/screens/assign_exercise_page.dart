import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:therapist_buddy/models/check_exercise_model.dart';
import 'package:therapist_buddy/models/exercise2_model.dart';
import 'package:therapist_buddy/models/exercise_model.dart';
import 'package:therapist_buddy/models/exercise_require_model.dart';
import 'package:therapist_buddy/utility/my_constant.dart';
import 'package:therapist_buddy/utility/my_dialog.dart';
import 'package:therapist_buddy/widgets/show_progress.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import 'package:therapist_buddy/variables.dart';
import 'confirm_exercise_page.dart';
import 'patient_page.dart';
import 'exercise_introduction_for_assigning_page.dart';

class AssignExercisePageWidget extends StatefulWidget {
  AssignExercisePageWidget({Key key}) : super(key: key);

  @override
  _AssignExercisePageWidgetState createState() =>
      _AssignExercisePageWidgetState();
}

class _AssignExercisePageWidgetState extends State<AssignExercisePageWidget> {
  String diseaseValue;
  String exerciseFrequencyValue = "ทุกวัน";
  bool _exercisesFinishBeforeNextAppointment;

  bool load = true;
  List<ExerciseModel> exerciseModels = [];
  List<int> times = [];
  List<int> sets = [];
  String endDate = 'dd MMM yyyy';
  DateTime currentDateTime;
  DateTime endDateTime;

  List<String> exercises = []; // array of uidExercise
  List<int> exercisesets = [];
  List<int> exercisedays = [];
  List<String> docExercises = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllExercise();
    currentDateTime = DateTime.now();
    endDateTime = DateTime.now();
  }

  Future<Null> readAllExercise() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('exercise')
          .snapshots()
          .listen((event) {
        for (var item in event.docs) {
          ExerciseModel model = ExerciseModel.fromMap(item.data());
          docExercises.add(item.id);
          setState(() {
            load = false;
            exerciseModels.add(model);
            times.add(0);
            sets.add(0);

            exercises.add('');
            exercisesets.add(0);
            exercisedays.add(0);
          });
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
          leading: IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text(
                      'ละทิ้งการมอบหมายรายการออกกำลังกาย',
                      style: GoogleFonts.getFont(
                        'Kanit',
                      ),
                    ),
                    content: Text(
                      'คุณแน่ใจหรือไม่ว่าต้องการละทิ้งการมอบหมายรายการออกกำลังกายนี้',
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
                        onPressed: () async {
                          Navigator.pop(alertDialogContext);
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientPageWidget(),
                            ),
                            (r) => false,
                          );
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
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: primaryColor,
              size: 24,
            ),
            iconSize: 24,
          ),
          title: Text(
            'มอบหมาย',
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
          child: load ? ShowProgress() : buildContent(context),
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle1(),
        buildDrpown1(),
        buildTitle2(),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [listExercise(context)],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 18, 0, 12),
          child: Text(
            'ตารางการออกกำลังกายต่อสัปดาห์',
            style: GoogleFonts.getFont(
              'Kanit',
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Container(
            width: double.infinity,
            height: 49,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              border: Border.all(
                color: secondaryColor,
                width: 1,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: exerciseFrequencyValue,
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 14,
                  color: Colors.black,
                ),
                items: <String>[
                  '1 วัน',
                  '2 วัน',
                  '3 วัน',
                  '4 วัน',
                  '5 วัน',
                  '6 วัน',
                  'ทุกวัน',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    exerciseFrequencyValue = value;
                  });
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 18, 0, 12),
          child: Text(
            'วันสิ้นสุดการออกกำลังกาย',
            style: GoogleFonts.getFont(
              'Kanit',
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Container(
            width: double.infinity,
            height: 52,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(defaultBorderRadius),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    endDate,
                    style: GoogleFonts.getFont(
                      'Kanit',
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('You Click Calendar');
                      chooseDate();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.calendarAlt,
                      color: Colors.white,
                      size: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 14, 0, 0),
          child: Row(
            children: [
              Radio(
                value: true,
                groupValue: _exercisesFinishBeforeNextAppointment,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                toggleable: true,
                onChanged: (value) {
                  setState(() {
                    _exercisesFinishBeforeNextAppointment = value;
                    print(
                        "_exercisesFinishBeforeNextAppointment = $_exercisesFinishBeforeNextAppointment");
                  });
                },
              ),
              Text(
                'ก่อนวันนัดครั้งต่อไป 1 วัน',
                style: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(0, 0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 40),
            child: FFButtonWidget(
              onPressed: () async {
                if (diseaseValue == null) {
                  MyDialog().normalDialog(
                      context, 'ยังไม่ได้เลือกโรค', 'กรุณาเลือกโรคด้วย');
                } else {
                  List<String> exercisesDatas = [];
                  List<int> exercisesetsDatas = [];
                  List<int> exercisedaysDatas = [];

                  int i = 0;
                  for (var item in exercises) {
                    if (item.isNotEmpty) {
                      exercisesDatas.add(item);
                    }

                    if (exercisesets[i] != 0) {
                      exercisesetsDatas.add(exercisesets[i]);
                    }

                    if (exercisedays[i] != 0) {
                      exercisedaysDatas.add(exercisedays[i]);
                    }
                    i++;
                  }

                  print('##### exercises ==> $exercisesDatas');
                  print('##### exercisesets ==> $exercisesetsDatas');
                  print('##### exercisedays ==> $exercisedaysDatas');
                  print('#### period ==> $exerciseFrequencyValue');
                  print('#### currentDate ==> $currentDateTime');
                  print('#### endDate ==> $endDateTime');

                  Timestamp currentTimestamp =
                      Timestamp.fromDate(currentDateTime);
                  Timestamp endTimestamp = Timestamp.fromDate(endDateTime);

                  List<Map<String, bool>> result = [];
                  for (var item in exercisedaysDatas) {
                    Map<String, bool> map = {};
                    for (var i = 0; i < item; i++) {
                      map[i.toString()] = false;
                    }
                    result.add(map);
                  }

                  ExerciseRequireModel model = ExerciseRequireModel(
                      currentDate: currentTimestamp,
                      endDate: endTimestamp,
                      exerciseDocs: exercisesDatas,
                      exerciseSets: exercisesetsDatas,
                      exerciseDays: exercisedaysDatas,
                      nameSick: diseaseValue,
                      period: exerciseFrequencyValue,
                      result: result);

                  String docSick =
                      '123123123'; // สมมุติ ว่า docId ของผู้ป่วย ต้องหาเองทีหลังนะ

                  String docId = 'docIdExeReq${Random().nextInt(10000)}';

                  await Firebase.initializeApp().then((value) async {
                    await FirebaseFirestore.instance
                        .collection('sick')
                        .doc(docSick)
                        .collection('exerciseRequire')
                        .doc(docId)
                        .set(model.toMap())
                        .then((value) async {
                      int diff = endDateTime.difference(currentDateTime).inDays;
                      print('#### diff ===>>> $diff');
                      for (var i = 0; i < diff; i++) {
                        DateTime dateTime = DateTime(currentDateTime.year,
                            currentDateTime.month, currentDateTime.day + 1 + i);
                        CheckExerciseModel model = CheckExerciseModel(
                            exeDate: Timestamp.fromDate(dateTime));
                        await FirebaseFirestore.instance
                            .collection('sick')
                            .doc(docSick)
                            .collection('exerciseRequire')
                            .doc(docId)
                            .collection('checkExercise')
                            .doc()
                            .set(model.toMap());
                      }
                    });
                  });
                }

                // await Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ConfirmExercisePageWidget(),
                //   ),
                // );
              },
              text: 'Save Data',
              options: FFButtonOptions(
                width: 190,
                height: 49,
                color: primaryColor,
                textStyle: GoogleFonts.getFont(
                  'Kanit',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: 32,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget listExercise(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: exerciseModels.length,
        itemBuilder: (context, index) => Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          exerciseModels[index].image,
                          width: 92,
                          height: 61,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exerciseModels[index].name,
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '${times[index]}  ครั้ง/เซ็ต',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${sets[index]}  เซ็ต/วัน',
                          style: GoogleFonts.getFont(
                            'Kanit',
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment(1, 0),
                        child: IconButton(
                          onPressed: () async {
                            print('##### You Click form index = $index');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ExerciseIntroductionForAssigningPageWidget(
                                  index: index,
                                ),
                              ),
                            ).then((value) {
                              print('####### value ==> $value');

                              Exercise2Model exercise2model =
                                  Exercise2Model.fromMap(value);

                              print('### index ==> ${exercise2model.index}');
                              print('### times ==> ${exercise2model.times}');
                              print('### sets ==> ${exercise2model.sets}');

                              exercises[exercise2model.index] =
                                  docExercises[exercise2model.index];
                              exercisesets[exercise2model.index] =
                                  exercise2model.times;
                              exercisedays[exercise2model.index] =
                                  exercise2model.sets;

                              setState(() {
                                times[exercise2model.index] =
                                    exercise2model.times;
                                sets[exercise2model.index] =
                                    exercise2model.sets;
                              });
                            });
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 24,
                          ),
                          iconSize: 24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            index != exerciseModels.length - 1
                ? Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFE5E5E5),
                  )
                : SizedBox(),
          ],
        ),
      );

  Padding buildTitle2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 18, 0, 8),
      child: Text(
        'ท่าออกกำลังกาย',
        style: GoogleFonts.getFont(
          'Kanit',
          color: primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }

  Padding buildDrpown1() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Container(
        width: double.infinity,
        height: 49,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          border: Border.all(
            color: secondaryColor,
            width: 1,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text('โปรดเลือกโรค ด้วยคะ'),
            value: diseaseValue,
            style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 14,
              color: Colors.black,
            ),
            items: MyConstant.nameSicks
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                diseaseValue = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Padding buildTitle1() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 25, 0, 8),
      child: Text(
        'โรคของคนไข้',
        style: GoogleFonts.getFont(
          'Kanit',
          color: primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }

  Future<Null> chooseDate() async {
    await showDatePicker(
      context: context,
      initialDate: currentDateTime,
      firstDate: currentDateTime,
      lastDate: DateTime(currentDateTime.year + 3),
    ).then((value) {
      setState(() {
        endDateTime = value;
        DateFormat dateFormat = DateFormat('dd MMMM yyyy');
        endDate = dateFormat.format(endDateTime);

        var diffDay = endDateTime.difference(currentDateTime).inDays;
        print('### diffDay ==> $diffDay');
      });
    });
  }
}
