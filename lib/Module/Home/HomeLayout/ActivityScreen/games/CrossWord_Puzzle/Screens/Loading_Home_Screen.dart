import 'package:flutter/material.dart';
import '../CrossWord_Model/Level_Select_Model.dart';
import '../Data/Level_SelctedData.dart';
import 'level_select_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoadingHomeScreen extends StatefulWidget {
  @override
  _LoadingHomeScreenState createState() => _LoadingHomeScreenState();
}

class _LoadingHomeScreenState extends State<LoadingHomeScreen> {
  bool ? is_locked_lv2;int ? rate_lv1;int ? rate_lv2;

  @override
  void initState() {
    ReadLevelSelectPrefsData();
  }

  Future ReadLevelSelectPrefsData() async{
    final prefs = await SharedPreferences.getInstance();
    final bool _is_locked_lv2 = prefs.getBool('is_locked_lv2') ?? true;

    final int _rate_lv1 = prefs.getInt('rate_lv1') ?? 0;
    final int _rate_lv2 = prefs.getInt('rate_lv2') ?? 0;

    setState((){
      is_locked_lv2 = _is_locked_lv2;rate_lv1=_rate_lv1;rate_lv2=_rate_lv2;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<LevelSelectModel> level_select_data = generateLevelSelectData(
      rateLv1:rate_lv1,rateLv2:rate_lv2,isLockedLv2:is_locked_lv2,);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LevelSelectScreen(levelSelectData: level_select_data),),
    );
    return Container(

    );
  }
}