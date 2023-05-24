class MemoriesModel {
  String ? title;
  String?  uID;
  dynamic memoryPic;
  MemoriesModel ({
    this.title,
    this.uID,
    this.memoryPic
  }      );
  MemoriesModel.fromJson(Map<String,dynamic> json){
    title = json ['title'];
    uID = json ['uid'];
    memoryPic = json ['memoryPic'];
    }

  Map <String ,dynamic> mapUser (){
    return {
      'uid' : uID,
      'memoryPic' : memoryPic,
      'title' : title,
     };
  }

}