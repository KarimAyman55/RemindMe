abstract class MainAppStates{}
 class InitialAppStates extends MainAppStates{}
class LoadUpdateStates extends MainAppStates{}
class SuccessUpdateStates extends MainAppStates{}
class ErrorUpdateStates extends MainAppStates{
  String error;
  ErrorUpdateStates(this.error);
}

class LoadGetStates extends MainAppStates{}
class ErrorGetStates extends MainAppStates{
  String error;
  ErrorGetStates(this.error);
}
class SuccessGetStates extends MainAppStates{
  // final AppUserModel registerModel;
  // SuccessGetStates(this.registerModel);

}
class ImageSuccessState extends MainAppStates{}
class ImageErrorState extends MainAppStates{
  String error;
  ImageErrorState(this.error);

}
class ImageUploadSuccessState extends MainAppStates{}
class ImageUploadErrorState extends MainAppStates{
  String error;
  ImageUploadErrorState(this.error);

}

