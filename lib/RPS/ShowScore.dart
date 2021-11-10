import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/RPS/HomeEasyBot.dart';
class ShowScore extends StatefulWidget {
  const ShowScore({Key? key}) : super(key: key);
  static const routeName = '/ShowScore';
  @override
  _ShowScoreState createState() => _ShowScoreState();
}

class _ShowScoreState extends State<ShowScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/A1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      child: TextButton(onPressed: () {
        setState(() {
          Navigator.pushReplacementNamed(context, HomeEasyBot.routeName);
        });
      }, child: Image.asset('assets/images/Rock.jpg',),
      ),
    );
  }
}
