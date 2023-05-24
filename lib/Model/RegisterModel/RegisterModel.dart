//
//
//
//
// class RegisterModel {
//
//   String? $id;
//   String ?firstName;
//   String ?status;
//   String ?lastName;
//   String ?email;
//   String ?address;
//   String ?password;
//   String ? confirmPassword;
//   String ?phone;
//   String ?token;
//
// RegisterModel.fromJson(Map <String,dynamic> model){
//     $id = model[''];
//     status = model["status"];
//     firstName = model["firstName"];
//     lastName = model["lastName"];
//     email = model["email"];
//     address = model["address"];
//     password = model["Password"];
//     confirmPassword = model["confirmPassword"];
//     phone = model["phone"];
//     token = model["id"] ;
//   }
//
// }

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
    password = json ['password'];
    phone = json ['phone'];
    img = json ['image'];
    emailVerified = json ['isEmailVerified'];
  }

  Map <String ,dynamic> mapUser (){
    return {
      'name' : name,
      'email' : email,
      'password' : password,
      'uid' : uID,
      'phone' : phone,
      'image' : img,
      'bio' : bio,
      'isEmailVerified' : emailVerified,
    };
  }

}