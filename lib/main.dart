import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:students_records_app/src/database/studentlistdb.dart';
import 'package:students_records_app/src/model/studentmodel.dart';

import 'package:students_records_app/src/screens/homescreen.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  if (!Hive.isAdapterRegistered(ModelstudentAdapter().typeId)) {
    Hive.registerAdapter(ModelstudentAdapter());
  }
  await getAllstudents();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blueGrey
      ),
      home:  Homescreen()
    );
  }
}

