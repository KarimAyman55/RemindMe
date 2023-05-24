import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
Widget defaultTextField({
  TextEditingController ? textController,
  required Function onTap,
  required Function onChange,
  required Function validated,
  Function? pressed,
  String?  hint,
  IconData ? suffixIcon,
  required IconData  prefixed,
  TextInputType? type,
  bool isShow=false, })
=> SizedBox(
  height: 60,
  width: 305,
  child:   Container(
    decoration:  BoxDecoration(
      color: Colors.grey.shade200,
       borderRadius: const BorderRadius.only(bottomRight:Radius.circular(20),topRight:Radius.circular(30)),
    ),
    child: TextFormField(

      keyboardType: type,

      obscureText: isShow,

      controller: textController,

      onTap: (){ onTap();},

      onChanged : (v){   onChange( v);},

      validator: (s){ return validated(s);},

      decoration: InputDecoration (
border: InputBorder.none,
      iconColor: Colors.orange,
        hintStyle:const TextStyle(fontWeight: FontWeight.normal,color: Colors.orange,fontSize: 12) ,

       // hintStyle: const TextStyle(fontWeight: FontWeight.w200,color: Colors.blue,height: 10),


        hintText: hint!,

        suffixIcon: IconButton(onPressed: (){pressed!();}, icon: Icon (suffixIcon)),

        prefixIcon: Icon (prefixed),

      ),
      style: const TextStyle(color: Colors.black),
    ),
  ),
);

Widget defaultButton ({
  bool   isUpperCase=true,
  required Function onPressed ,
  required String text ,

})
=> Container(
  height: 33,
  width: 344,
  decoration: BoxDecoration (borderRadius: BorderRadius.circular(30),
    color: Colors.orange,),
  // width: double.infinity,

  child:   MaterialButton(onPressed: (){
    onPressed();},
    child: Text (isUpperCase ? text.toUpperCase():text,
      style: const TextStyle(color: Colors.black,fontFamily: "janna"
      ),)  ,



  ),
) ;

void  pushAndFinish (context , widget)   => Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context) =>widget)
    , (route) => false);
void  pushTo (context , widget)   => Navigator.push(context,
    MaterialPageRoute(builder: (context) =>widget));


Widget memories ({required dynamic image}) => SizedBox(
  child:   ClipRect(
    child: Card(
      elevation: 1,
      color: Colors.white,
      child: Image (  image: NetworkImage(image) ,),
    ),
  ),
);
Widget streamBuilder ( ) => StreamBuilder<QuerySnapshot>(

  stream: FirebaseFirestore.instance.collection("userRegister").snapshots(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return Center(
        child: Text(snapshot.error.toString()),
      );
    }
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }
    final data = snapshot.requireData;
    return ListView.builder(

      itemCount: data.size,
      itemBuilder: (context, index) {
       final DocumentSnapshot document = snapshot.data!.docs[index];
        return memories(
          image: document["image"] as File
       );
      },
    );
  },);