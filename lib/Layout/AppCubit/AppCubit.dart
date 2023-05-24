
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Model/RegisterModel/RegisterModel.dart';
import '../../../Shared/Split/Constants/Constants.dart';
import '../../Module/RegisterPage/cubit/RegisterStates.dart';
import 'AppCubitStates.dart';


class AppCubit extends Cubit<MainAppStates> {
  AppCubit() : super(InitialAppStates());

  static AppCubit get(context) => BlocProvider.of(context);

  RegisterUserModel ? model  ;
  dynamic  image   ;
  final picker = ImagePicker();

  Future<void> getImg () async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile !=null)
    {
      image = File(pickedFile.path);
      emit(ImageSuccessState());
    }
    else {
      print("img not founded");
    }


  }


  void uploadImage({
  String? name,
  String? phone,
}) async{

    FirebaseStorage.instance.ref().child("userRegister/${Uri.file(image.path).pathSegments.last}")
        .putFile(image).then((v)

    {
      v.ref.getDownloadURL().then((value) {
       userUpdate(
         name: name,
         phone: phone,
         img: value,
       );
     //  emit(ImageUploadSuccessState());

      });

    }).catchError((onError){
      //emit(ImageUploadErrorState(onError.toString()));
    });}


  void getUserData () {
    emit(LoadGetStates());
    FirebaseFirestore.instance.collection("userRegister").doc(id).get().
    then((value) {
      model =  RegisterUserModel.fromJson(value.data() as Map<String,dynamic> );
      print(value.data());
      emit(SuccessGetStates());
    }).catchError((e){
      emit(ErrorGetStates(e.toString()));
      print(e.toString());
    });


  }
  void userUpdate ({
    String ?name,
    String ?img,
    String ?phone,
    }) {
    emit(LoadUpdateStates());

      RegisterUserModel modell = RegisterUserModel(
        name: name,
        password: model!.password,
        bio: model!.bio,
        email: model?.email,
        phone: phone,
        img: img??"",
        emailVerified: false,
        uID: model!.uID,
      );
      FirebaseFirestore.instance.collection("userRegister").doc(id).update(
          modell.mapUser()).then((value) {
        getUserData();
        emit(SuccessUpdateStates());
      }).catchError((e) {
        print(e);
        emit(ErrorUpdateStates(e.toString()));
      });
    }


}