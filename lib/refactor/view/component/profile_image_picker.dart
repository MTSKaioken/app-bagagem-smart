import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatefulWidget {

  final Function(String?) onSelected;

  ProfileImagePicker({required this.onSelected});

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  final ImagePicker _imagePicker = ImagePicker();
  PickedFile? _pickedImage;

  String? encodedImage;

  Future<void> _getImage() async {
    final pickedImage = await _imagePicker.getImage(source: ImageSource.gallery);
    encodedImage = await pickedImageToBase64(pickedImage!.path);
    await widget.onSelected(encodedImage);


    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  Future<String?> pickedImageToBase64(String? imagePath) async {
    if (imagePath == null) return null;

    File imageFile = File(imagePath);
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
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
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      if(_pickedImage != null){
                        setState(() {
                          _pickedImage = null;
                        });
                      } else {
                        _getImage();
                      }
                    },
                    child: Icon(
                      _pickedImage == null ? FontAwesomeIcons.plusCircle : FontAwesomeIcons.minusCircle,
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
