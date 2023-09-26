
class RegisterUserModel {
  String ? name;
  String ? bio;
  String ? email;
  String?  uID;
  String ? phone;
  String ? password;
  bool ? emailVerified;
  dynamic img;
  RegisterUserModel ({
    this.name,
    this.bio,
    this.email,
    this.uID,
    this.phone,
    this.password,
    this.emailVerified,
    this.img
  }      );
  RegisterUserModel.fromJson(Map<String,dynamic> json){
    name = json ['name'];
    bio = json ['bio'];
    email = json ['email'];
    uID = json ['uid'];
    phone = json ['phone'];
    img = json ['image'];
    emailVerified = json ['isEmailVerified'];
  }

  Map <String ,dynamic> mapUser (){
    return {
      'name' : name,
      'email' : email,
      'uid' : uID,
      'phone' : phone,
      'image' : img,
      'bio' : bio,
      'isEmailVerified' : emailVerified,
    };
  }

}