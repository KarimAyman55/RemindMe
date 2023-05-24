import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:remindme/Module/Home/HomeLayout/ActivityScreen/Activity.dart';
import 'package:remindme/Shared/Styles/Icons.dart';

import '../../../../../../Shared/Split/Components.dart';



int level = 8;

class Home extends StatefulWidget {
  final int size;
  const Home({ this.size = 8}) ;
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  List<bool> cardFlips = [];
  List<String> data = [];
  int previousIndex = -1;
  bool flip = false;

  int time = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.size; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
      cardFlips.add(true);
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(i.toString());
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(i.toString());
    }
    startTimer();
    data.shuffle();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {

      setState(() {
        time = time + 1;

        if(time==60)
          {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: const Text(
                    " Game Over ",
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        time==0;
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Home(
                              size: level,
                            ),
                          ),
                        );          },
                      child: const Text("back"),
                    )
                  ],
                ));


          }

      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MaterialButton(onPressed: (){
                        pushAndFinish(context,const Activity());
                      },
                        child:  Row(
                          children:  [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(" Back ",style: Theme.of(context).textTheme.titleMedium,),
                                const SizedBox(height: 1.2,),
                                const Icon(IconBroken.arrowLeft_3),
                              ],
                            )
                          ],
                        ),

                      ),
                    ),
                    Text(
                      "$time",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Time \n 60",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        level = 8;
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Home(
                              size: level,
                            ),
                          ),
                        );
                      },
                      child: const Text("RESTART"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) => FlipCard(
                    key: cardStateKeys[index],
                    onFlip: () {
                      if (!flip) {
                        flip = true;
                        previousIndex = index;
                      } else {
                        flip = false;
                        if (previousIndex != index) {
                          if (data[previousIndex] != data[index]) {
                            cardStateKeys[previousIndex]
                                .currentState
                                ?.toggleCard();
                            previousIndex = index;
                          } else {
                            cardFlips[previousIndex] = false;
                            cardFlips[index] = false;
                            print(cardFlips);
                            if (cardFlips.every((t) => t == false)) {
                              print("Won");
                              timer.cancel();
                              showResult();
                            }
                          }
                        }
                      }
                    },
                    direction: FlipDirection.HORIZONTAL,
                    flipOnTouch: true,
                    front: Container(
                      margin: const EdgeInsets.all(4.0),
                      color: Colors.deepOrange[100],
                    ),
                    back: Container(
                      margin: const EdgeInsets.all(4.0),
                      color: Colors.deepOrange,
                      child: Center(
                        child: Text(
                          "${data[index]}",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ),
                  ),
                  itemCount: data.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          "You won!",
          style: Theme.of(context).textTheme.headline3,
        ),
        content: Text("Time: $time seconds"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Home(
                    size: level,
                  ),
                ),
              );
              if (level >= 28) {
                level = 8;
              } else {
                level += 4;
              }
            },
            child: const Text("NEXT"),
          )
        ],
      ),
    );
  }
}