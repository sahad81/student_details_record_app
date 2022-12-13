import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:students_records_app/src/database/studentlistdb.dart';
import 'package:students_records_app/src/screens/add_student_updatestudent.dart';
import 'package:students_records_app/src/screens/homescreen.dart';

class Profile extends StatelessWidget {
  final String name;
  final String age;
  final String number;
  final String place;
  final int? id;
  final String image;
  const Profile({
    this.id,
    required this.image,
    Key? key,
    required this.name,
    required this.age,
    required this.number,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Material(
          color: const Color(0xFF15485D),
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddScreen(
                                  noteid: id,
                                  age: age,
                                  image: image,
                                  name: name,
                                  number: number,
                                  place: place,
                                )));
                      },
                      icon: Icon(Icons.edit),
                      label: const Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton.icon(
                      onPressed: () {
       showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: const Text(
                                    'Delete',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  content: Text(
                                    'are you sure to delete $name student details?',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 32, 28, 28)),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'cancel',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          delete(id!);
                                          getAllstudents();
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    Homescreen()), (Route<dynamic> route) => false);
                                        },
                                        child: const Text('delete',
                                            style: TextStyle(
                                                color: Colors.black))),
                                  ]);
                            });
                      },

                    
                      icon: Icon(Icons.delete),
                      label: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF15485D),
        title: const Text('Profile'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      'PROFILE',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                        radius: 80,
                        child: image.trim().isNotEmpty
                            ? CircleAvatar(
                                radius: 80,
                                backgroundImage: MemoryImage(
                                    const Base64Decoder().convert(image)),
                              )
                            : const CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage("asset\\image1.png"))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '     NAME  :  $name',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    '     CLASS  :  $age',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    '     NUMBER  :  $number',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    '     PLACE  :  $place',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
