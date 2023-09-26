import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Layout/Training/training.dart';
import '../../../Shared/Split/Components.dart';
import '../../../Shared/Styles/Icons.dart';
import 'NavCubit/NavCubit.dart';
import 'NavCubit/VavStates.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NavCubit,NavMainStates>(
      listener:(context,state ){} ,
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "RemindMe",style: TextStyle(fontFamily: "Janna"),
            ),
            actions: [
              InkWell(
                onTap: (){
                  pushTo(context, const Training());

                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text("Exercises",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,color:Colors.green ),),
                       const SizedBox(width: 6,),
                       const Icon(IconBroken.arrowRightCircle,color: Colors.green,)

                    ],
                  ),
                ),
              ),
              ],

          )
          ,body: NavCubit.get(context).screens[NavCubit.get(context).val],

          bottomNavigationBar: BottomNavigationBar (
            items : const [
              BottomNavigationBarItem(label: "Home", icon:Icon (IconBroken.home,color: Colors.black87,) ,),
              BottomNavigationBarItem(icon:Icon (IconBroken.category,color: Colors.black87) ,label: "Activities"),
              BottomNavigationBarItem(icon:Icon (IconBroken.document,color: Colors.black87) ,label: "Tasks")
            ],

            currentIndex: NavCubit.get(context).val,
            onTap: (index){
              NavCubit.get(context).changeNav(index);
            },
            elevation: 0,
            backgroundColor: Colors.white,

           // ,buttonBackgroundColor: Colors.transparent
            //,backgroundColor: Colors.white
            //,color: Colors.transparent,
          ),
        );
      },
    );
  }
}
// CurvedNavigationBar(
// items: const  [
// Padding(
// padding:  EdgeInsetsDirectional.only(top: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text("Home",style: TextStyle(fontSize: 15,color: Colors.orange),),
// SizedBox(width: 5,),
// Icon (IconBroken.home,color: Colors.black87,) ,
//
// ],),
// ),
// Padding(
// padding:  EdgeInsetsDirectional.only(top: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text("Activity",style: TextStyle(fontSize: 15,color: Colors.orange),),
// SizedBox(width: 5,),
// Icon (IconBroken.paper,color: Colors.black87),
//
// ],),
// ),
// Padding(
// padding:  EdgeInsetsDirectional.only(top: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children:  [
// Text("Tasks",style: TextStyle(fontSize: 15,color: Colors.orange),),
// SizedBox(width: 5,),
// Icon (IconBroken.editSquare,color: Colors.black87),
// ],),
// )
// ],