import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String? idUsuario;
  String nome;
  String email;
  String senha;


  factory Usuario.fromSnapshot(DocumentSnapshot snapshot) {
    return Usuario(
      idUsuario: snapshot['id_usuario'],
      nome: snapshot['nome'],
      email: snapshot['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }



  // construtor da classe Usuario, que pode receber o email e a senha... mas se
  // não forem passados vão ser setados como nulo (por conta do ? junto a tipagem
  Usuario({
    this.idUsuario,
    required this.email,
    this.senha = '',
    this.nome = 'Não informado'
  });

  String getEmail(){
    return this.email;
  }

  String getSenha(){
    return this.senha;
  }

  String getNome(){
    return this.nome;
  }

}