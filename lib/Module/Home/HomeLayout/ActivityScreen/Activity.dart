import 'package:photo_view/photo_view.dart';
import 'package:intl/intl.dart';
import 'package:remindme/Model/MemoriesModel/MemoriesModel.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/Module/Home/HomeLayout/ActivityScreen/games/SelectFlips/home.dart';
import '../../../../Shared/Split/Components.dart';
import '../../../../Shared/Styles/Icons.dart';
import 'Memories/cubit/memoriesCubit.dart';
import 'Memories/cubit/states.dart';
import 'games/CrossWord_Puzzle/Screens/Home_Screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'games/TicToc/user Toe.dart';

class Activity extends StatefulWidget {
   const Activity ({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}
class _ActivityState extends State<Activity> {
  bool val=false;
 bool val1=false;
 bool val2=false;
 bool val3=false;
 bool val4=false;
 bool val5=false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 3,
        child: BlocProvider(
          create: (context)=>MemoryCubit()..getMemories(),
          child: BlocConsumer<MemoryCubit,MainMemoryStates>(
            listener: (context , state){

            },
            builder: (context , state){
              var cubit = MemoryCubit.get(context);
              return Scaffold(
                key: scaffoldKey,
                appBar: AppBar(
                  bottom:  const TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(IconBroken.chat,size: 22),
                        child:  Text("Test"),
                      ),
                      Tab(
                        icon: Icon(IconBroken.game,size: 22),
                        child: Text("Games"),
                      ),
                      Tab(
                        icon: Icon(IconBroken.document,size: 22),
                        child: Text("Memories"),
                      ),
                    ],

                  ),
                ),
                body: TabBarView(
                  children
                      : [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(top: 16),
                            child: Column(
                              children: [
                                const  Text(
                                    "# Through Test you can follow your standard ,                  do it each period.  \n do 'right' mark on different boxes to answer...",
                                    style: TextStyle(color:Colors.indigo),maxLines: 3,overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 4,),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "1) Do you currently feel sad or depressed..?",
                                          style: Theme.of(context).textTheme.titleMedium,
                                          maxLines: 2,overflow: TextOverflow.ellipsis,

                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.only(end: 30),
                                        child: Container(
                                          height: 18,
                                          width: 19,
                                          color: Colors.grey.shade300,

                                          child: Checkbox(value: val, onChanged: (v){
                                            setState(() {
                                              val=v!;
                                            });
                                          },activeColor: Colors.orange,),
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                                const SizedBox(height: 16,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "2) Are you heading in some familiar territory..?",style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                      ),
                                      const SizedBox(width: 30,),
                                      Container(
                                        height: 18,
                                        width: 19,
                                        color: Colors.grey.shade300
                                        ,

                                        child: Checkbox(value: val1, onChanged: (v){
                                          setState(() {
                                            val1=v!;
                                          });
                                        },activeColor: Colors.orange,),
                                      )
                                    ],
                                  ),

                                ),
                                const SizedBox(height: 16,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "3) Have you had any change in your personality..?",
                                          style: Theme.of(context).textTheme.titleMedium,
                                          maxLines: 2,overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 15,),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.only(end: 25),

                                        child: Container(
                                          height: 18,
                                          width: 19,
                                          color: Colors.grey.shade300,
                                          child: Checkbox(value: val2, onChanged: (v){
                                            setState(() {
                                              val2=v!;
                                            });
                                          },activeColor: Colors.orange,),
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                                const SizedBox(height: 16,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "4) Do you feel better when you talk and bring back memories..?",style:
                                        Theme.of(context).textTheme.titleMedium,
                                          maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      ),
                                      const SizedBox(width: 20,),
                                      Container(
                                        height: 18,
                                        width: 19,
                                        color: Colors.grey.shade300,

                                        child: Checkbox(value: val3, onChanged: (v){
                                          setState(() {
                                            val3=v!;
                                          });
                                        },activeColor: Colors.orange,),
                                      )
                                    ],
                                  ),

                                ),
                                const SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            "5) Have you encountered difficulties in dealing with people ..?",style: Theme.of(context).textTheme.titleMedium,
                                            maxLines: 2,overflow: TextOverflow.ellipsis),
                                      ),
                                      const SizedBox(width: 20,),
                                      Card(
                                        elevation: 0,
                                        child: Container(
                                          height: 18,
                                          width: 19,
                                          color: Colors.grey.shade300
                                          ,


                                          child: Checkbox(value: val4, onChanged: (v){
                                            setState(() {
                                              val4=v!;
                                            });
                                          },activeColor: Colors.orange,),
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                                const SizedBox(height:16,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            "6) Do you have more difficulties doing everyday activities ..?",style: Theme.of(context).textTheme.titleMedium,
                                            maxLines: 2,overflow: TextOverflow.ellipsis),
                                      ),
                                      const SizedBox(width: 20,),
                                      Card(
                                        elevation: 0,
                                        child: Container(
                                          height: 18,
                                          width: 19,
                                          color: Colors.grey.shade300
                                          ,


                                          child: Checkbox(value: val5, onChanged: (v){
                                            setState(() {
                                              val5=v!;
                                            });
                                          },activeColor: Colors.orange,),
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                                const SizedBox(height: 30,),
                                Container(
                                    height: 30,
                                    width: MediaQuery.of(context).size.width,
                                    color:Colors.redAccent
                                    ,child: MaterialButton(onPressed: (){
                                  if(val & val1 & val2 & val3 & val4 & val5  ) {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) =>
                                            AlertDialog(
                                              title: const Text(
                                                " Same diseases Standard ):  , do more our activities ",
                                              ),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("back"),
                                                )
                                              ],
                                            ));
                                  }


                                  else if ( val1 ||  val2 || val3 || val4 || val5   )
                                  {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                            " improvement in your memory , bravo (: continue doing tasks  ",
                                          ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);

                                              },
                                              child: const Text("back"),
                                            )
                                          ],
                                        )); }

                                  else if (! val & !val1 & !val2 & !val3 & !val4 & !val5 || val )
                                  {
                                    Fluttertoast.showToast(msg: " Please Answer First , Or put an other right mark  ");}

                                },
                                  child: Text(" Progress Standard ",style: Theme.of(context).textTheme.titleMedium,),)),
                                const SizedBox(height: 60,),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 20),
                              child: Text(" #Games helpful for your mental connection , \n select to play game... ",
                                style: Theme.of(context).textTheme.titleMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
                            ),
                            const SizedBox(height: 40,),

                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 20),
                              child: GridView.count(
                                  crossAxisCount: 2,

                                  crossAxisSpacing: 13,
                                  mainAxisSpacing: 13,
                                  childAspectRatio: 1/0.9,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),

                                  children:
                                  List.generate(games(context).length, (index) => games(context)[index])

                              ),
                            )
                          ],

                        ),
                      ),
                    ),

                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(onTap: (){},
                                    decoration:   InputDecoration(
                                        border: InputBorder.none
                                        ,hintText: " tab to write title  ",
                                        prefixIcon: const Icon(Icons.edit,color: Colors.orangeAccent,),
                                      hintStyle: Theme.of(context).textTheme.bodySmall
                                    ),controller: title,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsetsDirectional.only(top: 5,bottom: 5),
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      color: Colors.transparent,
                                      width: 83,
                                      height: 60,
                                      child: OutlinedButton(
                                        onPressed: (){
                                          cubit.getImg();
                                        },
                                        child: const Text ('Select Picture'),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15,),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            if (state is LoadingMemoryUploadState)
                              const LinearProgressIndicator(),
                            const SizedBox(height: 5,),
                            Card(
                              elevation: 5,
                              child: SizedBox(
                                height: 50,
                                width: 300,
                                child: OutlinedButton(
                                  onPressed: (){
                                    var currentDate = DateTime.now();

                                       cubit.uploadMemory(title: title.text,date:
                                       DateFormat("yyy-MM-dd KK:mm a")
                                           .format(currentDate)
                                           .toString()
                                    );

                                       if (cubit.memoryPic == null )
                                       {
                                       Fluttertoast.showToast(msg: "Please select picture ");
                                       }else {
                                         Fluttertoast.showToast(msg: " Done , check feeds ",backgroundColor: Colors.orangeAccent);

                                       }
                                       title.clear();

                                  },
                                  child: const Text ('Create Your Memories'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              children: [
                                 Text(" \t # Memories (: \t ",
                                   style: TextStyle(
                                       color: Colors.blue.shade900,fontStyle: FontStyle.italic,
                                       fontWeight: FontWeight.w700,height: 3
                                   ),),
                              ],
                            ),
                            const SizedBox(height: 20,),

                             cubit.memoriesModel!=null ?const Center(child: CircularProgressIndicator())
                                : ListView.separated(
                                itemBuilder: (context ,index) => memoryItem(cubit.memories[index],context,index)
                                ,itemCount: cubit.memories.length,
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 13,
                              ),shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ],
                        ),
                      ),
                    )


                  ],
                ),

              );
            },
          ),
        )
    );
  }
}

