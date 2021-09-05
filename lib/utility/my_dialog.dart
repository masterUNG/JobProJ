import 'package:flutter/material.dart';
import 'package:therapist_buddy/widgets/show_logo.dart';
import 'package:therapist_buddy/widgets/show_title.dart';

class MyDialog {
  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowLogo(),
          title: ShowTitle(title: title),
          subtitle: Text(message),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
      ),
    );
  }

  Future<Null> progressDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
          child: Center(child: CircularProgressIndicator()),
          onWillPop: () async {
            return false;
          }),
    );
  }
}
