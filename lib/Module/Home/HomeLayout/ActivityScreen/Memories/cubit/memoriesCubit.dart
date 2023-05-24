import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remindme/Model/MemoriesModel/MemoriesModel.dart';
import 'package:remindme/Model/RegisterModel/RegisterModel.dart';
import 'package:remindme/Module/Home/HomeLayout/ActivityScreen/Memories/cubit/states.dart';
import '../../../../../../Shared/Split/Constants/Constants.dart';

class MemoryCubit extends Cubit<MainMemoryStates> {
  MemoryCubit() : super(InitialMemoryStates());

  static MemoryCubit get(context) => BlocProvider.of(context);
  RegisterUserModel ? registerUserModel;
  MemoriesModel? memoriesModel;
  dynamic  memoryPic  ;
  final picker = ImagePicker();
  //String ? picUrl;

  Future<void> getImg () async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile !=null)
    {
      memoryPic = File(pickedFile.path);
      emit(GallerySuccessState());
    }
    else {
      print("img not founded");
      emit(GalleryErrorState());

    }

  }

  void uploadMemory(
      String ? title,
      ) async{
    emit(LoadingMemoryUploadState());
    FirebaseStorage.instance.ref().child("Memories/${Uri.file(memoryPic.path).pathSegments.last}")
        .putFile(memoryPic).then((v)

    {

      v.ref.getDownloadURL().then((value) {
        //emit(MemoryUploadSuccessState());
        //picUrl =value;
        createMemories(
            title:title ,
            memoryPic: value
        );

      });

    }).catchError((onError){
      //emit(MemoryUploadErrorState(onError.toString()));
    });}

  void createMemories({
    String ? memoryPic,
    String ? title,
  }) {
   emit(LoadMemoryStates());
    MemoriesModel model = MemoriesModel(
      title: title,
      memoryPic: memoryPic??"",
      uID: id,
    );
   emit(SuccessMemoryStates());

   FirebaseFirestore.instance.collection("Memories").add(model.mapUser()).then((value) {

    }).catchError((e) {
      print(e);
      emit(ErrorMemoryStates(e.toString()));
    });
  }




  List <MemoriesModel> memories =[];

  void getMemories (){

    emit(LoadGetMemoryStates());
    FirebaseFirestore.instance.collection("Memories").snapshots().listen((event) {
memories =[];
      event.docs.forEach((element) {
        memories.add(MemoriesModel.fromJson(element.data()) );
        emit(SuccessGetMemoryStates());

      });

    });

  }
void removePic(pic){

  FirebaseFirestore.instance.collection("Memories").snapshots().listen((event) {
    event.docs.forEach((element) {
      memories.remove(pic);
      emit(RemoveMemorPicyStates());

    });
});

   }

}