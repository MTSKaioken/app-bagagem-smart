import 'package:bagagem_smart/refactor/exception/validation_exception.dart';
import 'package:bagagem_smart/refactor/view/component/btn_show_hide_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bagagem_smart/refactor/view/component/profile_image_picker.dart';

import '../controller/usuario_controller.dart';
import '../model/usuario.dart';
import '../util/util.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfil createState() => _EditarPerfil();
}

class _EditarPerfil extends State<EditarPerfil> {
  UsuarioController usuarioController = UsuarioController();
  late DateTime selectedDate;
  final idUsuarioValue = TextEditingController();
  final nomeInputValue = TextEditingController();
  final dtNascimentoInputValue = TextEditingController();
  final emailInputValue = TextEditingController();
  final senhaInputValue = TextEditingController();
  final senhaRepetidaInputValue = TextEditingController();
  String? imagemPerfilBase64;
  bool isPasswordVisible = false;
  bool isPasswordConfirmationVisible = false;

  final GlobalKey<State<ProfileImagePicker>> _filhoKey =
      GlobalKey<State<ProfileImagePicker>>();

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

  void atualizar() async {
    try {
      Usuario usuario = Usuario(
          idUsuario: idUsuarioValue.text,
          email: emailInputValue.text,
          nome: nomeInputValue.text,
          senha: senhaInputValue.text,
          dtNascimento: dtNascimentoInputValue.text,
          imagemPerfilBase64: imagemPerfilBase64);

      usuarioController.isCadastroValido(
        nomeInputValue.text,
        emailInputValue.text,
        senhaInputValue.text,
        senhaRepetidaInputValue.text,
      );

      await usuarioController.cadastrarUsuario(usuario);
      _notify(context, "Notificação", "Atualizado com sucesso!");
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

  void setarBase64ImagemPerfil() {}

  carregarDadosDoUsuario(BuildContext context, Usuario usuarioLogado) {
    idUsuarioValue.text = usuarioLogado.idUsuario;
    nomeInputValue.text = usuarioLogado.nome;
    dtNascimentoInputValue.text = usuarioLogado.dtNascimento;
    emailInputValue.text = usuarioLogado.email;
    senhaInputValue.text = usuarioLogado.senha;
    senhaRepetidaInputValue.text = usuarioLogado.senha;
    _filhoKey.currentState?.widget
        .createState()
        .setImage(usuarioLogado.imagemPerfilBase64 ?? "");
  }

  @override
  Widget build(BuildContext context) {
    final Usuario usuario =
        ModalRoute.of(context)!.settings.arguments as Usuario;
    carregarDadosDoUsuario(context, usuario);

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
            'Editar',
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
                  ProfileImagePicker(
                    key: _filhoKey,
                    imagemInicial: usuario.imagemPerfilBase64,
                    onSelected: (image) {
                      imagemPerfilBase64 = image;
                    },
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  TextField(
                    controller: nomeInputValue,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)),
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
                      dtNascimentoInputValue.text =
                          '${Util.lpad(selectedDate.day.toString(), 2, padChar: '0')}/${Util.lpad(selectedDate.month.toString(), 2, padChar: '0')}/${selectedDate.year}'
                    },
                    decoration: InputDecoration(
                        labelText: 'Data Nascimento',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_month)),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  TextField(
                    controller: emailInputValue,
                    enabled: false,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[100],
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.mail)),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                  ),
                  Center(
                    child: TextFormField(
                      controller: senhaInputValue,
                      obscureText: !isPasswordVisible,
                      enabled: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[100],
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
                      enabled: false,
                      decoration: InputDecoration(
                          labelText: 'Confirmar senha',
                          filled: true,
                          fillColor: Colors.blueGrey[100],
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
                    child: Text('Atualizar'),
                    onPressed: atualizar,
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
