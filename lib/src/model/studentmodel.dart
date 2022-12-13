

import 'package:hive_flutter/hive_flutter.dart';

part 'studentmodel.g.dart';
   @HiveType(typeId: 1)
class Modelstudent {

@HiveField(0)
int? id;
@HiveField(1)
 final String name;
 
 @HiveField(2)
 final String age;
 @HiveField(3)
 final String place;
 @HiveField(4)
 final String number;

 @HiveField(5)
 final String image;

  Modelstudent({required this.name,
  this.id,required this.age,required this.place,required this.number,required this.image});
 
 



}