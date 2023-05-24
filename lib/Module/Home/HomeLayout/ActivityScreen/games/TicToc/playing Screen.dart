import 'dart:developer';
import 'package:flutter/material.dart';

class PlayingScreen extends StatefulWidget {
  const PlayingScreen({Key? key}) : super(key: key);

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  int scoreX = 0;
  int scoreO = 0;
  bool turnOfO = false;
  String playersChoice = '';
  String friend = '';
  int filledBoxes = 0;
  List<String> xOrOList = [
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
  @override
  Widget build(BuildContext context) {
    String choice = ModalRoute.of(context)!.settings.arguments as String;
    log(choice);
    if (choice == 'X') {
      playersChoice = 'X';
      friend = 'O';
    } else if (choice == 'O') {
      playersChoice = 'O';
      friend = 'X';
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(' play with your friend ',
            style: TextStyle(fontFamily: 'janna', fontSize: 25)),
        backgroundColor: const Color.fromRGBO(190, 201, 223, 20),
        actions: [
          IconButton(
            onPressed: () {
              clearBoard();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(22, 78, 99, 20),
      body: Column(
        children: [
          buildPointsTable(),
          buildGrid(),
          buildTurn(),
        ],
      ),
    );
  }

  // Build Grid
  Widget buildGrid() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
        itemCount: xOrOList.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              tappedIndex(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Center(
                child: Text(
                  xOrOList[index],
                  style: TextStyle(
                    color: xOrOList[index] == "X" ? Colors.white : Colors.red,
                    fontSize: 25,
                    fontFamily: 'janna',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

// Tapping the index
  void tappedIndex(int index) {
    setState(
          () {
        if (turnOfO && xOrOList[index] == '') {
          xOrOList[index] = 'O';
          filledBoxes += 1;
        } else if (!turnOfO && xOrOList[index] == '') {
          xOrOList[index] = 'X';
          filledBoxes += 1;
        }
        turnOfO = !turnOfO;
        checkWinner();
      },
    );
  }

// Building the user's turn
  Widget buildTurn() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          turnOfO ? 'Turn Of O' : 'Turn of X',
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'janna',
            fontSize: 20,
          ),
        ),
      ),
    );
  }

// Clear the board
  void clearBoard() {
    setState(
          () {
        for (var i = 0; i < xOrOList.length; i++) {
          xOrOList[i] = '';
        }
      },
    );
    filledBoxes = 0;
  }

// Build The points table
  Widget buildPointsTable() {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Your : $playersChoice',
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'janna',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    playersChoice == 'X'
                        ? scoreX.toString()
                        : scoreO.toString(),
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontFamily: 'janna',
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    ' friend: $friend',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'janna',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    friend == 'O' ? scoreO.toString() : scoreX.toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'janna',
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Check winner
  void checkWinner() {
    // Checking first row
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      showWinDialog(context, 'You win', xOrOList[0]);
      return;
    }

    // checking second row
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      showWinDialog(context, 'You win', xOrOList[3]);
      return;
    }

    // checking third row
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      showWinDialog(context, 'You win', xOrOList[6]);
      return;
    }

    // checking first column
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      showWinDialog(context, 'You win', xOrOList[0]);
      return;
    }

    // checking second column
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      showWinDialog(context, 'You win', xOrOList[1]);
      return;
    }

    // checking third column
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      showWinDialog(context, 'You win', xOrOList[2]);
      return;
    }

    // Checking diagonally

    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      showWinDialog(context, 'You Win', xOrOList[0]);
      return;
    }

    // Chceking diagonnaly

    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      showWinDialog(context, 'You win', xOrOList[2]);
      return;
    }

    if (filledBoxes == 9) {
      showWinDialog(context, 'Its A Draw', '');
      scoreO += 1;

    }
  }

  // Show winning or draw dialog
  Future<void> showWinDialog(
      BuildContext context,
      String title,
      String winner,
      ) {
    if (winner == 'O') {
      scoreO += 1;
    } else {
      scoreX += 1;
    }
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: winner == ''
              ? const Text('The Match ended in a Draw')
              : Text(
            'The Winner is ${winner.toUpperCase()}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text('again'),
            ),
          ],
        );
      },
    );
  }
}
