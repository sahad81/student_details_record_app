
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:students_records_app/src/screens/homescreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100] ,
      body: AnimatedSplashScreen(
      
          splash: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children:[
           
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                     "S T U D E N T  R E C O R D E R",
                     style: TextStyle(
                         fontSize: 30,
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontFamily: "Cormorant"
                         ),
                   
                 ),
              ),
                 SizedBox(
                  height: 10,
                ),
              
                  
              ],
            ),
          ),
          backgroundColor: Colors.white,
          splashIconSize: 300,
          nextScreen:  Homescreen()),
    );
  }
}