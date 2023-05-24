import '../CrossWord_Model/Level_Select_Model.dart';

import 'Level_Data.dart';


List<LevelSelectModel> generateLevelSelectData({
  rateLv1,rateLv2,rateLv3,rateLv4,rateLv5,rateLv6,rateLv7,rateLv8,
  isLockedLv2,isLockedLv3,isLockedLv4,isLockedLv5,isLockedLv6,isLockedLv7,isLockedLv8,

}){
  List<LevelSelectModel> levelSelectData;

  return levelSelectData = [
    LevelSelectModel(
      id: 1,
      title:'Level one',
      description:'space',
      levelData:levelData[7],
      rate:rateLv1,
      isLocked:false,
    ),
    LevelSelectModel(
      id: 2,
      title:'Level two',
      description:'english',
      levelData:levelData[6],
      rate:rateLv2,
      isLocked:false,
    ),

  ];
}


