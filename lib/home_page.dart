import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///ALL THE FUNCTIONS REQUIRED FOR THE GAME LOGIC.....
  List<String> displayXandO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  bool itsOhTurn = true;
  int playerOhScore = 0;
  int playerExScore = 0;
  int filledBox = 0;
  void _onTapped(int index) {
    setState(() {
      if (itsOhTurn && displayXandO[index] == '') {
        displayXandO[index] = 'O';
        filledBox++;
        itsOhTurn = false;
      }
      if (!itsOhTurn && displayXandO[index] == '') {
        displayXandO[index] = 'X';
        filledBox++;
        itsOhTurn = true;
      }
    });
    _checkWinner();
  }

  void _checkWinner() {
    if (displayXandO[0] == displayXandO[1] &&
        displayXandO[0] == displayXandO[2] &&
        displayXandO[0] != '') {
      _showWinnerDialog(displayXandO[0]);
    } else if (displayXandO[3] == displayXandO[4] &&
        displayXandO[3] == displayXandO[5] &&
        displayXandO[3] != '') {
      _showWinnerDialog(displayXandO[3]);
    } else if (displayXandO[6] == displayXandO[7] &&
        displayXandO[6] == displayXandO[8] &&
        displayXandO[6] != '') {
      _showWinnerDialog(displayXandO[6]);
    } else if (displayXandO[0] == displayXandO[3] &&
        displayXandO[0] == displayXandO[6] &&
        displayXandO[0] != '') {
      _showWinnerDialog(displayXandO[0]);
    } else if (displayXandO[1] == displayXandO[4] &&
        displayXandO[1] == displayXandO[7] &&
        displayXandO[1] != '') {
      _showWinnerDialog(displayXandO[1]);
    } else if (displayXandO[2] == displayXandO[5] &&
        displayXandO[2] == displayXandO[8] &&
        displayXandO[2] != '') {
      _showWinnerDialog(displayXandO[2]);
    } else if (displayXandO[0] == displayXandO[4] &&
        displayXandO[0] == displayXandO[8] &&
        displayXandO[0] != '') {
      _showWinnerDialog(displayXandO[0]);
    } else if (displayXandO[6] == displayXandO[4] &&
        displayXandO[6] == displayXandO[2] &&
        displayXandO[6] != '') {
      _showWinnerDialog(displayXandO[6]);
    } else if (filledBox == 9) {
      _showDrawDialog();
    }
  }

  void _showWinnerDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'The WINNER is: Player ' + winner,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            RaisedButton(
              color: greenLight,
              textColor: whiteColor1,
              onPressed: () {
                _clearBoard();
                Navigator.pop(context);
              },
              child: const Text('Restart'),
            ),
          ],
        );
      },
    );
    setState(() {
      if (winner == 'O') {
        playerOhScore++;
      }
      if (winner == 'X') {
        playerExScore++;
      }
    });
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'DRAW',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            RaisedButton(
              color: greenLight,
              textColor: whiteColor1,
              onPressed: () {
                _clearBoard();
                Navigator.pop(context);
              },
              child: const Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXandO[i] = '';
      }
      filledBox = 0;
    });
  }

  ///BUILD METHOD....
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor1,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomRight: Radius.circular(18),
        //     bottomLeft: Radius.circular(18),
        //   ),
        // ),
        title: const Center(
          child: Text(
            'Tic Tac Toe',
            style: TextStyle(
              color: whiteColor1,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: blackColor1,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              _clearBoard();
            },
            icon: const Icon(
              Icons.refresh,
              color: greenLight,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 65, horizontal: 16),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      _onTapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: greyColor1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displayXandO[index],
                          style: TextStyle(
                            fontSize: 55,
                            color: displayXandO[index] == 'O'
                                ? blueLighter
                                : redColor1,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 22),
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(28),
                  topLeft: Radius.circular(28),
                ),
                color: blackColor1,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Player O',
                          style: TextStyle(
                            fontSize: 20,
                            color: whiteColor1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          playerOhScore.toString(),
                          style: const TextStyle(
                            fontSize: 22,
                            color: blueLighter,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Player X',
                          style: TextStyle(
                            fontSize: 20,
                            color: whiteColor1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          playerExScore.toString(),
                          style: const TextStyle(
                            fontSize: 22,
                            color: redColor1,
                          ),
                        ),
                      ],
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
}
