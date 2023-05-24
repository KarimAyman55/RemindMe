import 'package:remindme/Model/RegisterModel/RegisterModel.dart';

import 'LoginStates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginCubit extends Cubit <MainLoginStates>{

  LoginCubit() : super(InitialLoginStates());

  static LoginCubit get(context) => BlocProvider.of(context);
RegisterUserModel ? registerUserModel ;
  Future <void> userLogin ({

    required String email,
    required String pass,
  }
      ) async{
    emit(LoadLoginStates());
    await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass)
        .then((value)
    {
      emit(SuccessLoginStates(value.user!.uid,));
      print(value.user?.email);
    }

    ).catchError((e){

      emit(ErrorLoginStates(e.toString()));
      print(e);
    })   ;
  }
}