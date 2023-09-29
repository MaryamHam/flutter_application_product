import 'package:flutter/material.dart';
import 'package:flutter_application_product/db/offline/shared_helper.dart';
import 'package:flutter_application_product/screens/home_screen.dart';
import 'package:flutter_application_product/screens/login_screen.dart';

class SplashScren extends StatelessWidget {
  const SplashScren({super.key});

  _getData(BuildContext context){
    
    bool? isLogin = SharedHelper.prefs.getBool("isLogin");

   if(isLogin == null || !isLogin){
      Future.delayed(Duration(seconds: 4)).then((value){

       Navigator.pushReplacement(context, 
       MaterialPageRoute(builder: (context) => LoginScreen())
       );

    },);

   }else{

    Future.delayed(Duration(seconds: 4)).then((value){

       Navigator.pushReplacement(context, 
       MaterialPageRoute(builder: (context) => HomeScreen())
       );

    },);


   }

  }

  @override
  Widget build(BuildContext context) {

    _getData(context);

    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 168, 196, 196),


   body: Container(
    width: MediaQuery.sizeOf(context).width,

    child: Container(
      margin: EdgeInsets.only(top:MediaQuery.sizeOf(context).height*.34 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
    
          CircleAvatar(
            backgroundImage: AssetImage("assets/splash.jpg"),
            radius: 70,
          ),
          // Image.asset("assets/splash.jpg",
          // width: MediaQuery.sizeOf(context).width*.4,
          // height: MediaQuery.sizeOf(context).height*.4,),
    
          
          Container(
             margin: EdgeInsets.only(top:MediaQuery.sizeOf(context).height*.3 ),
            child: Text("Mobile App",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
    
        ],
      ),
    ),
   ),


    );
  }
}