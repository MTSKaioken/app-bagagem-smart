import 'package:bagagem_smart/refactor/exception/validation_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/usuario.dart';

class UsuarioDao {
  Future<bool> cadastrarUsuario(Usuario usuario) async {
    try {
      CollectionReference usuarios =
          FirebaseFirestore.instance.collection('usuarios');
      await usuarios.doc().set(usuario.toMap());
      return true;
    } catch (e) {
      throw ValidationException('Erro ao salvar!');
    }
  }

  Future<bool> emailJaCadastrado(String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .where('email', isEqualTo: email)
        .get();

    List<Usuario> usuarios = querySnapshot.docs.map((doc) {
      return Usuario.fromSnapshot(doc);
    }).toList();

    if (usuarios.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<Usuario?> autenticar(String email, String senha) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .where('email', isEqualTo: email)
        .where('senha', isEqualTo: senha)
        .get();

    List<Usuario> usuarios = querySnapshot.docs.map((doc) {
      return Usuario.fromSnapshot(doc);
    }).toList();

    if (usuarios.isNotEmpty) {
      return usuarios.first;
    }

    return null;
  }

  isEmailCadastrado(email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<double?> lerPesoAssociadoAoUsuario(String id) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuario_pesagens')
        .where('id_usuario', isEqualTo: id)
        .orderBy('dt_pesagem', descending: true)
        // .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      double? pesagem = querySnapshot.docs.first['peso'].toDouble();
      return pesagem;
    } else {
      return null;
    }
  }

  atualizarSenhaAssociadaAoEmail(String email, String senha) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuarios')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      await documentSnapshot.reference.update({
        'senha': senha,
      });
    }
  }

  lerCoordenadasAssociadoAoUsuario(String id) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('usuario_localizacoes')
        .where('id_usuario', isEqualTo: id)
        .orderBy('dt_localizacao', descending: true)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      GeoPoint localizacao = querySnapshot.docs.first['localizacao'];
      return localizacao;
    } else {
      return null;
    }

  }
}
