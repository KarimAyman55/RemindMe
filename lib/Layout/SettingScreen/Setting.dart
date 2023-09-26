import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
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
                                       CircleAvatar(
                                         radius: 45,
                                         backgroundImage:AppCubit.get(context).image != null ? FileImage(AppCubit.get(context).image)
                                             : NetworkImage(model!.img) as ImageProvider
                                       ),
                                      const SizedBox(width: 20,),
                                      Text("${model!.name}",style: Theme.of(context).textTheme.titleMedium),
                                      const SizedBox(width: 20,),
                                      IconButton(
                                          onPressed: (){
                                            AppCubit.get(context).getImg();
                                          },
                                          icon: const Icon(Icons.camera_alt_outlined,color: Colors.purple,size: 29,)),

                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 1,
                                  color: Colors.black38,
                                ),

                                const SizedBox(height: 20),
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

                                    showDialog(context: context, builder: (context)=>
                                        AlertDialog(
                                          backgroundColor: Colors.black87,
                                          title: const Text(" Are you sure for LogOut..?",
                                              style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white70,
                                                  fontSize: 15)),
                                          actions: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child:
                                                      InkWell(
                                                        onTap: (){
                                                          CacheHelper.removeData("id").then((value) {
                                                            if(value == true ) {
                                                              pushAndFinish(
                                                                  context, const LoginScreen());
                                                            }
                                                          });
                                                        },
                                                        child:  Container(
                                                          width: 40,
                                                          color: Colors.white70,
                                                          child: const Text( " ya "
                                                            ,style: TextStyle(fontStyle:
                                                            FontStyle.italic,color: Colors.black
                                                                ,fontSize: 14),),
                                                        ),
                                                      ),

                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child:
                                                      InkWell(
                                                        onTap: (){
                                                          Navigator.pop(context);
                                                        },
                                                        child:  Container(
                                                          width: 40,
                                                          color: Colors.white70,

                                                          child: const Text( " no "
                                                            ,style: TextStyle(fontStyle:
                                                            FontStyle.italic,color: Colors.black
                                                                ,fontSize: 14),),
                                                        ),
                                                      ),

                                                    ),

                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ));

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
