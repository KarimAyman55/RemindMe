
abstract class MainLoginStates{}
class InitialLoginStates extends MainLoginStates{}
class LoadLoginStates extends MainLoginStates{}
class ErrorLoginStates extends MainLoginStates{
  String error;
  ErrorLoginStates(this.error);
}
class SuccessLoginStates extends MainLoginStates{
  final String? uID;
   SuccessLoginStates(this.uID,);



}
