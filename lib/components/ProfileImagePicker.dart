import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfileImagePicker extends StatefulWidget {

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  final ImagePicker _imagePicker = ImagePicker();
  PickedFile? _pickedImage;

  Future<void> _getImage() async {
    final pickedImage = await _imagePicker.getImage(
        source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  void _removeImage() {
    setState(() {
      _pickedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
            backgroundImage: _pickedImage != null ? FileImage(
                File.fromUri(Uri.file(_pickedImage!.path))) : null,
          ),
          onTap: _getImage,
        ),
        ElevatedButton(
          onPressed: _getImage,
          child: Text('Selecionar imagem'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
        ),
      ],
    );
  }
}

void main() =>
    runApp(MaterialApp(
      home: ProfileImagePicker(),
    ));