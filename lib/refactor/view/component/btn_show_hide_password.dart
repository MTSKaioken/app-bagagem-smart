import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnShowHidePassword extends StatefulWidget {

  final VoidCallback onToggle;

  BtnShowHidePassword({required this.onToggle});

  @override
  _BtnShowHidePassword createState() => _BtnShowHidePassword();

}

class _BtnShowHidePassword extends State<BtnShowHidePassword> {

  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
    widget.onToggle();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: togglePasswordVisibility,
      icon: isPasswordVisible
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
    );
  }

}