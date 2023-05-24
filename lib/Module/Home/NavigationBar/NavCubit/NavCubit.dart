
import 'dart:core';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/Shared/Network/Remote/SharedPre/Shared_Pre.dart';
import '../../HomeLayout/ActivityScreen/Activity.dart';
import '../../HomeLayout/HomeScreen/Home.dart';
import '../../HomeLayout/TasksScreen/Tasks.dart';
import 'VavStates.dart';

class NavCubit extends Cubit<NavMainStates>{
  NavCubit () : super (NavInit());
  static NavCubit get(context) => BlocProvider.of(context);


  List  screens =[
     Home(),
     Activity(),
    Tasks(),
  ]    ;
  int val = 0;
  void changeNav (index){
    val =index;
    emit(NavBottomChange());
  }

  bool selectMode = false;
void mode ( { bool ? isFromShared }
){
  if ( isFromShared != null ){
    selectMode = isFromShared;
    emit(ModeState());
  }
  else {
    selectMode = !selectMode;
    CacheHelper.putData("isDark", selectMode).then((value) {

      emit(ModeState());
});
   }

}
}