import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:remindme/Model/ChatModel/ChatModel.dart';
import 'package:remindme/Module/RegisterPage/cubit/RegisterCubit.dart';
import 'package:remindme/Module/RegisterPage/cubit/RegisterStates.dart';
import 'package:remindme/Shared/Split/Constants/Constants.dart';
import 'package:remindme/Shared/Styles/Icons.dart';

import '../../Model/RegisterModel/RegisterModel.dart';

class UserChat extends StatefulWidget {
  RegisterUserModel ?model;
 UserChat(this.model, {super.key});

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
 var text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>RegisterCubit()..getMessages(rId: widget.model!.uID),
    child : BlocConsumer<RegisterCubit,MainRegisterStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(IconBroken.arrowLeft,size: 26),
            ),
            centerTitle: true,
            actions: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 10.0),
                    child: Text(
                      '${widget.model!.name}',
                    ),
                  ),
                  const SizedBox(width:8,),

                   Padding(
                    padding: const EdgeInsets.only(top: 7,right: 20),
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage:  NetworkImage("${widget.model!.img}"),
                      //NetworkImage("${model!.img}")
                    ),
                  ),


                ],
              ),
            ],
          ),
          body:Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Expanded(
                    child: ListView.separated(

                      physics:const BouncingScrollPhysics(),
                      itemBuilder: (context, index)

                      {
                        var message = RegisterCubit.get(context).messages[index];
                        if(id == message.sId) {
                          return myItem(message,context);
                        }

                        return  userItem(message,context);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                      itemCount: RegisterCubit.get(context).messages.length,),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  //  if (RegisterCubit.get(context).chatModel!.text !="")
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),

                      ),

                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: text,
                              decoration:  InputDecoration(

                                 border: InputBorder.none,
                                  hintText: '\t type a message ...',
                                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 14
                                  )

                              ),

                            ),
                          ),

                          MaterialButton(
                            color: Colors.blueGrey,
                            onPressed: () {
                              var currentDate = DateTime.now();
                              RegisterCubit.get(context).sendMessage(rId:widget.model!.uID,
                                  date:DateFormat.Hms().format(currentDate).toString()
                                  , text:text.text);
                              setState(() {
                                text.clear();
                              });
                              },
                            child: const Icon(
                              Icons.send,color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
      },

    ));
  }
}

Widget userItem (ChatModel model ,context)=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(

      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            decoration:  const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(6.0,),
                bottomStart: Radius.circular(20.0,),
                topEnd: Radius.circular(6.0,),
              ),
            ),
            child:
                Text(
                  ' ${model.text} ',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,),
                ),
          ),
        ),
        const SizedBox(width: 5,),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            ' ${model.date} ',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                overflow: TextOverflow.ellipsis
            ),maxLines: 8,
          ),
        ),


      ],
    ),
  ],
);


Widget myItem (ChatModel model,context)=> Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              ' ${model.date} ',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  overflow: TextOverflow.ellipsis
              ),maxLines: 8,
            ),
          ),
          const SizedBox(width: 5,),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(20.0,),
                bottomStart: Radius.circular(6.0,),
                topStart: Radius.circular(8.0,),

              ),
            ),
            child: Text(
              '${model.text}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
              ),
            ),
          ),


        ],
      ),
    ),
  ],
);