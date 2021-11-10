import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/RPS/HomeGame.dart';
import 'package:untitled2/RPS/ShowScore.dart';

class HomeNormalBot extends StatefulWidget {
  const HomeNormalBot({Key? key}) : super(key: key);
  static const routeName = '/MyHomeNormalBot';

  @override
  _HomeNormalBotState createState() => _HomeNormalBotState();
}

class _HomeNormalBotState extends State<HomeNormalBot> {
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
          NormalbotHP--;
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
          NormalbotHP--;
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
          NormalbotHP--;
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
      if (NormalbotHP == 0) {
        Win = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rock Paper Scissors With NORMALBOT')),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/BGNormal.jpg'),
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
                          'images/Brid.png',
                          width: 150.0,
                          height: 150.0,
                        ),
                      ],
                    ),
                  ),
                  if (pUse == 0)
                    Container(
                      child: Image.asset(
                        'images/pngegg.png',
                        width: 150.0,
                        height: 150.0,
                      ),
                    )
                  else if (pUse == 1)
                    Row(
                      children: [
                        Image.asset('images/Rock.jpg'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'images/VS.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ),
                        if (BUSe == 1)
                          Image.asset('images/Rock.jpg')
                        else if (BUSe == 2)
                          Image.asset('images/Scissors.jpg')
                        else if (BUSe == 3)
                            Image.asset('images/Paper.jpg'),
                      ],
                    )
                  else if (pUse == 2)
                      Row(
                        children: [
                          Image.asset('images/Scissors.jpg'),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'images/VS.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          if (BUSe == 1)
                            Image.asset('images/Rock.jpg')
                          else if (BUSe == 2)
                            Image.asset('images/Scissors.jpg')
                          else if (BUSe == 3)
                              Image.asset('images/Paper.jpg'),
                        ],
                      )
                    else if (pUse == 3)
                        Row(
                          children: [
                            Image.asset('images/Paper.jpg'),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'images/VS.png',
                                width: 50.0,
                                height: 50.0,
                              ),
                            ),
                            if (BUSe == 1)
                              Image.asset('images/Rock.jpg')
                            else if (BUSe == 2)
                              Image.asset('images/Scissors.jpg')
                            else if (BUSe == 3)
                                Image.asset('images/Paper.jpg'),
                          ],
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Column(
                      children: [
                        Text(
                          'Normal BOT',
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
                              for (int i = 1; i <= 10; ++i)
                                if (i <= NormalbotHP)
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
                          'images/NBot.png',
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
                      'images/GameOver.png',
                      width: 200.0,
                      height: 200.0,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          GameOver = false;
                          PlayerHP = 5;
                          NormalbotHP = 10;
                          pUse = 0;
                          BUSe = 0;
                        });
                      },
                      child: Image.asset(
                        'images/Try.png',
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
                        'images/Win.png',
                        width: 200.0,
                        height: 200.0,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Win = false;
                            PlayerHP = 5;
                            NormalbotHP = 10;
                            pUse = 0;
                            BUSe = 0;
                          });
                        },
                        child: Image.asset(
                          'images/Try.png',
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
                            image: AssetImage('images/Rock.jpg'),
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
                            image: AssetImage('images/Scissors.jpg'),
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
                            image: AssetImage('images/Paper.jpg'),
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
                      'images/Go-back-icon.png',
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
