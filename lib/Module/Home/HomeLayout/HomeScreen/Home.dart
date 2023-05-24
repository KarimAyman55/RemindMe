
import 'package:flutter/material.dart';
import 'package:remindme/Layout/LocationScreen/Design/LocationViews.dart';
import 'package:remindme/Module/Home/HomeLayout/ActivityScreen/Activity.dart';
import '../../../../Layout/SettingScreen/Setting.dart';
import '../../../../Shared/Split/Components.dart';
import '../../../../Shared/Styles/Icons.dart';
import '../../../Chat/userChat.dart';
import '../../NavigationBar/NavCubit/NavCubit.dart';
import 'package:url_launcher/url_launcher.dart';
class Home extends StatefulWidget {
   const Home ({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool value = false;
String url = "http://remindmee.netlify.app/";
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
           ),
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 9,top:15 ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children:   [
                        const Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: Image(image: AssetImage("assets/images/Logo.png"),),
                              ),
                            ]
                        ),
                        const SizedBox(width: 20,),
                        Text("RemindMe",style: Theme.of(context).textTheme.titleMedium),

                      ],
                    ),
                  ),
                  const SizedBox(height: 22),

                  InkWell(
                    onTap: (){
                      pushTo(context,const CurrentLocation());
                    },
                    child:
                    const Row(
                      children: [
                        Icon(IconBroken.location),
                         SizedBox(width: 10),
                         Text(
                          "Location",style: TextStyle(fontFamily: "Janna"),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 12),
                  Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: (){
                      pushTo(context,  const UserChat());
                    },
                    child:
                    const Row(
                      children: [
                        Icon(IconBroken.chat),
                        SizedBox(width: 10),
                         Text(
                          "Chat",style: TextStyle(fontFamily: "Janna"),
                        ),
                      ],
                    ),
                  ) ,),
                  const SizedBox(height: 12),
                  Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: ()async{
                     await launch('mailto:RemindMe@gmail.com');
                    },
                    child:
                    const Row(
                      children: [
                        Icon(IconBroken.send),
                        SizedBox(width: 10),
                         Text(
                          "Help!",style: TextStyle(fontFamily: "Janna"),
                        ),
                      ],
                    ),
                  ) ,),
                  const SizedBox(height: 12),
                  Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: () async{
                      await launch('tel:16955');

                    },
                    child:
                    const Row(
                      children: [
                        Icon(IconBroken.calling),
                        SizedBox(width: 10),
                         Text(
                          "connect",style: TextStyle(fontFamily: "Janna"),
                        ),
                      ],
                    ),
                  ) ,),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: () async{
                        await launch(url);

                      },
                      child:
                      const Row(
                        children: [
                          Icon(Icons.add_link),
                          SizedBox(width: 10),
                          Text(
                            "our site ",style: TextStyle(fontFamily: "Janna"),
                          ),
                        ],
                      ),
                    ) ,),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children:  [
                        const Text(
                          "Mode",style: TextStyle(fontFamily: "Janna"),
                        ),
                        const SizedBox(width: 10),
                        Switch(onChanged: (v){
                          setState(() {
                            NavCubit.get(context).mode();
                            value = v ;
                          });}
                            , value: value),
                      ]
                    ) ,),
                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      onTap: (){
                        pushTo(context,   Setting());

                      },
                      child:
                      const Row(
                        children: [
                          Icon(IconBroken.setting),
                          SizedBox(width: 10),
                          Text(
                            "Setting",style: TextStyle(fontFamily: "Janna"),
                          ),
                        ],
                      ),
                    ) ,),
                  const SizedBox(height: 12),


                ],),
            ),
          ),
          body:  SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("  Patient's Relative can share special memories for his patient  (: \t ",
                          style: TextStyle(
                              color: Colors.blue.shade900,fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,height: 2
                          ),
                          overflow: TextOverflow.ellipsis,maxLines: 3,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),

                          ),
                          height: 35,

                          child: ElevatedButton(onPressed: (){
                            pushTo(context, const Activity());

                          },style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white54)),
                              child: const Text(" share",style: TextStyle(
                                  color: Colors.black,fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,height: 2
                              )     ),
                              ),
                        ),
                      )

                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      const Expanded(
                        child:  SizedBox(
                          child:Text(" \tYou must do the test sometimes, to determine which standard you are in    and your progress..!   ",
                            style: TextStyle(
                                color: Colors.orangeAccent,fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,height: 2
                            ),

                            maxLines: 3,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          height: 35,

                          child: ElevatedButton(onPressed: (){
                            pushTo(context, const Activity());

                          },style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white54)),
                              child: const Text("do test",style: TextStyle(
                                  color: Colors.black,fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,height: 2
                              )   )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 240,
                    width: 380,
                    child: Card(
                        child : Image.network("https://marshmallowmom.com/wp-content/uploads/2023/04/alzheimer_2.jpg",
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text("#Dealing With Patient .... \n Must Relative Put the patient's favorite food in a prominent place and remind him that it is available "
                      "\n And - Focus on food that is served in pieces, such as pancakes, for convenience, rather than food that requires different utensils to eat."
                      "\n And - Serve pureed or liquid food such as soup if the patient has difficulty swallowing for any reason, which requires medical advice."
                      "\n And - Avoid food that may harm the digestive system, such as food that contains spices in abundance."
                      "\n And -Avoid hot food if the patient has lost the ability to recognize it in order to avoid burns to the mouth or throat."
                      "\n And - Make sure that the patient takes a sufficient amount of fluids daily, not only with food, so that he does not become dehydrated, especially in hot weather."
                      ,style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 20),


                  SizedBox(

                    child: Text(" |Dealing with Alzheimer| ,,"
                        "\n""  Educate yourself about Alzheimer’s disease Learn about its effects and how to respond Stay in touch A card, a call or a visit means "
    " a lot and shows you careBe patient. Adjusting to an Alzheimer’s diagnosis is an ongoing process and each person reacts differently"
    " Offer a shoulder to lean on The disease can create stress for the entire family. Simply offering your support and friendship is helpful."
    " Engage the person with dementia in conversation. It’s important to involve the person in conversation even when his or her ability to participate becomes more limited."
    " Offer to help the family with its to-do list. Prepare a meal, run an errand or provide a ride."
    " Engage family members in activities. Invite them to take a walk or participate in other activities."
    " Offer family members a reprieve. Spend time with the person living with dementia so family members can go out alone or visit with friends."
    " Be flexible Don’t get frustrated if your offer for support is not accepted immediately. The family may need time to assess its needs."
                        "Support the Alzheimer’s cause.    ",style: Theme.of(context).textTheme.titleMedium),),

                  const SizedBox(height: 40),


                ],
              ),
            ),
          ),

        ));
  }
}
