

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/Module/Home/NavigationBar/NavCubit/VavStates.dart';

import '../../Module/Home/NavigationBar/NavCubit/NavCubit.dart';
class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);
  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
 String exercise3 = "https://previews.123rf.com/images/emojiimage/emojiimage1709/emojiimage170900256/85421408-senior-couple-characters-doing-exercises-physical-activity-benefits-for-older-adults-colorful.jpg";
 String exercise2= "https://thumbs.dreamstime.com/b/old-people-exercising-elderly-couple-does-gymnastics-sport-old-people-exercising-elderly-couple-does-gymnastics-sport-129623071.jpg";
 String exercise1= "https://previews.123rf.com/images/studiolaut/studiolaut1801/studiolaut180100024/93212372-elderly-couple-gymnastics.jpg";
 String exercise4= "https://static.vecteezy.com/system/resources/previews/002/186/345/original/an-elderly-man-runs-in-the-park-the-concept-of-active-old-age-sports-and-running-day-of-the-elderly-flat-cartoon-illustration-vector.jpg";
 String exercise5= "https://cdn4.vectorstock.com/i/1000x1000/65/88/old-people-doing-exercises-healthy-lifestyle-vector-22396588.jpg";
 String exercise6= "https://img.freepik.com/premium-vector/senior-people-gymnastics-elderly-couple-grandparents-doing-exercises-yoga_38747-923.jpg";

 @override
  Widget build(BuildContext context) {
   int time =0;
    return BlocProvider(create: (context)=> NavCubit(),
      child: BlocConsumer<NavCubit,NavMainStates>(
        listener: (context , state){},
        builder: (context , state){
          return  Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("#You can do it (: ",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blue)),
                      ],
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 240,
                      width: 380,
                      child: Card(
                          child : Image.network(exercise1,
                          )
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("#45 sec",style: Theme.of(context).textTheme.titleMedium,),
                        const SizedBox(width: 15,),

                        OutlinedButton(onPressed: (){
                          NavCubit.get(context).startTimer1();

                        }, child: Text(" Start ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.green.shade700)
                          ,)),
                        const SizedBox(width: 10,),
                        Text("${NavCubit.get(context).time1}",style: Theme.of(context).textTheme.titleMedium,)
                        , const SizedBox(width: 15,),
                      OutlinedButton(onPressed: (){
                          NavCubit.get(context).zeroTimer1(
                          );

                        }, child: Text("stop ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.red)
                          ,)),
                      ],
                    ),
                    SizedBox(
                      height: 240,
                      width: 380,
                      child: Card(
                          child : Image.network(exercise3,
                          )
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("#45 sec",style: Theme.of(context).textTheme.titleMedium,),
                        const SizedBox(width: 15,),

                        OutlinedButton(onPressed: (){
                          NavCubit.get(context).startTimer2();

                        }, child: Text(" Start ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.green.shade700)
                          ,)),
                        const SizedBox(width: 10,),
                        Text("${NavCubit.get(context).time2}",style: Theme.of(context).textTheme.titleMedium,)
                        , const SizedBox(width: 15,),
                        OutlinedButton(onPressed: (){
                          NavCubit.get(context).zeroTimer2(
                          );

                        }, child: Text("stop ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.red)
                          ,)),
                      ],
                    ),
                    SizedBox(
                      height: 240,
                      width: 380,
                      child: Card(
                          child : Image.network(exercise2,
                          )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("#60 sec Steady",style: Theme.of(context).textTheme.titleMedium,),
                        const SizedBox(width: 15,),

                        OutlinedButton(onPressed: (){
                          NavCubit.get(context).startTimer3();

                        }, child: Text(" Start ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.green.shade700)
                          ,)),
                        const SizedBox(width: 10,),
                        Text("${NavCubit.get(context).time3}",style: Theme.of(context).textTheme.titleMedium,)
                        , const SizedBox(width: 15,),
                        OutlinedButton(onPressed: (){
                          NavCubit.get(context).zeroTimer3(
                          );

                        }, child: Text("stop ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.red)
                          ,)),
                      ],
                    ),

                    SizedBox(
                      height: 240,
                      width: 380,
                      child: Card(
                          child : Image.network(exercise4,
                          )
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("Walking or jogging for some time of the day is good for you ",
                      style: Theme.of(context).textTheme.bodySmall!.
                      copyWith( fontSize: 14,)
                      ,),
                    SizedBox(
                      height: 240,
                      width: 380,
                      child: Card(
                          child : Image.network(exercise5,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("#45 sec",style: Theme.of(context).textTheme.titleMedium,),
                        const SizedBox(width: 15,),

                        OutlinedButton(onPressed: (){
                          NavCubit.get(context).startTimer4();

                        }, child: Text(" Start ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.green.shade700)
                          ,)),
                        const SizedBox(width: 10,),
                        Text("${NavCubit.get(context).time4}",style: Theme.of(context).textTheme.titleMedium,)
                        , const SizedBox(width: 15,),
                        OutlinedButton(onPressed: (){
                          NavCubit.get(context).zeroTimer4(
                          );

                        }, child: Text("stop ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.red)
                          ,)),
                      ],
                    ),

                    SizedBox(
                      height: 240,
                      width: 380,
                      child: Card(
                          child : Image.network(exercise6,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("#45 sec",style: Theme.of(context).textTheme.titleMedium,),
                        const SizedBox(width: 15,),

                        OutlinedButton(onPressed: (){
                          NavCubit.get(context).startTimer5();

                        }, child: Text(" Start ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.green.shade700)
                          ,)),
                        const SizedBox(width: 10,),
                        Text("${NavCubit.get(context).time5}",style: Theme.of(context).textTheme.titleMedium,)
                        , const SizedBox(width: 15,),
                        OutlinedButton(onPressed: (){
                          NavCubit.get(context).zeroTimer5(
                          );

                        }, child: Text("stop ",
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith( fontSize: 14,color: Colors.red)
                          ,)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
