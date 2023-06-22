import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:remindme/Shared/Split/Constants/Constants.dart';
import 'package:remindme/Shared/Styles/Icons.dart';

import '../../Model/RegisterModel/RegisterModel.dart';
import '../../Model/RegisterModel/RegisterModel.dart';
import '../../Shared/Network/Remote/SharedPre/Shared_Pre.dart';
import '../../Shared/Split/Components.dart';
import '../Home/NavigationBar/Navigation_Screen.dart';
import '../LoginPage/LoginScreen.dart';
import 'cubit/RegisterCubit.dart';
import 'cubit/RegisterStates.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen ({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _State();
}

class _State extends State<RegisterScreen> {
  var formKey =GlobalKey<FormState>();
  var userName =TextEditingController();
  var email =TextEditingController();
  var password =TextEditingController();
  var phone =TextEditingController();
  bool isShow =true;


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=> RegisterCubit(),
      child: BlocConsumer<RegisterCubit,MainRegisterStates>(
          listener: (context , state){
            if (state is RegisterAuthSuccessState){
              pushAndFinish(context,  const LoginScreen());
              Fluttertoast.showToast(
                  msg: "Register done, LogIn Now ", backgroundColor: Colors.green);

            }
            if(state is ErrorRegisterStates ){
              Fluttertoast.showToast(msg:"E-mail is registered previously or pass is less than 6 char ",backgroundColor: Colors.amber);

            }

          },

          builder:(context,stat){
          return Scaffold(
            backgroundColor: Colors.grey.shade300,

            body: Column(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(topRight:Radius.circular(70),bottomRight:Radius.circular(250))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MaterialButton(onPressed: (){
                      pushAndFinish(context, const LoginScreen());
                    },
                      child: const Row(
                        children:  [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Icon(IconBroken.arrowLeft_3),
                            ],
                          )
                        ],
                      ),

                    ),
                  ),),
                const SizedBox(height: 30,),


                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:const EdgeInsetsDirectional.only(top: 68,end: 22,start: 22),
                          child: SizedBox(
                            height: 500,
                            width: double.infinity,
                            child: Card(
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text ('Welcome , RemindMe',style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "janna",
                                      color: Colors.green
                                  ),),
                                  const  Text(' please signUp ',style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green,
                                    fontSize: 18,
                                  ),),
                                  const SizedBox(height: 20,),
                                  defaultTextField(
                                    onTap: (){},
                                    onChange: (v){},
                                    validated: (String v){
                                      if (v.isEmpty){
                                        return 'can not be empty';
                                      }
                                    },
                                    prefixed: IconBroken.edit,
                                    textController: userName,
                                    hint: '    User Name',
                                    type:  TextInputType.name,

                                  ),

                                  const SizedBox(height: 12,),
                                  defaultTextField(
                                    onChange: (v){},
                                    onTap: (){},
                                    validated: (String v){
                                      if (v.isEmpty){
                                        return 'can not be empty';
                                      }
                                    },
                                    prefixed: Icons.email,
                                    textController: email,
                                    hint: '   Your Email',
                                    type:  TextInputType.emailAddress,

                                  ),
                                  const SizedBox(height: 12,),

                                  defaultTextField(
                                      onChange:  (v){},
                                      onTap:  (){},
                                      validated: (String v){
                                        if (v.isEmpty){
                                          return 'can not be empty';
                                        }
                                      },
                                      textController: password,
                                      hint: '   your Password',
                                      type:  TextInputType.visiblePassword,
                                      prefixed: Icons.lock,
                                      suffixIcon: isShow? Icons.visibility_off :Icons.visibility ,
                                      isShow: isShow,
                                      pressed: (){
                                        setState(() {

                                        });
                                        isShow=!isShow;
                                      }
                                  ),
                                  const SizedBox(height: 12,),

                                  defaultTextField(
                                    onTap: (){},
                                    onChange: (v){},
                                    validated: (String v){
                                      if (v.isEmpty){
                                        return 'can not be empty';
                                      }
                                    },
                                    textController: phone,
                                    hint: '  Your Phone',
                                    type:  TextInputType.phone,
                                    prefixed: Icons.phone,
                                  ),
                                  const SizedBox(height: 17,),
                                  if (State is RegisterAuthLoadingState)
                                    const LinearProgressIndicator(),
                                  const SizedBox(height: 5,),
                                  defaultButton(
                                    onPressed: (){
                                      if(formKey.currentState!.validate()) {
                                        RegisterCubit.get(context).userRegisterAuth(pass: password.text,phone: phone.text
                                        ,email: email.text,name: userName.text ,);
                                      }
                                    },
                                    text: 'Register Now',isUpperCase: false,
                                  )
                                ],),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          );
        } ,



      ),
    );
  }
}
