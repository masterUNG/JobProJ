import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:therapist_buddy/models/exercise_model.dart';
import 'package:therapist_buddy/models/exercise_require_model.dart';
import 'package:therapist_buddy/widgets/show_progress.dart';
import 'package:therapist_buddy/widgets/show_title.dart';

class DemoReadSick extends StatefulWidget {
  final String docSick;
  const DemoReadSick({Key key, @required this.docSick}) : super(key: key);

  @override
  _DemoReadSickState createState() => _DemoReadSickState();
}

class _DemoReadSickState extends State<DemoReadSick> {
  String docSick;
  DateTime currentDateTime;
  List<String> docIdExerciseRequires = [];
  List<ExerciseRequireModel> exerciseRequireModels = [];
  Map<String, ExerciseModel> mapExercoseModel = {};

  List<List<bool>> listStatus = [];
  List<List<String>> listExerciseAndSets = [];
  List<List<String>> listImageExercise = [];

  // bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    docSick = widget.docSick;
    currentDateTime = DateTime.now();
    currentDateTime = DateTime(
        currentDateTime.year, currentDateTime.month, currentDateTime.day);
    //  print('docSick ==>> $docSick');
    readExercise();
    setupExerciseModel();
  }

  Future<Null> setupExerciseModel() async {
    await FirebaseFirestore.instance.collection('exercise').get().then((value) {
      for (var item in value.docs) {
        String docId = item.id;
        ExerciseModel model = ExerciseModel.fromMap(item.data());
        setState(() {
          mapExercoseModel[docId] = model;
        });
      }
      // print('#### mapExerciseModel ==>> $mapExercoseModel');
    });
  }

  Future<void> readExercise() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('sick')
          .doc(docSick)
          .collection('exerciseRequire')
          .snapshots()
          .listen((event) async {
        for (var item in event.docs) {
          String docIdExerciseRequrie = item.id;
          docIdExerciseRequires.add(docIdExerciseRequrie);

          await FirebaseFirestore.instance
              .collection('sick')
              .doc(docSick)
              .collection('exerciseRequire')
              .doc(item.id)
              .collection('checkExercise')
              .where('exeDate', isEqualTo: Timestamp.fromDate(currentDateTime))
              .snapshots()
              .listen((event) async {
            for (var item in event.docs) {
              await FirebaseFirestore.instance
                  .collection('sick')
                  .doc(docSick)
                  .collection('exerciseRequire')
                  .doc(docIdExerciseRequrie)
                  .snapshots()
                  .listen((event) {
                ExerciseRequireModel exerciseRequireModel =
                    ExerciseRequireModel.fromMap(event.data());

                List<bool> bolStatus = [];
                List<String> exerciseAndSets = [];
                List<String> imageExercises = [];

                for (var item in exerciseRequireModel.exerciseDays) {
                  for (var i = 0; i < item; i++) {
                    bolStatus.add(false);
                    exerciseAndSets.add('TestExeerciseAndset');
                    imageExercises.add('');
                  }
                }

                setState(() {
                  exerciseRequireModels.add(exerciseRequireModel);
                  listStatus.add(bolStatus);
                  print('### listStatys ==> $listStatus');
                });
              });
            }
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Read Sick $docSick'),
      ),
      body: mapExercoseModel.length == 0 ? ShowProgress() : buildContent(),
    );
  }

  Widget buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowTitle(title: 'ว้นนี่วันที่ : ${currentDateTime.toString()}'),
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: exerciseRequireModels.length,
            itemBuilder: (context, index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    listStartEndDate(index),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount:
                          exerciseRequireModels[index].exerciseDocs.length,
                      itemBuilder: (context, index2) => Card(
                        color: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: listDetailExercise(
                            exerciseRequireModels[index].exerciseDocs[index2],
                            exerciseRequireModels[index].exerciseDays[index2],
                            exerciseRequireModels[index].exerciseSets[index2],
                            index,
                            index2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row listStartEndDate(int index) {
    return Row(
      children: [
        Text(myFormatDate(exerciseRequireModels[index].currentDate)),
        Text('  -  '),
        Text(myFormatDate(exerciseRequireModels[index].endDate)),
      ],
    );
  }


  

  List<bool> testStatus = [];

  Widget listDetailExercise(
    String docIdExe,
    int exerciseDay,
    int exerciseSet,
    int index1,
    int index2,
  ) {
    ExerciseModel model = mapExercoseModel[docIdExe];

    

    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: exerciseDay,
      itemBuilder: (context, index3) => GestureDetector(
        onTap: () {
          print('### index1 ==> $index1, index2 ==>> $index3');
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: model.image,
                    placeholder: (context, url) => ShowProgress(),
                  ),
                ),
              ),
              Text('${model.name} $exerciseSet ครั้ง/set'),
              Checkbox(
                value: listStatus[index1][index3],
                onChanged: (value) {
                  // setState(() {
                  //   listStatus[index1][index3] = value;

                  // });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String myFormatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    DateFormat dateFormat = DateFormat('dd MMM yyyy');
    String result = dateFormat.format(dateTime);
    return result;
  }
}
