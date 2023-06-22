import 'package:flutter/material.dart';
import 'package:remindme/Module/Chat/userChat.dart';
import 'package:remindme/Shared/Split/Components.dart';
import '../../Model/RegisterModel/RegisterModel.dart';
import '../RegisterPage/cubit/RegisterCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../RegisterPage/cubit/RegisterStates.dart';
class AllUsersChat extends StatelessWidget {
  const AllUsersChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create : (context)=> RegisterCubit()..getAllUsers(),
       child: BlocConsumer<RegisterCubit,MainRegisterStates>(
         listener: (context , state){},
         builder: (context , state){
           return Scaffold(
               appBar: AppBar(
                 centerTitle: true,
                 title: Padding(
                   padding: const EdgeInsets.all(6),
                   child: Text(" Users  ",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13)),
                 ),

               ),
               body: SafeArea(
                   child: SingleChildScrollView(
                     child: Column(
                       children: [
                         RegisterCubit.get(context).users.length >0 ? ListView.separated(itemBuilder: (context,index)=>
                             userItem(RegisterCubit.get(context).users[index],context), separatorBuilder: (context,index)
                         =>const SizedBox(height: 15,)
                           , itemCount: RegisterCubit.get(context).users.length , shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),)
                             :const Center(child: CircularProgressIndicator())

    ],
    ),
    )
    )
    );
    },
    ));
}
Widget userItem (RegisterUserModel model , context)=>InkWell(
 onTap: (){
   pushTo(context,  UserChat(model));
 },
  child:   Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children:   [
            //if (model!.img != "" )
             CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage("${model.img}"),
            ),
            const SizedBox(width:14,),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 40),
              child: Text("${model.name}",style: Theme.of(context).textTheme.titleMedium),
            ),

          ],
        ),
      ),
      const SizedBox(height: 10),

    ],
  ),
    );
}