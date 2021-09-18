import 'dart:io';

import 'package:flutter/material.dart';

class NoInterner extends StatefulWidget {
  const NoInterner({Key key}) : super(key: key);

  @override
  _NoInternerState createState() => _NoInternerState();
}

class _NoInternerState extends State<NoInterner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: Text('No Internet Please Exit App'))),
    );
  }
}
