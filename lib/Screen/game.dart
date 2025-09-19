import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictac/Constants/Colors.dart';

class GameScreen extends StatefulWidget {
  static var customFontswhite = GoogleFonts.coiny(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 28),
  );

  static var customFontinBox = GoogleFonts.coiny(
    textStyle: TextStyle(color: MainColor.primaryColor, fontSize: 65),
  );
  GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> displayX0 = ["", "", "", "", "", "", "", "", ""];

  bool isYourTurn = true;
  var resultDeclaration = '';
  int oScore = 0;
  int xScore = 0;
  int fillBoxes = 0;
  bool winnerfound = false;
  static const maxSeconds=30;
  int seconds=maxSeconds;
  Timer? timer;

  void startTimer(){
    timer=Timer.periodic(Duration(seconds: 1), (_){
      setState(() {


      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Player 0", style: GameScreen.customFontswhite),
                        Text(
                          oScore.toString(),
                          style: GameScreen.customFontswhite,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Player X", style: GameScreen.customFontswhite),
                        Text(
                          xScore.toString(),
                          style: GameScreen.customFontswhite,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: MainColor.primaryColor,
                        ),
                        color: MainColor.secondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          displayX0[index],
                          style: GameScreen.customFontinBox,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  spacing: 10,
                  children: [
                    Text(resultDeclaration, style: GameScreen.customFontswhite),
                    ElevatedButton(
                      onPressed: () {
                        _clearboard();
                      },
                      child: Text("Play Again!",style: TextStyle(color: Colors.black,fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (isYourTurn && displayX0[index] == "") {
        displayX0[index] = "0";
        fillBoxes++;
      } else if (!isYourTurn && displayX0[index] == "") {
        displayX0[index] = "X";
        fillBoxes++;
      }
      isYourTurn = !isYourTurn;
      _checkwinner();
    });
  }

  void _checkwinner() {
    if (displayX0[0] == displayX0[1] &&
        displayX0[0] == displayX0[2] &&
        displayX0[0] != "") {
      setState(() {
        resultDeclaration = 'Player ${displayX0[0]} Wins!';
        updateScore(displayX0[0]);
      });
    } else {}

    if (displayX0[3] == displayX0[4] &&
        displayX0[3] == displayX0[5] &&
        displayX0[3] != "") {
      setState(() {
        resultDeclaration = 'Player ${displayX0[3]} Wins!';
        updateScore(displayX0[3]);
      });
    } else {}

    if (displayX0[6] == displayX0[7] &&
        displayX0[6] == displayX0[8] &&
        displayX0[6] != "") {
      setState(() {
        resultDeclaration = 'Player ${displayX0[6]} Wins!';
        updateScore(displayX0[6]);
      });
    } else {}

    if (displayX0[0] == displayX0[3] &&
        displayX0[0] == displayX0[6] &&
        displayX0[0] != "") {
      setState(() {
        resultDeclaration = 'Player ${displayX0[0]} Wins!';
        updateScore(displayX0[0]);
      });
    } else {}
    if (displayX0[1] == displayX0[4] &&
        displayX0[1] == displayX0[7] &&
        displayX0[1] != "") {
      setState(() {
        resultDeclaration = 'Player ${displayX0[1]} Wins!';
        updateScore(displayX0[1]);
      });
    } else {}

    if (displayX0[2] == displayX0[5] &&
        displayX0[2] == displayX0[8] &&
        displayX0[2] != "") {
      setState(() {
        resultDeclaration = 'Player ${displayX0[2]} Wins!';
        updateScore(displayX0[2]);
      });
    } else {}

    if (displayX0[0] == displayX0[4] &&
        displayX0[0] == displayX0[8] &&
        displayX0[0] != "") {
      setState(() {
        resultDeclaration = 'Player ${displayX0[0]} Wins!';
        updateScore(displayX0[0]);
      });
    } else {}
    if (displayX0[6] == displayX0[4] &&
        displayX0[6] == displayX0[2] &&
        displayX0[6] != "") {
      setState(() {
        resultDeclaration = 'Player ${displayX0[6]} Wins!';
        updateScore(displayX0[6]);
      });
    } else {}

    if (!winnerfound && fillBoxes == 9) {
      setState(() {
        resultDeclaration = 'Nobody Won!';
      });
    }
  }

  void updateScore(String winner) {
    setState(() {
      if (winner == '0') {
        oScore++;
      } else if (winner == 'X') {
        xScore++;
      }
      winnerfound = true;
    });


  }

  void _clearboard() {

    setState(() {

      for(int i =0;i<9;i++){
        displayX0[i]='';
      }
      resultDeclaration='';
    });
    fillBoxes=0;
  }



}
