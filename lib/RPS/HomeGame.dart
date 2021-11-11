import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/RPS/HomeEasyBot.dart';
import 'package:untitled2/RPS/HomeHardcoreBot.dart';
import 'package:untitled2/RPS/HomeNormalBot.dart';

class HomeGame extends StatefulWidget {
  const HomeGame({Key? key}) : super(key: key);
  static const routeName = '/HomeGame';

  @override
  _HomeGameState createState() => _HomeGameState();
}

class _HomeGameState extends State<HomeGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GameHome')),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/BackG2.jpg'),
                fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/RSPLOGO.png',width: 250.0,height: 250.0,fit: BoxFit.cover,),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, HomeEasyBot.routeName);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green
              ),child: Text("Easy Bot",style: GoogleFonts.sriracha(fontSize: 25.0,),
            ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, HomeNormalBot.routeName);
                });
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue
              ),child: Text("Normal Bot",style: GoogleFonts.sriracha(fontSize: 25.0,),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, HomeHardcoreBot.routeName);
                });
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.red
              ),child: Text("Hardcore Bot",style: GoogleFonts.sriracha(fontSize: 25.0,),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
