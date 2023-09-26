
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:remindme/Module/Chat/userChat.dart';

import '../../Model/RegisterModel/RegisterModel.dart';
import '../../Shared/Split/Components.dart';
import '../../Shared/Styles/Icons.dart';
import '../RegisterPage/cubit/RegisterCubit.dart';
import '../RegisterPage/cubit/RegisterStates.dart';

class AllUsersChat extends StatefulWidget {
  const AllUsersChat({Key? key}) : super(key: key);

  @override
  State<AllUsersChat> createState() => _AllUsersChatState();
}

class _AllUsersChatState extends State<AllUsersChat> {
  var tex =TextEditingController();
  final _key =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create : (context)=> RegisterCubit()..getAllUsers(),
        child: BlocConsumer<RegisterCubit,MainRegisterStates>(
          listener: (context , state){

          },
          builder: (context , state){
            return Form(
              key: _key,
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: HexColor("268265"),
                    title: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(" Friends  ",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13)),
                    ),

                  ),
                  body: SafeArea(
                      child: Column(
                        children: [
                          RegisterCubit.get(context).users.length != 0 ?
                          SizedBox(
                            height: 140,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index)=>
                                  user1Item(RegisterCubit.get(context).users[index],context),
                              separatorBuilder: (context,index)
                              =>const SizedBox(height: 15,)
                              , itemCount: RegisterCubit.get(context).users.length ,
                            ),
                          )
                              :const Center(child: LinearProgressIndicator()
                          ),
                          Container(color: Colors.green,height: 1,),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: (String? v){
                                    if(v!.isEmpty){
                                      return "   (: your search is empty pro ";
                                    }
                                  },
                                  controller: tex,
                                  textAlign: TextAlign.start,
                                  decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      hintText: ("Search .. "),
                                      hintStyle: const TextStyle(fontStyle: FontStyle.italic,color: Colors.orange)
                                      ,prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                                    child: Icon(IconBroken.search,color: Colors.cyan.shade700),
                                  )

                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 60,
                                  height: 25,
                                  child: MaterialButton(
                                    color: Colors.black54,
                                    onPressed: () {
                                      if(_key.currentState!.validate()) {
                                        setState(() {

                                        });
                                        RegisterCubit.get(context).search(
                                            tex.text);
                                        if (state is SuccessSearchStates){
                                          Fluttertoast.showToast(msg: " done 😇");
                                        }
                                      }
                                    },

                                    child: const Icon(
                                      IconBroken.send,color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(height: 30,),
                          RegisterCubit.get(context).searchList.isEmpty ?
                          const Center(child: Text(" nothing yet 🙄 ")):
                          Expanded(
                            child: ListView.separated(itemBuilder: (context,index)=>
                                user2Item(RegisterCubit.get(context).searchList[index],context), separatorBuilder: (context,index)
                            =>const SizedBox(height: 15,)
                              , itemCount: RegisterCubit.get(context).searchList.length ,
                            ),
                          )


                        ],

                      )
                  )),
            );
          },)
    );
  }
  Widget user1Item (RegisterUserModel model , context)=>InkWell(
    onTap: (){
      pushTo(context,  UserChat(model));
    },
    child:   Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children:   [
              //if (model!.img != "" )
              CircleAvatar(
                radius: 35,
                backgroundImage:
                model.img == null ?
                const AssetImage("assets/images/img.png"):
                NetworkImage("${model.img}") as ImageProvider,
              ),
              const SizedBox(height: 5,),
              Text("${model.name}",style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,overflow: TextOverflow.ellipsis,),

            ],
          ),
        ),
        const SizedBox(height: 10),

      ],
    ),
  );

  Widget user2Item (RegisterUserModel model , context)=>InkWell(
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
                radius: 37,
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