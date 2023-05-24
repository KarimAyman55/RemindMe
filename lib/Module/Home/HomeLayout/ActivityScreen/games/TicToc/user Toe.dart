import 'package:flutter/material.dart';
import 'package:remindme/Module/Home/HomeLayout/ActivityScreen/games/TicToc/playing%20Screen.dart';


class UserAsk extends StatefulWidget {
  UserAsk({Key? key}) : super(key: key);

  @override
  State<UserAsk> createState() => _UserAskState();
}

class _UserAskState extends State<UserAsk> {
  String X = 'X';
  String O = 'O';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: const Color.fromRGBO(65, 203, 191, 20),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'janna',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Select Your Self..',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'janna',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
            width: 20,
          ),
          Center(
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PlayingScreen(),
                      settings: RouteSettings(arguments: X),
                    ),
                  );
                },
                child: const Text(
                  ' X ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'janna',
                  ),
                )),
          ),
          const SizedBox(
            height: 30,
            width: 20,
          ),
          Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PlayingScreen(),
                    settings: RouteSettings(arguments: O),
                  ),
                );
              },
              child: const Text(
                ' O ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'janna',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
