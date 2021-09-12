import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:therapist_buddy/models/pt_model.dart';
import 'package:therapist_buddy/utility/my_dialog.dart';
import 'package:therapist_buddy/widgets/show_logo.dart';
import 'package:therapist_buddy/widgets/show_progress.dart';
import 'package:therapist_buddy/widgets/show_title.dart';

class TestSentNoti extends StatefulWidget {
  const TestSentNoti({Key key}) : super(key: key);

  @override
  _TestSentNotiState createState() => _TestSentNotiState();
}

class _TestSentNotiState extends State<TestSentNoti> {
  List<PtModel> ptModels = [];

  @override
  void initState() {
    super.initState();
    readAllPt();
  }

  Future<Null> readAllPt() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('pt')
          .snapshots()
          .listen((event) {
        for (var item in event.docs) {
          // print('docid ==> ${item.id}');
          PtModel model = PtModel.fromMap(item.data());
          setState(() {
            ptModels.add(model);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Send Noti'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ptModels.length == 0
            ? ShowProgress()
            : Container(width: constraints.maxWidth*0.8,
              child: ListView.builder(
                  itemCount: ptModels.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      print('You Tap index = $index');
                      confirmDialog(ptModels[index]);
                    },
                    child: Card(
                      color: index % 2 == 0 ? Colors.grey.shade300 : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ShowTitle(title: ptModels[index].firstName),
                                ShowTitle(title: ptModels[index].lastName)
                              ],
                            ),
                            Row(
                              children: [
                                ShowTitle(title: 'License Number :'),
                                Text(ptModels[index].licenseNumber),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ),
      ),
    );
  }

  confirmDialog(PtModel ptModel) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowLogo(),
          title: Row(
            children: [
              Text(ptModel.firstName),
              SizedBox(
                width: 20,
              ),
              Text(ptModel.lastName),
            ],
          ),
          subtitle:
              Text('License Number aaa bbb ccc: ${ptModel.licenseNumber}'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: ptModel.pathAvatar,
              placeholder: (context, url) => ShowProgress(),
              errorWidget: (context, url, error) => ShowLogo(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Birth : '),
                Text(ptModel.birthDayValue),
                Text(ptModel.birthMonthValue),
                Text(ptModel.birthYearValue),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              sentNotification(ptModel);
            },
            child: Text('Sent Notification'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<Null> sentNotification(PtModel ptModel) async {
    if (ptModel.tokens.length == 0) {
      MyDialog()
          .normalDialog(context, 'No Token', 'ไม่สามารถส่งได้ ไม่มี Token');
    } else {
      for (var item in ptModel.tokens) {
        String token = item;
        print('##########  token ที่ต้องการจะยิง = $token');
        String title = ptModel.firstName;
        String body = 'นี่คือข้อความ บน bady';
        String url = 'https://www.androidthai.in.th/bigc/app/apiNotification.php?isAdd=true&token=$token&title=$title&body=$body';
        await Dio().get(url).then((value) => print('Success Noti'));
      }
    }
  }
}
