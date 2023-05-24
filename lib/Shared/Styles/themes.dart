import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
var lightTheme = ThemeData(
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.white,),

  scaffoldBackgroundColor: Colors.white,
  appBarTheme:const AppBarTheme(
    systemOverlayStyle : SystemUiOverlayStyle(
      statusBarColor: Colors.black54,
// statusBarBrightness: Brightness.light,

    ),
    titleTextStyle: TextStyle(
      color: Colors.black,),
    elevation: 0,
    color: Colors.white,

  ),
  backgroundColor: Colors.white60,
  iconTheme: const IconThemeData(color : Colors.black),
  primarySwatch: Colors.orange,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white60,
    type: BottomNavigationBarType.fixed,


  ),
  textTheme: const TextTheme(

      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )
  ),
  fontFamily: 'Janna',
); //LightTheme

var darkTheme =ThemeData(


scaffoldBackgroundColor: Colors.black26,

fontFamily: 'Janna',
appBarTheme:AppBarTheme(

systemOverlayStyle : SystemUiOverlayStyle(
statusBarColor : HexColor( '333739'),
systemNavigationBarColor: Colors.white,
statusBarBrightness: Brightness.light,

),
backgroundColor: Colors.black54,
elevation: 1,
titleTextStyle:const TextStyle(
color: Colors.orange,),
iconTheme: const IconThemeData(
color: Colors.white
),

)

,
    textTheme: const TextTheme(titleMedium: TextStyle(
        fontFamily: "janna",
        fontSize: 16,
        color: Colors.white
    ),
        bodySmall:  TextStyle( color: Colors.white)
     )
,drawerTheme: const DrawerThemeData(backgroundColor: Colors.grey,)
    ,bottomNavigationBarTheme:const BottomNavigationBarThemeData(backgroundColor: Colors.white38,)
,
);
