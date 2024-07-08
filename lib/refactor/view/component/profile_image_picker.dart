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
    final pickedImage =
        await _imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: _getImage,
          hoverColor: Colors.pink,
          onHover: (value) {
            _getImage();
          },
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey,
            backgroundImage: _pickedImage != null
                ? FileImage(File.fromUri(Uri.file(_pickedImage!.path)))
                : null,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  right: -3,
                  child: InkWell(
                    onTap: () {
                      if(_pickedImage != null){
                        print('imagem selecionada');
                        setState(() {
                          _pickedImage = null;
                        });
                      } else {
                        print('imagem vazia');
                        _getImage();
                      }
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
