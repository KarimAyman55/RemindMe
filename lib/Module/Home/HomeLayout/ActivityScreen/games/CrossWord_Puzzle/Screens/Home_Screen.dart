//import 'package:geopattern_flutter/geopattern_flutter.dart';
import 'package:flutter/material.dart';
import 'package:remindme/Shared/Styles/Icons.dart';
import '../CrossWord_Model/Level_Select_Model.dart';
import '../Data/Level_SelctedData.dart';
import 'level_select_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool? isLockedLv2;int ? rateLv1;int ?rate_lv2;

  @override
  void initState() {
    ReadLevelSelectPrefsData();
  }


  Future ReadLevelSelectPrefsData() async{
    final prefs = await SharedPreferences.getInstance();
    final bool _isLockedLv2 = prefs.getBool('isLockedLv2') ?? true;

    final int _rateLv1 = prefs.getInt('rateLv1') ?? 0;
    final int _ratelv2 = prefs.getInt('rate_lv2') ?? 0;

    setState((){
      isLockedLv2 = _isLockedLv2;rateLv1=_rateLv1;rate_lv2=_ratelv2;
    });
  }


  @override
  Widget build(BuildContext context) {
    // final hash = sha1.convert(utf8.encode("flutter")).toString();
    List<LevelSelectModel> level_select_data = generateLevelSelectData(
      rateLv1:rateLv1,rateLv2:rate_lv2,isLockedLv2:isLockedLv2,);

    return  SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: MaterialButton(onPressed: (){
                Navigator.pop(context);
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

            ElevatedButton(
             // color: Colors.red,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelSelectScreen(levelSelectData: level_select_data),),
                );
              },

              child: const Text("Play",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );

  }
}








