import 'package:bagagem_smart/refactor/exception/validation_exception.dart';
import 'package:bagagem_smart/refactor/view/component/btn_show_hide_password.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/usuario_controller.dart';
import '../model/usuario.dart';
import 'component/profile_image_picker.dart';

class Cadastro extends StatefulWidget {
  @override
  _Cadastro createState() => _Cadastro();
}

class _Cadastro extends State<Cadastro> {

  UsuarioController usuarioController = UsuarioController();
  late DateTime selectedDate;
  final nomeInputValue = TextEditingController();
  final dtNascimentoInputValue = TextEditingController();
  final emailInputValue = TextEditingController();
  final senhaInputValue = TextEditingController();
  final senhaRepetidaInputValue = TextEditingController();

  bool isPasswordVisible = false;
  bool isPasswordConfirmationVisible = false;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  togglePassword() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  togglePasswordConfirmation() {
    setState(() {
      isPasswordConfirmationVisible = !isPasswordConfirmationVisible;
    });
  }

  void _notify(BuildContext context, String tituloModal, String mensagemModal) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(
            tituloModal,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          message: Text(
            mensagemModal,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
          cancelButton: CupertinoActionSheetAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void cadastrar() async {
    try {
      Usuario usuario = Usuario(
        idUsuario: "",
        email: emailInputValue.text,
        nome: nomeInputValue.text,
        senha: senhaInputValue.text,
      );

      usuarioController.isCadastroValido(
        nomeInputValue.text,
        emailInputValue.text,
        senhaInputValue.text,
        senhaRepetidaInputValue.text,
      );

      await usuarioController.cadastrarUsuario(usuario);
      _notify(context, "Notificação", "Cadastrado com sucesso!");
    } on ValidationException catch (e) {
      _notify(context, "Notificação", e.getMessage());
    }
  }

  // todo validar melhor data selecionada
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1899),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bagagem Smart',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Cadastro',
            textDirection: TextDirection.ltr,
          ),
          backgroundColor: Colors.black87,
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileImagePicker(),
                  TextField(
                    controller: nomeInputValue,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person)
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  TextField(
                    controller: dtNascimentoInputValue,
                    readOnly: true,
                    onTap: () => {
                      _selectDate(context),
                      dtNascimentoInputValue.text = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                    },
                    decoration: InputDecoration(
                      labelText: 'Data Nascimento',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_month)
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  TextField(
                    controller: emailInputValue,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.mail)
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  Center(
                    child: TextFormField(
                      controller: senhaInputValue,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                        suffixIcon:
                            BtnShowHidePassword(onToggle: togglePassword),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  Center(
                    child: TextFormField(
                      controller: senhaRepetidaInputValue,
                      obscureText: !isPasswordConfirmationVisible,
                      decoration: InputDecoration(
                          labelText: 'Confirmar senha',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: BtnShowHidePassword(
                              onToggle: togglePasswordConfirmation)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  ElevatedButton(
                    child: Text('Cadastrar'),
                    onPressed: cadastrar,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      fixedSize: Size(400, 70),
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
