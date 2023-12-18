


import 'package:flutter/material.dart';
import 'package:habit/main.dart';
import 'package:habit/pages/home.dart';
import 'package:habit/pages/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

@override
  void initState() {
    super.initState();
   log();
  }


@override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SizedBox(
        height: double.infinity,
        width: double.infinity,
          child: Image(image: AssetImage("assets/hab.png"),fit:BoxFit.cover,),
          )
        ),
    );
  } 

  

Future<void> Login() async{
 await Future.delayed(Duration(seconds: 3));
 Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (ctx){
  return Welcome();
 }));
}


Future <void> log()async{
  final _sharedperfer = await SharedPreferences.getInstance();
  
  final UserLog =_sharedperfer.getBool(SAVE_KEY_NAME);
  if(UserLog == null || UserLog == false){
   Login();   
  }else{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
} 

}