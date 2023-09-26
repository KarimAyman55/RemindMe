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
  String ? picUrl;

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

  void uploadMemory({
      String ? title,
      String ? date,}
      ) async{
    emit(LoadingMemoryUploadState());
    FirebaseStorage.instance.ref().child("Memories/${Uri.file(memoryPic.path).pathSegments.last}")
        .putFile(memoryPic).then((v)
    {
      v.ref.getDownloadURL().then((value) {
        picUrl =value;
        createMemories(
            title:title ,
            date:date ,
            memoryPic: value
        );

      });

    }).catchError((onError){
      //emit(MemoryUploadErrorState(onError.toString()));
    });}

  void createMemories({
    String ? memoryPic,
    String ? title,
    String ? date,
  }) {
   emit(LoadMemoryStates());
    MemoriesModel model = MemoriesModel(
      title: title,
      date: date,

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
  List <String> memoryId=[];

  void getMemories (){

    emit(LoadGetMemoryStates());
    FirebaseFirestore.instance.collection("Memories").orderBy("dateTime").snapshots().listen((event) {

      memories =[];
      event.docs.forEach((element) {
        if (element.data()['uid'] == id) {
          memories.add(MemoriesModel.fromJson(element.data()));
           memoryId.add(element.id);
        }
        emit(SuccessGetMemoryStates());
      });


    });

  }
  void removePost(String postId)  {
    FirebaseFirestore.instance
        .collection('Memories')
        .doc(postId)
        .delete()
        .then((value) {
      emit(RemoveSuccessMemoryPicStates());
    });

  }


}