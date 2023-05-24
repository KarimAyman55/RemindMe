import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Shared/Network/Remote/SharedPre/Shared_Pre.dart';
import '../../Shared/Split/Components.dart';
import '../LoginPage/LoginScreen.dart';

class BoardingModel {
  String image;
  String text;

  BoardingModel(
      this.image,
      this.text,
      );
}

class Boarding extends StatefulWidget {
  const Boarding({super.key});


  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {

  bool isLast = false;
  List <BoardingModel> boardingScreen = [
    BoardingModel('assets/images/Logo.png', 'First Select Your Status \n <patient - patient Relative> ', ),
    BoardingModel('assets/images/Logo.png', 'Dear patient for our Services do test first ', ),
    BoardingModel('assets/images/Logo.png', 'For Any Problem connect with Authority Treatment ', ),
  ];
  void submitData (){
    CacheHelper.saveData("onBoarding", true).then((value) {
      if (value == true){
        pushAndFinish(context, const LoginScreen());

      }
    });

  }

  var boardingController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title:
          const  Padding(
            padding: EdgeInsets.only(right: 60),
            child:  Text
              (' Welcome      \t   Remind Me ',
              style:  TextStyle(
                 fontFamily :"janna",
                fontSize: 18,
                color: Colors.orange
              ),),
          ),
          centerTitle: true,
          actions: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade300,
              radius: 23,
              child: TextButton (
                onPressed: (){
                  submitData();
                },
                child:  const Text ('Skip',style: TextStyle(
                    color: Colors.white
                    ,
                    fontSize: 12
                )),
              ),
            ),
          )],
        ),

        body: PageView.builder(itemBuilder: ( (context, index) => boardingItem (boardingScreen[index])  ),
          itemCount:boardingScreen.length ,controller: boardingController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index){
            if( index == boardingScreen.length-1  ){
              setState(() {
                isLast =true;
              });
            }
            else {

              setState(() {
                isLast =false;

              });}
          },)

    );
  }

  Widget boardingItem (BoardingModel model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Expanded(
          child:  Stack(
            clipBehavior: Clip.none,
          // fit: StackFit.expand,

            children: [
              Image(image: AssetImage(model.image),
                fit: BoxFit.scaleDown,
                color: Colors.teal.shade300,
             // height: double.infinity,
               // width: 400,
              ),
            ],
          ),
        ),
        //const  SizedBox(height: 30,),
        Text(model.text,maxLines: 2,style: const TextStyle(
          color: Colors.black,fontSize: 15,fontFamily: "Janna"
        )),
        Row(
          children: [
            const  SizedBox(height: 85,),
            SmoothPageIndicator(controller: boardingController ,
                count: boardingScreen.length,effect:const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  expansionFactor: 3,
                  spacing: 5,
                  dotWidth: 10,
                  dotHeight: 10,
                  activeDotColor: Colors.deepOrange,
                ) ),
            const Spacer(),
            FloatingActionButton(onPressed: (){
              if (isLast) {
                submitData();
              } else {
                boardingController.nextPage(duration: const Duration(milliseconds: 950),
                    curve: Curves.fastLinearToSlowEaseIn);
              } } ,backgroundColor: Colors.orange,

              child: const Icon  (Icons.arrow_forward_ios))

          ],)

      ],),
  );
}



