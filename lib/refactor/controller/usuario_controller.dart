import 'package:bagagem_smart/refactor/exception/validation_exception.dart';
import 'package:bagagem_smart/refactor/model/usuario.dart';
import 'package:email_validator/email_validator.dart';

import '../dao/usuario_dao.dart';

class UsuarioController {

  late UsuarioDao usuarioDao;

  UsuarioController(){
    usuarioDao = UsuarioDao();
  }

  cadastrarUsuario(Usuario usuario) async {
    bool usuarioEncontrado =
        await UsuarioDao().emailJaCadastrado(usuario.getEmail());

    if (usuarioEncontrado == false) {
      await UsuarioDao().cadastrarUsuario(usuario);
    } else {
      throw ValidationException('Usuario já cadastrado!');
    }
  }

  Future<Usuario> autenticarUsuario(String email, String senha) async {
    Usuario? usuario = await usuarioDao.autenticar(email, senha);
    if (usuario != null) {
      return usuario;
    } else {
      throw ValidationException('Usuário não encontrado');
    }
  }

  Future<bool> isEmailCadastrado(String destinatario) async {
    return await usuarioDao.isEmailCadastrado(destinatario);
  }

  bool? atualizarUsuario(Usuario usuario) {}

  bool? deletarUsuario(Usuario usuario) {}

  String? validarEmail(String? valueField) {
    if (EmailValidator.validate(valueField!)) {
      return null;
    } else {
      return "Email inválido!";
    }
  }

  void isCadastroValido(
      String nome, String email, String senha, String senhaReptida) {
    if (nome.isEmpty && nome.length < 4) {
      throw ValidationException("Informe um nome válido!");
    }

    if (!EmailValidator.validate(email)) {
      throw ValidationException("Email inválido!");
    }

    validarSenha(senha, senhaReptida);
  }

  void validarSenha(String senha, String senhaReptida) {
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

  Future<double> lerPesoAssociadoAoUsuario(String id) async {
     double? pesagem = await usuarioDao.lerPesoAssociadoAoUsuario(id);

     if (pesagem != null) {
       return pesagem;
     } else {
       return 0;
     }
  }

  atualizarSenhaAssociadaAoEmail(String email, String senha) async {
    await usuarioDao.atualizarSenhaAssociadaAoEmail(email, senha);
  }


}
