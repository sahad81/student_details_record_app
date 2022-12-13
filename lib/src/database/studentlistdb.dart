
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:students_records_app/src/model/studentmodel.dart';

 const studentdbName="studentdb";


    ValueNotifier<List<Modelstudent>> studentlistNotifire =
      ValueNotifier([]);
//========== add all student list ==============//
Future <void> addstudent(Modelstudent value) async{
   final  studentDB = await Hive.openBox<Modelstudent>('Student_db');
   final _id = await studentDB.add(value);
      studentlistNotifire.value.add(value);
   log(value.toString());
   value.id = _id;
   studentlistNotifire.notifyListeners();
  // await studentDB.put(value.id, value);


   log(studentlistNotifire.value.length.toString());
}


  Future<void> getAllstudents()async{
    log("gii");
    final  studentDB = await Hive.openBox<Modelstudent>('Student_db');
    studentlistNotifire.value.clear();
    studentlistNotifire.value.addAll(studentDB.values);
  studentlistNotifire.notifyListeners();
  }
  Future<void> delete(int id)async{
  final studentdb =
        await Hive.openBox<Modelstudent>("Student_db");
    studentdb.delete(id);
   
  }
Future<void> restart() async {
    final reset =
        await Hive.openBox<Modelstudent>("Student_db");

    studentlistNotifire.value.clear();

    await reset.clear();

   getAllstudents();
    //  print('reset');
  }
   Future<void>updatestudentdata(int  id , Modelstudent value)async{
    
     final studentDB = await Hive.openBox<Modelstudent>('student_db');
    await studentDB.put(id, value);
    studentlistNotifire.notifyListeners;
     getAllstudents();
  }

