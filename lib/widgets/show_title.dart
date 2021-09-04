import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowTitle extends StatelessWidget {
  final String title;
  const ShowTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-1, 0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Text(
          title,
          style: GoogleFonts.getFont(
            'Kanit',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
