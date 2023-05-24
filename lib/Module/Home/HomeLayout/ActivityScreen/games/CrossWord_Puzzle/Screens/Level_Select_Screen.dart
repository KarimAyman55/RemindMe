
import 'package:flutter/material.dart';
import 'package:remindme/Shared/Styles/Icons.dart';

import '../CrossWord_Model/Level_Select_Model.dart';
import 'Level_Screen.dart';

class LevelSelectScreen extends StatefulWidget {

  final dynamic levelSelectData;
  const LevelSelectScreen({super.key, this.levelSelectData});

  @override
  LevelSelectScreenState createState() => LevelSelectScreenState();
}

class LevelSelectScreenState extends State<LevelSelectScreen>  {

  _buildLevelCards(BuildContext context,int id,String title,String description,var level_data,int rate,bool is_locked){

    return Card(
      margin: const EdgeInsets.all(10.0),
      color:Colors.red,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [


          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white,

              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              !is_locked ? MaterialButton(
                color:Colors.blueGrey,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LevelScreen(id:id,level_data:level_data,
                        title:'$description')),
                  );
                },
                child: const Text('PLAY'),
              ):
              Container(
                  padding:const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      color:Colors.grey,
                      shape:BoxShape.circle
                  ),
                  child:const Icon(Icons.lock,color: Colors.white)
              ),
            ],
          ),

        ],
      ),

    );
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('Level Select'.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium,
              ),

            ],
          ), ),
        body: Container(

            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
            child:GridView.count(
                padding:const EdgeInsets.all(10.0),
                crossAxisCount: 2,
                children:List.generate(widget.levelSelectData.length, (index) {
                  LevelSelectModel level = widget.levelSelectData[index];
                  String? title = level.title;
                  String ?description = level.description;
                  int? id = level.id;
                  var levelData = level.levelData;
                  int ? rate = level.rate;
                  bool ? isLocked = level.isLocked;
                  return _buildLevelCards(context,id!, title!,description!,levelData,rate!,isLocked!);
                })
            )

        )

    );

  }
}