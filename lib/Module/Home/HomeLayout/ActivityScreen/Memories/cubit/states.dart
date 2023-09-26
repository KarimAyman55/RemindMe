abstract class MainMemoryStates{}
class InitialMemoryStates extends MainMemoryStates{}
class LoadMemoryStates extends MainMemoryStates{}
class SuccessMemoryStates extends MainMemoryStates{}
class ErrorMemoryStates extends MainMemoryStates{
  String error;
  ErrorMemoryStates(this.error);
}

class GallerySuccessState extends MainMemoryStates{}
class GalleryErrorState extends MainMemoryStates{
}
class MemoryUploadSuccessState extends MainMemoryStates{}
class LoadingMemoryUploadState extends MainMemoryStates{}
class MemoryUploadErrorState extends MainMemoryStates{
  String error;
  MemoryUploadErrorState(this.error);

}
class LoadGetMemoryStates extends MainMemoryStates{}
class SuccessGetMemoryStates extends MainMemoryStates{}
class ErrorGetMemoryStates extends MainMemoryStates{
  String error;
  ErrorGetMemoryStates(this.error);
}
class RemoveSuccessMemoryPicStates extends MainMemoryStates{}
class RemoveLoadMemoryPicStates extends MainMemoryStates{}
