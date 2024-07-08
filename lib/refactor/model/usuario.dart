import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String idUsuario;
  String nome;
  String dtNascimento;
  String email;
  String senha;


  factory Usuario.fromSnapshot(DocumentSnapshot snapshot) {
    return Usuario(
      idUsuario: snapshot.id,
      nome: snapshot['nome'],
      email: snapshot['email'],
      dtNascimento: snapshot['dt_nascimento']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
      'dtNascimento': dtNascimento,
    };
  }

  // construtor da classe Usuario, que pode receber o email e a senha... mas se
  // não forem passados vão ser setados como nulo (por conta do ? junto a tipagem
  Usuario({
      this.idUsuario = '',
      required this.email,
      this.dtNascimento = '',
      this.senha = '',
      this.nome = 'Não informado'});

  String getEmail() {
    return email;
  }

  String getSenha() {
    return senha;
  }

  String getNome() {
    return nome;
  }

  String getDtNascimento() {
    return dtNascimento;
  }
}
