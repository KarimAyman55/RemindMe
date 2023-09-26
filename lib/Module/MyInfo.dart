import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Shared/Styles/Icons.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
      body: SafeArea(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children :[
          Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title:  Padding(
              padding: const EdgeInsetsDirectional.only(top: 7.0),
              child: Text('Developed By : ', style: Theme.of(context).textTheme.bodyMedium
              ),
            ) ,
            subtitle: Padding(
              padding:const EdgeInsetsDirectional.only(start: 27),
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text ("Karim Ayman  ", style:
                      Theme.of(context).textTheme.bodyMedium
                      ),
                      const Icon(IconBroken.profile,color: Colors.orangeAccent,size: 17,) ,
                      const SizedBox(width: 5,),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  InkWell(
                    onTap: (){
                      launch("https://www.facebook.com/karim.ayman.9889261?mibextid=ZbWKwL");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text ("   FaceBook  ", style:
                        Theme.of(context).textTheme.bodyMedium
                        ),
                        const Icon(Icons.facebook,color: Colors.orangeAccent) ,

                      ],
                    ),
                  ),
                  const SizedBox(height: 6,),
                  InkWell(
                    onTap: (){
                      launch("https://wa.me/+201157643398/?text=${Uri.parse("Hello")}");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text ("   WhatsApp  ", style:
                        Theme.of(context).textTheme.bodyMedium
                        ),
                        Image.asset('assets/images/whatsapp.png',width: 28,height: 30,),

                      ],
                    ),
                  ),
                ],
              ),
            ),

          ),
        ),
        const SizedBox(height: 10,),
          Container(
            height: 1,
            color: Colors.black38,
          ),
          const SizedBox(height: 20,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Phone : 01157643398",style: TextStyle(color: Colors.indigo),),
              SizedBox(width: 30,),
              Text("Age : 23      Egypt ",style: TextStyle(color: Colors.indigo),),

            ],
          ),
          const SizedBox(height: 25,),

        ]),
    ));
  }
}
