// DropdownButton<String>(
// isExpanded: true,
// value: selectedIndexCountry,
// style: TextStyle(fontSize: 14, color: Colors.blueGrey),
// icon: Icon(Icons.keyboard_arrow_down),
// underline: Container(color: Colors.transparent),
// onChanged: (String? newValue) {
// setState(() {
// selectedIndexCountry = newValue!;
// });
// },
// items: listOfCountry.map((country) {
// return DropdownMenuItem(
// child: Container(
// margin: EdgeInsets.only(left: 4, right: 4),
// child: Text(country,
// style: TextStyle(
// fontSize: 14, color: Colors.blueGrey)),
// ),
// value: country,
// );
// }).toList(),
// )),
// ),
// ],
// ),),
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:remindme/Shared/Split/Components.dart';
import 'package:remindme/Shared/Styles/Icons.dart';

import '../../Module/Home/NavigationBar/Navigation_Screen.dart';
import '../../Module/LoginPage/LoginScreen.dart';
class Test extends StatefulWidget {
  const Test ({Key? key}) : super(key: key);

  @override
  State<Test> createState() => TestState();
}

class TestState extends State<Test> {
  bool val=false;
  bool val1=false;
  bool val2=false;
  bool val3=false;
  bool val4=false;
  bool val5=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            pushAndFinish(context, const LoginScreen());
          },icon: const Icon(IconBroken.arrowLeft_3),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 16),
            child: Column(
              children: [
                const  Text(
                    "# Through Test you can Know That You have Alzheimer or just Weakly memory.  \n do 'right' mark on different boxes to answer...",
                    style: TextStyle(color:Colors.indigo),maxLines: 3,overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4,),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "1) Do you currently feel sad or depressed..?",
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,overflow: TextOverflow.ellipsis,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 30),
                        child: Container(
                          height: 18,
                          width: 19,
                          color: Colors.grey.shade300,

                          child: Checkbox(value: val, onChanged: (v){
                            setState(() {
                              val=v!;
                            });
                          },activeColor: Colors.orange,),
                        ),
                      )
                    ],
                  ),

                ),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "2) Are you heading in some familiar territory..?",style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(width: 30,),
                      Container(
                        height: 18,
                        width: 19,
                        color: Colors.grey.shade300
                        ,

                        child: Checkbox(value: val1, onChanged: (v){
                          setState(() {
                            val1=v!;
                          });
                        },activeColor: Colors.orange,),
                      )
                    ],
                  ),

                ),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "3) Have you had any change in your personality..?",
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 25),

                        child: Container(
                          height: 18,
                          width: 19,
                          color: Colors.grey.shade300,
                          child: Checkbox(value: val2, onChanged: (v){
                            setState(() {
                              val2=v!;
                            });
                          },activeColor: Colors.orange,),
                        ),
                      )
                    ],
                  ),

                ),
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "4) Do you feel better when you talk and bring back memories..?",style:
                        Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,overflow: TextOverflow.ellipsis,),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        height: 18,
                        width: 19,
                        color: Colors.grey.shade300,

                        child: Checkbox(value: val3, onChanged: (v){
                          setState(() {
                            val3=v!;
                          });
                        },activeColor: Colors.orange,),
                      )
                    ],
                  ),

                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            "5) Have you encountered difficulties in dealing with people ..?",style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 2,overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(width: 20,),
                      Card(
                        elevation: 0,
                        child: Container(
                          height: 18,
                          width: 19,
                          color: Colors.grey.shade300
                          ,


                          child: Checkbox(value: val4, onChanged: (v){
                            setState(() {
                              val4=v!;
                            });
                          },activeColor: Colors.orange,),
                        ),
                      )
                    ],
                  ),

                ),
                const SizedBox(height:16,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            "6) Do you have more difficulties doing everyday activities ..?",style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 2,overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(width: 20,),
                      Card(
                        elevation: 0,
                        child: Container(
                          height: 18,
                          width: 19,
                          color: Colors.grey.shade300
                          ,


                          child: Checkbox(value: val5, onChanged: (v){
                            setState(() {
                              val5=v!;
                            });
                          },activeColor: Colors.orange,),
                        ),
                      )
                    ],
                  ),

                ),
                const SizedBox(height: 30,),
                Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    color:Colors.redAccent
                    ,child: MaterialButton(onPressed: (){
                  if(val & val1 & val2 & val3 & val4 & val5  ) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) =>
                            AlertDialog(
                              title: const Text(
                                " you have Alzheimer diseases ):  , Please Click to do our activities ",
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    pushAndFinish(context, const NavigationBarScreen());
                                  },
                                  child: const Text("Go"),
                                )
                              ],
                            ));
                  }


                  else if ( val1 ||  val2 || val3 || val4 || val5   )
                  {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            " just weakly memory , not Alzheimer disease  ",
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);

                              },
                              child: const Text("back"),
                            )
                          ],
                        )); }

                  else if (! val & !val1 & !val2 & !val3 & !val4 & !val5 || val )
                  {
                    Fluttertoast.showToast(msg: " Please Answer First , Or put an other right mark  ");}

                },
                  child: Text(" Test Result ",style: Theme.of(context).textTheme.titleMedium,),)),
                const SizedBox(height: 60,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

