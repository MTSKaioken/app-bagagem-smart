import 'package:flutter/material.dart';

class NavbarLateral extends StatelessWidget {
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
              'Seu Nome',
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text('SeuEmail@exemplo.com.br',
                style: TextStyle(color: Colors.black)),
            decoration: BoxDecoration(
              color: Colors.transparent, // Altere aqui a cor de fundo
            ),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/17/17004.png',
                )),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Editar seu perfil'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Informações'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Termos & Condições'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Política de Privacidade'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
