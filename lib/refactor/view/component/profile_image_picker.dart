import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatefulWidget {
  final Function(String?) onSelected;

  final Function(String?)? setImage;

  final String? imagemInicial;

  ProfileImagePicker({Key? key, required this.onSelected, this.setImage, this.imagemInicial})
      : super(key: key);

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  final ImagePicker _imagePicker = ImagePicker();
  PickedFile? _pickedImage;
  String? encodedImage;

  ImageProvider? imagemSelecionada;

  Future<void> setImage(String base64) async {
    setState(() {
      encodedImage = base64;
    });
  }

  Future<void> _getImage() async {
    final pickedImage =
        await _imagePicker.getImage(source: ImageSource.gallery);
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


  void _getBackgroundImage(String? base64) {
    if (_pickedImage != null) {
      setState(() {
        imagemSelecionada =
            FileImage(File.fromUri(Uri.file(_pickedImage!.path)));
      });
    } else if (base64 != null && base64!.isNotEmpty) {
      setState(() {
        imagemSelecionada = MemoryImage(base64Decode(base64!));
      });
    } else {
      setState(() {
        // Sem imagem (nula)
        imagemSelecionada = null;
      });
    }
  }

  Widget circleAvatar(BuildContext context) {

    _getBackgroundImage(widget.imagemInicial);

    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.grey,
      backgroundImage: imagemSelecionada,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                if (_pickedImage != null) {
                  setState(() {
                    _pickedImage = null;
                  });
                } else {
                  _getImage();
                }
              },
              child: Icon(
                _pickedImage == null
                    ? FontAwesomeIcons.plusCircle
                    : FontAwesomeIcons.minusCircle,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
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
          child: circleAvatar(context),
        ),
      ],
    );
  }
}
