import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/token.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _authUrl = '/authenticate';

class LoginRepo {
  Future<Token> authenticate(String username, String password) async {
    Map params = {"username": username, "password": password};
    final Response response = await client
        .post(
        Uri.parse(mainUrl + _authUrl),
          headers: {'Content-type': 'application/json'},
          body: jsonEncode(
            params,
          ),
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      return Token.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

/*  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn({required User user, required Function onFail}) async {
    try {
      final Fire.UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);

      print(result.user!.uid);
    } on Fire.FirebaseAuthException catch (e) {
      //print(e.code);
      onFail(getErrorString(e.code));
    }
  }*/

/*  String getErrorString(String code) {
    switch (code) {
      case 'weak-password':
        return 'Sua senha é muito fraca.';
      case 'invalid-email':
        return 'Seu e-mail é inválido.';
      case 'email-already-in-use':
        return 'E-mail já está sendo utilizado em outra conta.';
      case 'invalid-credential':
        return 'Seu e-mail é inválido.';
      case 'wrong-password':
        return 'Sua senha está incorreta.';
      case 'user-not-found':
        return 'Não há usuário com este e-mail.';
      case 'user-disabled':
        return 'Este usuário foi desabilitado.';
      case 'too-many-requests':
        return 'Muitas solicitações. Tente novamente mais tarde.';
      case 'operation-not-allowed':
        return 'Operação não permitida.';

      default:
        return 'Um erro indefinido ocorreu.';
    }
  }*/
}
