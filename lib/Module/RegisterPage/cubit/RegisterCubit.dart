import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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


}