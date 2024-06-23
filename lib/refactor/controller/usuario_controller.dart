import 'package:bagagem_smart/refactor/exception/validation_exception.dart';
import 'package:bagagem_smart/refactor/model/usuario.dart';
import 'package:email_validator/email_validator.dart';

import '../dao/usuario_dao.dart';

class UsuarioController {

  cadastrarUsuario(Usuario usuario) async {
      bool usuarioEncontrado = await UsuarioDao().emailJaCadastrado(usuario.getEmail());

      if(usuarioEncontrado == false){
        await UsuarioDao().cadastrarUsuario(usuario);
      } else {
        throw ValidationException('Usuario já cadastrado!');
      }
  }

  Future<Usuario> autenticarUsuario(String email, String senha) async {
    Usuario? usuario = await UsuarioDao().autenticar(email, senha);
    if (usuario != null) {
      return usuario;
    } else {
      throw ValidationException('Usuário não encontrado');
    }
  }

  bool? atualizarUsuario(Usuario usuario) {}

  bool? deletarUsuario(Usuario usuario) {}

  String? validarSenha(String? valueField) {
    if (valueField == null) {
      return null;
    }

    if (valueField.length < 4) {
      return "precisa de ao menos 4 digitos!";
    }
  }

  String? validarEmail(String? valueField) {
    if (EmailValidator.validate(valueField!)) {
      return null;
    } else {
      return "Email inválido!";
    }
  }

  void isCadastroValido(String nome, String email, String senha,
      String senhaReptida) {
    if (nome.isEmpty && nome.length < 4) {
      throw ValidationException("Informe um nome válido!");
    }

    if (!EmailValidator.validate(email)) {
      throw ValidationException("Email inválido!");
    }

    if (senha.isEmpty) {
      throw ValidationException("Informe a senha");
    }

    if (senhaReptida.isEmpty) {
      throw ValidationException("Confirme a senha");
    }

    if (senha.length < 4) {
      throw ValidationException("A senha deve possuir ao minimo 4 caracteres");
    }

    if (senha.compareTo(senhaReptida) != 0) {
      throw ValidationException("A senha deve coincidir");
    }
  }
}
