import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:remindme/Shared/Styles/themes.dart';
import 'Module/Home/HomeLayout/TasksScreen/TaskComponents/constants.dart';
import 'Module/Home/HomeLayout/TasksScreen/TasksCubit/notes cubit.dart';
import 'Module/Home/HomeLayout/TasksScreen/TasksModel/note_model.dart';
import 'Module/Home/NavigationBar/NavCubit/NavCubit.dart';
import 'Module/Home/NavigationBar/NavCubit/VavStates.dart';
import 'Module/Home/NavigationBar/Navigation_Screen.dart';
import 'Module/LoginPage/LoginScreen.dart';
import 'Module/onBoarding/On_Boarding.dart';
import 'Shared/Network/Remote/Dio/Dio_Helper.dart';
import 'Shared/Split/Constants/Constants.dart';
import 'Shared/Network/Remote/SharedPre/Shared_Pre.dart';
void main() async {
  dynamic widget;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  DioHelper.initDio();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  // bool? isDark;
  await CacheHelper.initShared();
  onBoarding = CacheHelper.getData("onBoarding");
  id = CacheHelper.getData("id");
  bool ? isDark = CacheHelper.getData("isDark");
  if (onBoarding !=null){
    if (id != null  ){ widget = const NavigationBarScreen();}
    else{ widget =  const LoginScreen();}
  }else {widget = const Boarding();}

  runApp(RemindMe(
    widget,
    isDark,
  ),
  );

}
class RemindMe extends StatelessWidget {

   dynamic startWidget;

  bool ? isDark;
   RemindMe(
       this.startWidget,
       this.isDark, {super.key}
       );


  @override
  Widget build(BuildContext context) {
    return   MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> NavCubit()..mode(isFromShared: isDark)),
      BlocProvider(create: (context) => NotesCubit()),

    ],
        child: BlocConsumer <NavCubit,NavMainStates>
        (
        listener:(context,state ){} ,
    builder: (context,state){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     darkTheme: darkTheme,
        theme: lightTheme  ,
    // lightTheme,
    themeMode: NavCubit.get(context).selectMode ? ThemeMode.light:ThemeMode.dark,
    home :

      startWidget  ,

    ) ;} )
    );
    }
    }


