import 'package:remindme/Model/RegisterModel/RegisterModel.dart';

abstract class MainRegisterStates{}
class InitialRegisterStates extends MainRegisterStates{}
class LoadRegisterStates extends MainRegisterStates{}
class ErrorRegisterStates extends MainRegisterStates{
   String error;
   ErrorRegisterStates(this.error);
}
class SuccessRegisterStates extends MainRegisterStates{
   // final RegisterUserModel registerModel;
   // SuccessRegisterStates(this.registerModel);

}
class RegisterAuthLoadingState extends MainRegisterStates{}
class RegisterAuthSuccessState extends MainRegisterStates{
  // RegisterAuthSuccessState(String uid);
}
class RegisterAuthFailState extends MainRegisterStates{
   String error;
   RegisterAuthFailState(this.error);

}