List <Widget> games(context) =>[


  Card(
    elevation: 4,
    child: Container(


    decoration:  BoxDecoration(

    color: Colors.grey.shade300


),

    child: OutlinedButton(onPressed: (){

    pushTo(context, Center(child: HomeScreen()) );

    }, child:const Text("CrossWord",style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

    ),
  )),

  Card(
    elevation: 4,
    child: Container(

decoration:  BoxDecoration(
    color: Colors.grey.shade300,


    ),

    child: OutlinedButton(onPressed: (){

    pushTo(context, const Center(child: Home()) );

    }, child: const Text("Select Flips",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),

    ),
  ),

  Card(
    elevation: 4,
    child: Container(


      decoration:  BoxDecoration(
          color: Colors.grey.shade300
             // , borderRadius: BorderRadius.circular(22),
    ),

    child: OutlinedButton(onPressed: (){

     pushTo(context, const Center(child: SpalshScreen()) );

    }, child:const Text("Mind Training",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),

    ),
  ),
];


class SpalshScreen extends StatelessWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      duration: 3000,
      navigateRoute: UserAsk(),
      text: 'Waiting',
      textStyle:  const TextStyle(
        fontSize: 35,
        fontFamily: 'janna',
      ),
    );
  }
}



Widget memoryItem (MemoriesModel model , context,index)=> BlocConsumer<MemoryCubit,MainMemoryStates>(
  listener: (context , state){},
  builder: (context , state){
    var cubit = MemoryCubit.get(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (  cubit.memoryPic != "")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
                child: Card(
                  elevation: 10,
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd
                    ,children: [

                    AspectRatio(
                      aspectRatio: 1,
                      child: PhotoView(
                        imageProvider: NetworkImage(model.memoryPic),
                        ),
                    ),
                    PopupMenuButton(
                        color: Colors.indigo,
                        itemBuilder:(context)=> [
                          PopupMenuItem(
                            value: 1,
                            onTap: () {
                              cubit.removePost(cubit.memoryId[index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(' Deleted')));
                            },
                            child: const Row(
                              children: [
                                Text('Delete',style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic)),
                                Spacer(),
                                Icon(IconBroken.delete)
                              ],
                            ),
                          ),]),

                  ],
                  ),
                ),
              ),
            ),
          const SizedBox(height: 10,),
          if ( cubit.memoryPic != "" )
            Text("${model.title}",style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 4,),
          if (model.memoryPic != "")
          Text("${model.date}",style: Theme.of(context).textTheme.bodySmall,),

        ],
      ),
    );
  },
);