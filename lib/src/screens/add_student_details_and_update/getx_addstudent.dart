

// import 'dart:convert';
// import 'dart:io';


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';


// class addsreencntroler extends GetxController{
//  File? imagefile;
//    File?  imagetmb;
//    File? tembgallery;
//   String img="";
//    final picker = ImagePicker();
//      final ImagePicker _picker = ImagePicker();

// @override
//   void onReady() {
//    img="";
//    imagefile=null;

//     super.onReady();
//   }
//   // @override
//   // void onInit() {
//   // Future.delayed(Duration.zero,(){
//   // imagefile=null;
//   // update();
//   // // AddScreen().initwithconstracter();
//   // });
//   // }

  


//  void tunbtoimagecam(){
//   imagefile=imagetmb;
//   update();
//  }
//   void tunbtoimagegal(){
//   imagefile=tembgallery;
//   update();
//  }
//    imageadd(XFile image) async{
     
//      if(image == null){
//        return;
//      }else{
      
//        final bytes = File(image.path).readAsBytesSync();
//        img = base64Encode(bytes); 

//      }
// }

//     Future<void> camara() async {
//     XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image == null) {
//       return;
//     }

//     imagetmb = File(image.path);

//    tunbtoimagecam();
//     imageadd(image); 
//   }
//      Future gallery() async {
//     XFile? pikedfileimage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pikedfileimage == null) {
//       return;
//     }
//   tembgallery= File(pikedfileimage.path);
// tunbtoimagegal();

// imageadd(pikedfileimage);
//   }
  
//   Future<void> showBottom(BuildContext context) async {
//     showModalBottomSheet(
//       context: context,
//       builder: (ctx) {
//         return Container(
//           width: double.infinity,
//           height: 150,
//           color:   const Color(0xFF15485D),
//           child: Column(children: [
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               'Choice Profile Photo',
//               style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 10,
//             ),

// //=========set the position bottomsheet===========//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TextButton.icon(
//                   onPressed: () {
//                 camara();
//                     Navigator.of(context).pop();
//                   },
//                   icon: const Icon(Icons.camera,
//                       color: Color.fromARGB(255, 255, 255, 255)),
//                   label: const Text(
//                     'Camera',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 70,
//                 ),
//                 TextButton.icon(
//                     onPressed: () {
//                   gallery();
//                       Navigator.of(context).pop();
//                     },
//                     icon: const Icon(
//                       Icons.image,
//                       color: Color.fromARGB(255, 255, 255, 255),
//                     ),
//                     label: const Text(
//                       'Gallery',
//                       style: TextStyle(color: Colors.white),
//                     )),
//               ],
//             ),
//           ]),
//         );
//       },
//     );
//   }

//    profieimage(BuildContext context1) {
//     return Stack(
//       children: <Widget>[
//        imagefile == null
//             ? const CircleAvatar(
//                 radius: 100, backgroundImage: AssetImage("asset\\image1.png"))
//             : CircleAvatar(
//                 radius: 100,
//                 backgroundImage: FileImage(
//                   File( imagefile!.path),
//                 ),
//               ),
//         Positioned(
//           bottom: 20,
//           right: 20,
//           child: InkWell(
//               onTap: () {
//                 showBottom(context1);
//               },
//               child: const Icon(
//                 Icons.camera_alt,
//                 size: 40,
//                 color:   Color(0xFF15485D),
//               )),
//         ),
//       ],
//     );
    
//   }


// }

