import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students_records_app/src/database/studentlistdb.dart';
import 'package:students_records_app/src/model/studentmodel.dart';
import 'package:students_records_app/src/screens/homescreen.dart';

class AddScreen extends StatefulWidget {
 final int? noteid;
  final String? name;
  final String? age;
  final String? number;
  final String? place;
   final String? image;
  const AddScreen({super.key, this.noteid,  this.name,  this.age,  this.number,  this.place, this.image});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  File? imagefile;
  final ImagePicker _picker = ImagePicker();
  final namecontroler = TextEditingController();
  final agecontroler = TextEditingController();
 final numbercontroler = TextEditingController();
   final placecontroler = TextEditingController();

  final picker = ImagePicker();


@override
  void initState() {
   if(widget.noteid!=null){

placecontroler.text=widget.place.toString();
 namecontroler.text=widget.name.toString();
agecontroler.text=widget.age.toString();
numbercontroler.text=widget.number.toString();

   }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color(0xFF15485D),
        title: Text(
        widget.noteid==null?  "ADD STUDENT DETAILS":"UPDATE STUDENT DETAILS"
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  widget.noteid==null?
                  profieimage(context)
                  :const SizedBox(),
                  const SizedBox(
                    height: 30,
                  ),
                 
                  TextFormField(
                      controller: namecontroler,
                      decoration: const InputDecoration(
                        labelText: "Name",
                          border: OutlineInputBorder(), hintText: 'Name')),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller:agecontroler,
                    decoration: const InputDecoration(
                      labelText: "Age",
                        border: OutlineInputBorder(), hintText: 'Age '),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: numbercontroler,
                    decoration: const InputDecoration(
                      labelText: "Number",
                        border: OutlineInputBorder(), hintText: 'Number'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                
                    controller: placecontroler,
                    decoration: const InputDecoration(
                      labelText: "Place",
                        border: OutlineInputBorder(), hintText: 'place'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      butnclicked();
                    },
                    style: TextButton.styleFrom(
                       backgroundColor: const Color(0xFF15485D),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 10, bottom: 10),
                      child:  Text(
                     widget.noteid==null?   'SUBMIT':"update",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> butnclicked() async {
    final name = namecontroler.text.trim();
    final age = agecontroler.text.trim();
     final num = numbercontroler.text.trim();
      final place = placecontroler.text.trim();
   if(widget.noteid==null){
     if (name.isEmpty || age.isEmpty||num.isEmpty||place.isEmpty) {
      return;
    } else {
 final model= Modelstudent(name: name, age: age, place: place, number: num,image: img);
addstudent(model);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homescreen(),));
      //  final student =hivestudentdetails(age: _age, name: _name);

      // addstudent(student);
    }
   }
   else{
     final model= Modelstudent(name: name, age: age, place: place, number: num,image: img,id: widget.noteid);
     updatestudentdata(widget.noteid!, model);
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homescreen(),));
   }
  }

  Widget profieimage(BuildContext context1) {
    return Stack(
      children: <Widget>[
        imagefile == null
            ? const CircleAvatar(
                radius: 100, backgroundImage: AssetImage("asset\\image1.png"))
            : CircleAvatar(
                radius: 100,
                backgroundImage: FileImage(
                  File(imagefile!.path),
                ),
              ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
              onTap: () {
                showBottom(context);
              },
              child: const Icon(
                Icons.camera_alt,
                size: 40,
                color:   Color(0xFF15485D),
              )),
        ),
      ],
    );
  }

  Future<void> showBottom(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          width: double.infinity,
          height: 150,
          color:   Color(0xFF15485D),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            const Text(
              'Choice Profile Photo',
              style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),

//=========set the position bottomsheet===========//
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    camara();
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.camera,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  label: const Text(
                    'Camera',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                TextButton.icon(
                    onPressed: () {
                      gallery();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.image,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    label: const Text(
                      'Gallery',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ]),
        );
      },
    );
  }

  //===================picked image from Camara ==========================
  Future<void> camara() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }

    final imagetmb = File(image.path);
    setState(() {
      imagefile = imagetmb;
    });
    imageadd(image); 
  }
//======================pic image from gallery===========

  Future gallery() async {
    XFile? pikedfileimage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pikedfileimage == null) {
      return;
    }
    final tembgallery = File(pikedfileimage.path);
    setState(() {
      imagefile = tembgallery;
    });
    imageadd(pikedfileimage);
  }
  
   String img="";

   imageadd(XFile image) async{
     
     if(image == null){
       return;
     }else{
      
       final bytes = File(image.path).readAsBytesSync();
       img = base64Encode(bytes);
     }
}
}
