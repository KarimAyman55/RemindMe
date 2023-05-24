import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:remindme/Module/RegisterPage/cubit/RegisterCubit.dart';
import 'package:remindme/Module/RegisterPage/cubit/RegisterStates.dart';
import 'package:remindme/Shared/Split/Constants/Constants.dart';
import 'package:remindme/Shared/Styles/Icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Module/LoginPage/LoginScreen.dart';
import '../../Shared/Network/Remote/SharedPre/Shared_Pre.dart';
import '../../Shared/Split/Components.dart';
import '../AppCubit/AppCubit.dart';
import '../AppCubit/AppCubitStates.dart';

class Setting extends StatelessWidget {
   Setting ({Key? key}) : super(key: key);

   var formKey = GlobalKey<FormState>();
   var nameController = TextEditingController ();
   var emailController = TextEditingController ();
   var phoneController = TextEditingController ();

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit,MainAppStates>(
        listener: (context , state){

          if(AppCubit.get(context).model !=null){
            if (state is SuccessGetStates) {
              var model = AppCubit.get(context).model;
              phoneController.text = model!.phone!;
              nameController.text = model.name!;
            }}

         },
        builder: (context , state){
           var model = AppCubit.get(context).model;
          return Scaffold(
              appBar:AppBar() ,
              body:
              SafeArea(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (AppCubit.get(context).model !=null)
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children:   [
                                       if (model!.img != "" )
                                       CircleAvatar(
                                         radius: 45,
                                         backgroundImage: NetworkImage(model.img),
                                       ),
                                      const SizedBox(width: 20,),
                                      Text("${model.name}",style: Theme.of(context).textTheme.titleMedium),
                                      const SizedBox(width: 20,),
                                      IconButton(
                                          onPressed: (){
                                            AppCubit.get(context).getImg();
                                          },
                                          icon: const Icon(Icons.camera_alt_outlined)),

                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),

                                Container(

                                  decoration:  const BoxDecoration(
                                    color: Colors.transparent,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),
                                          topLeft: Radius.circular(60),topRight: Radius.circular(40),bottomRight: Radius.circular(70))
                                  ),
                                  child: Column(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(

                                          leading: const Icon(Icons.email,color: Colors.blue) ,
                                          title:  Text('E-Mail :', style: Theme.of(context).textTheme.titleMedium
                                          ) ,
                                          subtitle: Text ("${model.email}", style:
                                          Theme.of(context).textTheme.titleMedium
                                          ),

                                        ),
                                      ),
                                      const SizedBox(height: 6,),
                                      ListTile(

                                        leading: const Icon(Icons.call,color: Colors.blue) ,
                                        title:  Text('Phone :', style: Theme.of(context).textTheme.titleMedium
                                        ) ,
                                        subtitle: Text ("${model.phone}", style:
                                        Theme.of(context).textTheme.titleMedium
                                        ),

                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                          Padding(
                            padding:const EdgeInsetsDirectional.only(top: 90,end: 22,start: 22),
                            child: Center(
                              child: Column(
                                children: [
                                  if (state is LoadUpdateStates )
                                    const Center(child:  LinearProgressIndicator()),
                                 // if (state is LoadingUpdateStates )
                                   // const Center(child:  LinearProgressIndicator()),
                                  const SizedBox(height: 10,),
                                  defaultTextField(
                                    onTap: (){},
                                    onChange: (v){},
                                    validated: (String v){
                                      if (v.isEmpty){
                                        return 'can not be empty';
                                      }
                                    },
                                    prefixed: Icons.person,
                                    textController: nameController,
                                    hint: '   Name',
                                    type:  TextInputType.name,

                                  ),
                                  const SizedBox(height: 15,),
                                  defaultTextField(
                                    onTap: (){},
                                    onChange: (v){},
                                    validated: (String v){
                                      if (v.isEmpty){
                                        return 'can not be empty';
                                      }
                                    },
                                    prefixed: IconBroken.call,
                                    textController: phoneController,
                                    hint: '    phone',
                                    type:  TextInputType.phone,

                                  ),

                                ],
                              ),
                            ),
                          ),


                          const SizedBox(height: 14,),
                          if(model !=null)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 280,
                                child: ElevatedButton(
                                    onPressed: (){
                                      if (AppCubit.get(context).image == null )
                                      {
                                        if(formKey.currentState!.validate()) {
                                          AppCubit.get(context).userUpdate(phone: phoneController.text,
                                            name: nameController.text,);
                                        }
                                      }else {
                                        AppCubit.get(context).uploadImage(phone: phoneController.text,name: nameController.text);
                                        Fluttertoast.showToast(msg: " Successfully updated  ",backgroundColor: Colors.orangeAccent);

                                      }

                                      }
                                    ,child: const Text ("Update")),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8,),

                          if(model !=null)
                          Center(
                            child: SizedBox(
                              width: 280,
                              child:
                                ElevatedButton(
                                  onPressed: (){

                                      CacheHelper.removeData("id").then((value) {
                                      if(value) {
                                        pushAndFinish(
                                            context, const LoginScreen());
                                      }
                                    });
                                   },
                                  child: const Text ("Logout")),
                            ),
                          ),
                          const SizedBox(height: 40,)
                          ,


                        ],
                      ),
                    ),
                  ),
                ),
              )


          );
        },

      ),
    );
  }
}
