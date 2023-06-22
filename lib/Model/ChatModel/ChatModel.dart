class ChatModel {
  String ? rId;
  String?  sId;
  String?  text;
  String?  date;
  ChatModel ({
    this.rId,
    this.sId,
    this.date,
    this.text
  }      );
  ChatModel.fromJson(Map<String,dynamic> json){
    text = json ['text'];
    sId = json ['senderId'];
    rId = json ['receiverId'];
    date = json ['dateTime'];
    }

  Map <String ,dynamic> mapUser (){
    return {
      'text' : text,
      'senderId' : sId,
      'receiverId' : rId,
      'dateTime' : date,
    };
  }

}