import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:bagagem_smart/refactor/model/usuario.dart';

class NavbarLateral extends StatelessWidget {
  final BuildContext parentContext;

  final Usuario usuarioLogado;

  /* construtor */
  NavbarLateral({required this.parentContext, required this.usuarioLogado});

  ImageProvider<Object>? _getBackgroundImage(){
    if (usuarioLogado.imagemPerfilBase64 != null) {
      Uint8List bytes = base64Decode(usuarioLogado.imagemPerfilBase64.toString());
      return MemoryImage(bytes);
    } else {
      return NetworkImage('https://cdn-icons-png.flaticon.com/512/17/17004.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.transparent, // Cor de fundo do Text
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
            child: Text(
              'Perfil',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          UserAccountsDrawerHeader(
            accountName: Text(
              usuarioLogado.nome,
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(usuarioLogado.email,
                style: TextStyle(color: Colors.black)),
            decoration: BoxDecoration(
              color: Colors.transparent, // Altere aqui a cor de fundo
            ),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: _getBackgroundImage(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit_square),
            title: Text('Editar seu perfil'),
            onTap: () => {
              Navigator.pushNamed(parentContext, "/editar", arguments: usuarioLogado)
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.verified_user),
          //   title: Text('Informações'),
          //   onTap: () => {
          //     Navigator.pushNamed(parentContext, "/localizacao")
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Configurações'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Termos & Condições'),
            onTap: () => {
              Navigator.pushNamed(parentContext, "/politica/condicoes")
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Política de Privacidade'),
            onTap: () => {
              Navigator.pushNamed(parentContext, "/politica/privacidade")
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () => {Navigator.pushNamed(parentContext, "/")},
          ),
        ],
      ),
    );
  }
}
