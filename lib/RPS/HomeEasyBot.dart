import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/RPS/HomeGame.dart';
import 'package:untitled2/RPS/ShowScore.dart';

class HomeEasyBot extends StatefulWidget {
  const HomeEasyBot({Key? key}) : super(key: key);
  static const routeName = '/MyHomeEasybot';

  @override
  _HomeEasyBotState createState() => _HomeEasyBotState();
}

class _HomeEasyBotState extends State<HomeEasyBot> {
  var H = "Hello what you need?";
  int scoreP = 0;
  int scoreBot = 0;
  int CPU = 0;
  int PlayerHP = 5;
  int EzbotHP = 5;
  int NormalbotHP = 10;
  int HardcorebotHP = 20;
  var CPUTalk = "Hello :]";
  var systeam = "...";
  bool yes = true;
  int pUse = 0;
  int BUSe = 0;
  bool GameOver = false;
  bool Win = false;

  _click(int player) {
    setState(() {
      if (player == 1) {
        pUse = 1;
        H = "Rock!";
        CPU = Random().nextInt(3) + 1;
        BUSe = CPU;
        if (CPU == 1) {
          CPUTalk = "Rock!";
        } else if (CPU == 2) {
          CPUTalk = "Scissors!";
        } else {
          CPUTalk = "Paper!";
        }
        ///// คิดวิเคราะห์
        if (player == CPU) {
          systeam = "Draw";
        } else if (player == 1 && CPU == 2) {
          systeam = "You Win";
          scoreP++;
          scoreBot--;
          EzbotHP--;
        } else if (player == 1 && CPU == 3) {
          systeam = "You Lose";
          scoreP--;
          scoreBot++;
          PlayerHP--;
        }
      } else if (player == 2) {
        pUse = 2;
        H = "Scissors!";
        CPU = Random().nextInt(3) + 1;
        BUSe = CPU;
        if (CPU == 1) {
          CPUTalk = "Rock!";
        } else if (CPU == 2) {
          CPUTalk = "Scissors!";
        } else {
          CPUTalk = "Paper!";
        }
        ///// คิดวิเคราะห์
        if (player == CPU) {
          systeam = "Draw";
        } else if (player == 2 && CPU == 3) {
          systeam = "You Win";
          scoreP++;
          scoreBot--;
          EzbotHP--;
        } else if (player == 2 && CPU == 1) {
          systeam = "You Lose";
          scoreP--;
          scoreBot++;
          PlayerHP--;
        }
      } else if (player == 3) {
        pUse = 3;
        H = "Paper!";
        CPU = Random().nextInt(3) + 1;
        BUSe = CPU;
        if (CPU == 1) {
          CPUTalk = "Rock!";
        } else if (CPU == 2) {
          CPUTalk = "Scissors!";
        } else {
          CPUTalk = "Paper!";
        }
        ///// คิดวิเคราะห์
        if (player == CPU) {
          systeam = "Draw";
        } else if (player == 3 && CPU == 1) {
          systeam = "You Win";
          scoreP++;
          scoreBot--;
          EzbotHP--;
        } else if (player == 3 && CPU == 2) {
          systeam = "You Lose";
          scoreP--;
          scoreBot++;
          PlayerHP--;
        }
      }
      if (scoreP < 0) {
        scoreP = 0;
      }
      if (scoreBot < 0) {
        scoreBot = 0;
      }
      if (PlayerHP == 0) {
        GameOver = true;
      }
      if (EzbotHP == 0) {
        Win = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rock Paper Scissors With EZBOT')),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BackG1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!GameOver && !Win)
              Container(
                height: 100.0,
              ),
            /*
            Column(
              children: [
                Text("Player $H",
                    style: GoogleFonts.sriracha(
                      fontSize: 25.0,
                    )),
                Text(
                  'playerHP $PlayerHP',
                  style: GoogleFonts.sriracha(fontSize: 25.0),
                ),
                Text("CPU $CPUTalk",
                    style: GoogleFonts.sriracha(fontSize: 25.0)),
                Text("$systeam",
                    style:
                        GoogleFonts.charm(fontSize: 35.0, color: Colors.red)),
                Text("Player Score:$scoreP",
                    style:
                        GoogleFonts.prompt(fontSize: 25.0, color: Colors.pink)),
                Text("CPU Score:$scoreBot",
                    style: GoogleFonts.prompt(
                        fontSize: 25.0, color: Colors.green)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacementNamed(
                            context, ShowScore.routeName);
                      });
                    },
                    child: Text(
                      'ShowScore',
                      style: GoogleFonts.prompt(
                          fontSize: 25.0, color: Colors.deepOrange),
                    )),
              ],
            ),
             */
            if (!GameOver && !Win)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Column(
                      children: [
                        Text(
                          'Player',
                          style: GoogleFonts.sriracha(
                              fontSize: 20.0, color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_downward,
                          size: 40.0,
                          color: Colors.green,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              for (int i = 1; i <= 5; ++i)
                                if (i <= PlayerHP)
                                  Icon(
                                    Icons.favorite,
                                    size: 25.0,
                                    color: Colors.red,
                                  )
                                else
                                  Icon(
                                    Icons.favorite_outline,
                                    size: 25.0,
                                    color: Colors.redAccent,
                                  ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/Brid.png',
                          width: 150.0,
                          height: 150.0,
                        ),
                      ],
                    ),
                  ),
                  if (pUse == 0)
                    Container(
                      child: Image.asset(
                        'assets/images/pngegg.png',
                        width: 150.0,
                        height: 150.0,
                      ),
                    )
                  else if (pUse == 1)
                    Row(
                      children: [
                        Image.asset('assets/images/Rock.jpg'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'images/VS.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ),
                        if (BUSe == 1)
                          Image.asset('assets/images/Rock.jpg')
                        else if (BUSe == 2)
                          Image.asset('assets/images/Scissors.jpg')
                        else if (BUSe == 3)
                          Image.asset('assets/images/Paper.jpg'),
                      ],
                    )
                  else if (pUse == 2)
                    Row(
                      children: [
                        Image.asset('assets/images/Scissors.jpg'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/VS.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ),
                        if (BUSe == 1)
                          Image.asset('assets/images/Rock.jpg')
                        else if (BUSe == 2)
                          Image.asset('assets/images/Scissors.jpg')
                        else if (BUSe == 3)
                          Image.asset('assets/images/Paper.jpg'),
                      ],
                    )
                  else if (pUse == 3)
                    Row(
                      children: [
                        Image.asset('assets/images/Paper.jpg'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/VS.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ),
                        if (BUSe == 1)
                          Image.asset('assets/images/Rock.jpg')
                        else if (BUSe == 2)
                          Image.asset('assets/images/Scissors.jpg')
                        else if (BUSe == 3)
                          Image.asset('assets/images/Paper.jpg'),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Column(
                      children: [
                        Text(
                          'EZ BOT',
                          style: GoogleFonts.sriracha(
                              fontSize: 20.0, color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_downward,
                          size: 40.0,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              for (int i = 1; i <= 5; ++i)
                                if (i <= EzbotHP)
                                  Icon(
                                    Icons.favorite,
                                    size: 25.0,
                                    color: Colors.red,
                                  )
                                else
                                  Icon(
                                    Icons.favorite_outline,
                                    size: 25.0,
                                    color: Colors.redAccent,
                                  ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/Ezbot.png',
                          width: 150.0,
                          height: 150.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else if (GameOver)
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200.0,
                    ),
                    Image.asset(
                      'assets/images/GameOver.png',
                      width: 200.0,
                      height: 200.0,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          GameOver = false;
                          PlayerHP = 5;
                          EzbotHP = 5;
                          pUse = 0;
                          BUSe = 0;
                        });
                      },
                      child: Image.asset(
                        'assets/images/Try.png',
                        width: 150.0,
                        height: 150.0,
                      ),
                    ),
                  ],
                ),
              )
            else if (Win)
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200.0,
                    ),
                    Image.asset(
                      'assets/images/Win.png',
                      width: 200.0,
                      height: 200.0,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          Win = false;
                          PlayerHP = 5;
                          EzbotHP = 5;
                          pUse = 0;
                          BUSe = 0;
                        });
                      },
                      child: Image.asset(
                        'assets/images/Try.png',
                        width: 150.0,
                        height: 150.0,
                      ),
                    ),
                  ],
                ),
              ),
            if (!GameOver && !Win)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => _click(1),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Rock.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _click(2),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Scissors.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _click(3),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Paper.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacementNamed(
                            context, HomeGame.routeName);
                      });
                    },
                    child: Image.asset(
                      'assets/images/Go-back-icon.png',
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ],
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
