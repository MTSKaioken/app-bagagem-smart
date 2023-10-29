// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';
//
// class ProfileImagePickerTwo extends StatefulWidget {
//   @override
//   _ProfileImagePickerState createState() => _ProfileImagePickerState();
// }
//
// class _ProfileImagePickerState extends State<ProfileImagePickerTwo> {
//   File? _pickedImage;
//
//   Future<void> _pickImage() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
//
//     if (result != null) {
//       File pickedFile = File(result.files.single.path!);
//       setState(() {
//         _pickedImage = pickedFile;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         CircleAvatar(
//           radius: 50,
//           backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,
//         ),
//         ElevatedButton(
//           onPressed: _pickImage,
//           child: Text('Selecionar Imagem'),
//         ),
//       ],
//     );
//   }
// }
//
// void main() => runApp(MaterialApp(
//   home: ProfileImagePickerTwo(),
// ));