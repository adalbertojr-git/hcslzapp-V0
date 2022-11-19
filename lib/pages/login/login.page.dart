import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/pages/password/forgot.password.page.dart';
import "../../models/associated.dart";
import '../../common/labels.and.hints.dart';
import '../../common/token.details.dart';
import '../../components/button.dart';
import '../../components/my.text.form.field.dart';
import '../../controllers/login.controller.dart';
import '../../models/token.dart';
import '../dashboard/dashboard.page.dart';
import '../access.request/access.request.add.page.dart';

const String _pathLogoImage = 'assets/imgs/logo.png';
const String _labelForgotPsw = 'Esqueceu a senha?';
const String _labelFirstAcc = 'Não tem conta? Solicite acesso';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: _widgets(_),
      );
    });
  }

  _widgets(BuildContext context) => Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white30, Colors.deepOrange],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  child: Image.asset(_pathLogoImage),
                ),
                SizedBox(
                  height: 10.0,
                ),
                MyTextFormField(
                  textEditingController: _controller.userLoginCtrl,
                  label: labelUser,
                  hint: hintUser,
                  icon: Icons.person,
                  inputType: TextInputType.text,
                  onChanged: _controller.formController.changeUser,
                  errorText: _controller.validateUser(),
                ),
                MyTextFormField(
                  textEditingController: _controller.pswLoginCtrl,
                  label: labelPsw,
                  hint: hintPsw,
                  icon: Icons.vpn_key,
                  inputType: TextInputType.text,
                  hidden: true,
                  onChanged: _controller.formController.changePassword,
                  errorText: _controller.validatePassword(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: Text(
                      _labelForgotPsw,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                Button(
                  icon: Icons.arrow_forward,
                  onClick: () {
                    if (!_controller.hasErrors) {
                      _login(context);
                    } else {
                      AsukaSnackbar.alert('Preencha os campos ogrigatórios')
                          .show();
                    }
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccessRequestAddPage()),
                    );
                  },
                  child: Text(
                    _labelFirstAcc,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  _login(BuildContext context) {
    AsukaSnackbar.message('Carregando...').show();
    _controller.authenticate().then(
      (token) async {
        if (token == null) {
          AsukaSnackbar.alert(_controller.errorMsg).show();
        } else {
          Token _t = token;
          debugPrint(_t.token);
          Associated associated = Template().loadAssociated();
          _controller.setTokenToDevice(_t.token);
          _controller.setUserToDevice(_controller.userLoginCtrl.text);
          TokenDetails _tokenDetails = TokenDetails(_t.token);
          await _controller.findByIdToList(_tokenDetails.associatedId()).then(
            (value) {
              associated = value[0];
            },
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(
                associated,
              ),
            ),
          );
        }
      },
    );
  }
}
