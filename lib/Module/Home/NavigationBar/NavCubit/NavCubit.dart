
import 'dart:async';
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
  late Timer timer;
  int time1 = 0;
  int time2 = 0;
  int time3 = 0;
  int time4 = 0;
  int time5 = 0;
  int time6 = 0;

  void startTimer1 (){

    timer = Timer.periodic(const Duration(seconds: 1) , (t) {
      emit(TimerState());
      time1 = time1 +1;
      if(time1==45) {
        timer.cancel();
        emit(ZeroTimerState());
      }

      });
  }
void zeroTimer1(){
  timer.cancel();
  emit(ZeroTimerState());
}

  void startTimer2 (){

    timer = Timer.periodic(const Duration(seconds: 1) , (t) {
      emit(TimerState2());
      time2 = time2 +1;
      if(time2==45) {
        timer.cancel();
        emit(ZeroTimerState2());
      }

    });
  }
  void zeroTimer2(){
    timer.cancel();
    emit(ZeroTimerState2());
  }

  void startTimer3 (){

    timer = Timer.periodic(const Duration(seconds: 1) , (t) {
      emit(TimerState());
      time3 = time3 +1;
      if(time3==60) {
        timer.cancel();
        emit(ZeroTimerState3());
      }

    });
  }
  void zeroTimer3(){
    timer.cancel();
    emit(ZeroTimerState3());
  }

  void startTimer4 (){

    timer = Timer.periodic(const Duration(seconds: 1) , (t) {
      emit(TimerState());
      time4 = time4 +1;
      if(time4==45) {
        timer.cancel();
        emit(ZeroTimerState4());
      }

    });
  }
  void zeroTimer4(){
    timer.cancel();
    emit(ZeroTimerState4());
  }

  void startTimer5 ()
  {

    timer = Timer.periodic(const Duration(seconds: 1) , (t) {
      emit(TimerState());
      time5 = time5 +1;
      if(time5==45) {
        timer.cancel();
        emit(ZeroTimerState5());
      }

    });
  }
  void zeroTimer5(){
    timer.cancel();
    emit(ZeroTimerState5());
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