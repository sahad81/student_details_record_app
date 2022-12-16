import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_records_app/src/database/studentlistdb.dart';

import 'package:students_records_app/src/screens/add_student_updatestudent.dart';
import 'package:students_records_app/src/screens/studentprofile.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});



  @override
  Widget build(BuildContext context) {

          return Scaffold(
            
            appBar: AppBar(
              backgroundColor: const Color(0xFF15485D),
              title: const Text("STUDENT RECORD"),
              centerTitle: true,
              actions: [
             
                IconButton(
                    onPressed: () {
                     showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            title: const Text("Reset app"),
                            content: const Text(
                                'your app will be reset. all data will be lost.'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>  Homescreen()),
                                        (route) => false);
                                  },
                                  child: const Text('CANCEL',
                                      style: TextStyle(color: Colors.black))),
                              TextButton(
                                  onPressed: () {
                                  restart();
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    Homescreen()), (Route<dynamic> route) => false);
                                    //   <! second time-->
                                   
                                

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            margin: EdgeInsets.all(15),
                                            behavior: SnackBarBehavior.floating,
                                            content: Text(
                                              'app Reseted',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )));
                                  },
                                  child: const Text(
                                    'ACCEPT',
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          )));
                    },
                    icon: const Icon(Icons.logout)),
              ],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddScreen()));
                },
                backgroundColor: const Color(0xFF15485D),
                child: const Icon(Icons.add)),
            body: Obx((() => 
               ListView.separated(
            //
                itemBuilder: (context, index) {
                  final value = studentlistNotifire.value[index];
                  final name = value.name;
                  return ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Profile(
                          image: value.image,
                          name: name,
                          age: value.age,
                          number: value.number,
                          place: value.place,
                          id: value.id),
                    )),
                    
                    leading: CircleAvatar(
                        radius: 30,
                        child: value.image.trim().isNotEmpty
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: MemoryImage(
                                    const Base64Decoder().convert(value.image)),
                              )
                            : const CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage("asset\\image1.png"))),
                    title: Text(value.name),
                    subtitle: Text(value.age),
                  );
                },
                itemCount: studentlistNotifire.value.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ))
            ),
          );

  }
}
