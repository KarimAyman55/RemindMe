import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:remindme/Module/RegisterPage/RegisterScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/Module/onBoarding/On_Boarding.dart';
import 'package:remindme/Shared/Styles/Icons.dart';
import '../../Layout/Test Result/Test Result.dart';
import '../../Shared/Network/Remote/SharedPre/Shared_Pre.dart';
import '../../Shared/Split/Components.dart';

import '../../Shared/Split/Constants/Constants.dart';
import '../Home/NavigationBar/Navigation_Screen.dart';
import 'cubit/LoginCubit.dart';
import 'cubit/LoginStates.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  bool isPass= true;
  var formKey = GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> LoginCubit()
        ,child: BlocConsumer<LoginCubit,MainLoginStates>(
          listener: (context, state){
      if(state is SuccessLoginStates){
        if(state.uID != null){
          CacheHelper.saveData("id", state.uID).then((value) {
            if (value == true) {
               id = state.uID!;
              if(relative == true) {
                pushAndFinish(context, const NavigationBarScreen());
                Fluttertoast.showToast(
                    msg: "Login Success ", backgroundColor: Colors.green);
              }

              else if (relative == false ){
                Fluttertoast.showToast(
                    msg: "please select status first ", backgroundColor: Colors.red);

              }
            }}); }
      }
      if(state is ErrorLoginStates ){
        Fluttertoast.showToast(msg:"E-mail or Password wrong",backgroundColor: Colors.amber);

      }

          },
          builder: (context, state){
            return Scaffold(
              backgroundColor: Colors.grey.shade300,

              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        decoration:  BoxDecoration(
                            color: HexColor("#194475"),
                            borderRadius: const BorderRadius.only(topRight:Radius.circular(70),bottomRight:Radius.circular(250))
                        ),
                      ),
                      const SizedBox(height: 90,),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: MaterialButton(onPressed: (){
                          pushAndFinish(context, const Boarding());
                        },
                          child:  Row(
                            children:  [
                              const Icon(IconBroken.arrowLeft_3),
                              const SizedBox(width: 2,),
                              Text(" App Info",style: Theme.of(context).textTheme.titleMedium,),
                             ],
                          ),

                        ),
                      ),

                      Padding(
                        padding:const EdgeInsetsDirectional.only(end: 22,start: 22),
                        child: SizedBox(
                          height: 480,
                          child: Card(
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text ('Welcome , RemindMe',style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "janna",
                                    color: Colors.green
                                ),),
                                const  Text(' please signIn ',style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                  fontSize: 18,
                                ),),
                                const SizedBox(height: 20,),
                                defaultTextField(
                                  onChange: (v){

                                  },
                                  validated: (String value){
                                    if (value.isEmpty|| !value.isEmail){
                                      return 'Email Must Not Empty';
                                    }
                                  } , type: TextInputType.emailAddress,
                                  prefixed: Icons.email,
                                  hint: ('  Enter Your Email'),
                                  onTap: (){

                                  } ,
                                  textController: emailController ,

                                ),
                                const SizedBox(height: 13),
                                defaultTextField
                                  (onChange: (v){},
                                  validated: (String value){
                                    if (value.isEmpty){
                                      return 'password Must Not Empty';
                                    }
                                  } ,
                                  type: TextInputType.visiblePassword,
                                  prefixed: Icons.lock,
                                  hint: ('Enter Your password'),
                                  onTap: (){

                                  } ,
                                  isShow: isPass,
                                  suffixIcon: isPass ? Icons.visibility_off:Icons.visibility_outlined,

                                  textController:passController ,
                                  pressed: (){
                                    setState(() {
                                      isPass=!isPass;
                                    });

                                  },
                                ),
                                const SizedBox(height: 13,),
                                if (State is LoadLoginStates)
                                  const LinearProgressIndicator(),
                                const SizedBox(height: 4,),

                                defaultButton(
                                  isUpperCase: true,
                                  onPressed: (){

                                    if (formKey.currentState!.validate()){
                                      if (kDebugMode) {
                                        print (emailController.text);
                                      }
                                      if (kDebugMode) {
                                        print (passController.text);
                                      }
                                      LoginCubit.get(context).userLogin(email:
                                      emailController.text,
                                          pass: passController.text);

                                    }
                                  },

                                  text: ('login'),

                                ),
                                const SizedBox(height: 17,),
                                const Text (' Don\'t Have Account ?        ',style:
                                TextStyle(
                                    fontFamily: "Janna",fontSize: 17,color: Colors.green),
                                ),
                                const SizedBox(height: 2,),
                                TextButton(onPressed: (){
                                  pushTo(context,const RegisterScreen());
                                }, child:const Text ('   Register Now',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                      ,color: Colors.orange
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 20),
                                  child: Row(
                                    children: [
                                      const Text("Patient Relative",style: TextStyle(fontFamily: "jannah",fontSize: 15)),
                                      const SizedBox(width: 10,),
                                      Checkbox(value: relative , onChanged: (v){

                                        setState((){
                                          relative=v!;
                                        });

                                      }),
                                      const SizedBox(width: 30,),
                                      const Text("Patient",style: TextStyle(fontFamily: "jannah",fontSize: 15),),
                                      const SizedBox(width: 10,),
                                      Checkbox(value: patient , onChanged: (v){
                                        setState((){
                                          patient=v!;
                                        });
                                        if(patient = true) {
                                          pushTo(context, const Test());
                                          patient=false;
                                        }
                                      }),

                                    ],
                                  ),
                                ),



                              ],),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
