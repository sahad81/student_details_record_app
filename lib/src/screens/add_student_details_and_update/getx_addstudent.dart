
import 'dart:io';

import 'package:get/get.dart';

import 'package:students_records_app/src/screens/add_student_details_and_update/add_student_updatestudent.dart';


class addsreencntroler extends GetxController{
 File? imagefile;
   File?  imagetmb;
   File? tembgallery;
 
 
    

@override
  void onReady() {
 AddScreen().init();
    super.onReady();
  }
  // @override
  // void onInit() {
  // Future.delayed(Duration.zero,(){
  // imagefile=null;
  // update();
  // // AddScreen().initwithconstracter();
  // });
  // }

  


 void tunbtoimagecam(){
  imagefile=imagetmb;
  update();
 }
  void tunbtoimagegal(){
  imagefile=tembgallery;
  update();
 }
 
}

