class MemoriesModel {
  String ? title;
  String ? date;
  String?  uID;
  dynamic memoryPic;
  MemoriesModel ({
    this.title,
    this.date,
    this.uID,
    this.memoryPic
  }      );
  MemoriesModel.fromJson(Map<String,dynamic> json){
    title = json ['title'];
    uID = json ['uid'];
    date= json ['dateTime'];
    memoryPic = json ['memoryPic'];
    }

  Map <String ,dynamic> mapUser (){
    return {
      'uid' : uID,
      'memoryPic' : memoryPic,
      'title' : title,
      'dateTime' : date,

     };
  }

}