import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remindme/Model/ChatModel/ChatModel.dart';
import '../../../Model/RegisterModel/RegisterModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Shared/Split/Constants/Constants.dart';
import 'RegisterStates.dart';

class RegisterCubit extends Cubit<MainRegisterStates>{
  RegisterCubit() : super(InitialRegisterStates());

   static RegisterCubit get(context) => BlocProvider.of(context);

   RegisterUserModel ? registerModel  ;


  void userRegister ({
    String ?name,
    String ?email,
    String ?password,
    String ?img,
    String ?phone,
    String? uID,
  }){
    emit(LoadRegisterStates());

    RegisterUserModel model = RegisterUserModel(
        name :name,
         email : email
        , password :password
        ,phone:phone,
        uID:uID,
      bio: "write bio",
      img: img?? "" ,
      emailVerified: false,
    );
    FirebaseFirestore.instance.collection("userRegister").doc(uID).set(model.mapUser()).then((value) {

      emit(SuccessRegisterStates());
      print (uID);

    }).catchError((e){
      print(e);
      //emit(ErrorRegisterStates(e.toString()));
    });
  }

  Future <void> userRegisterAuth ({

    required String email,
    required String pass,
    String? phone,
    String? name,

  }) async {
    emit(RegisterAuthLoadingState());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then((value)
    {
      userRegister
        (
          email: email,
          uID: value.user!.uid,
          phone: phone,
          password: pass,
          name: name,
         );

      emit(RegisterAuthSuccessState());
    }

    ).catchError((e){
      print(e);
      emit(RegisterAuthFailState(e.toString()));
    })   ;
  }

  List <RegisterUserModel> users =[];

  void getAllUsers (){
    users =[];
    emit(LoadGetUsersStates());

    FirebaseFirestore.instance.collection("userRegister").get().then((value)  {
      value.docs.forEach((element) {
    if (element.data()['uid'] != id) {
      users.add(RegisterUserModel.fromJson((element.data())));
    }
      emit(SuccessGetUsersStates());
      });
    });


  }


  ChatModel? chatModel;
  void sendMessage ({
  String ? rId,
  String ? date,
  String ? text,
  }
      ){
    ChatModel model = ChatModel(
      rId: rId,
      text: text??"",
      date: date,
      sId: id,
    );
    FirebaseFirestore.instance.collection("userRegister").doc(id).collection("chats").doc(rId)
        .collection("messages").add(model.mapUser()).then((value) {
          value.collection("messages").orderBy("date");
          emit(SuccessMessageStates());
    }).catchError((e){
      emit(ErrorMessageStates(e));
    });

    FirebaseFirestore.instance.collection("userRegister").doc(model.rId).collection("chats").doc(id)
        .collection("messages").add(model.mapUser()).then((value) {

      emit(SuccessMessageStates());
    }).catchError((e){
      emit(ErrorMessageStates(e));
    });


  }

  List <ChatModel> messages =[];

  void getMessages ({
  String ?rId ,
}){
    emit(LoadGetMessageStates());
    FirebaseFirestore.instance.collection("userRegister").doc(id).collection("chats").doc(rId)
        .collection("messages").orderBy("dateTime").snapshots().listen((event) {
      messages =[];
      event.docs.forEach((element) {
        messages.add(ChatModel.fromJson(element.data()) );

      });
      emit(SuccessGetMessageStates());

    });

  }
  List<RegisterUserModel> searchList =[];
  void search(String name  ){
    FirebaseFirestore.instance.collection("userRegister")
        .where("name",isGreaterThanOrEqualTo: name).get().then((value) {
      value.docs.forEach((element){
        if (element.data()['uid'] != id) {
          searchList = [];
          searchList.add(RegisterUserModel.fromJson(element.data()));
          emit(SuccessSearchStates());

        }
      });
    }).catchError((e){
      print(e.toString());
    });


  }

}