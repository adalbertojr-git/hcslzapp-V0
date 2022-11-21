import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/pages/password/forgot.password.page.dart';
import '../../components/degradee.background.dart';
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
const String _labelForgotPsw = 'Esqueci minha senha';
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
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          body: DegradeBackground(
            _widgets(context),
          ),
        ),
      );

  _widgets(BuildContext context) => ListView(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            child: Image.asset(_pathLogoImage),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
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
                SizedBox(
                  height: 20.0,
                ),
                Button(
                  icon: Icons.arrow_forward,
                  onClick: () => _login(context),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ),
                ),
                child: Text(
                  _labelForgotPsw,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccessRequestAddPage(),
                  ),
                ),
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
        ],
      );

  _login(BuildContext context) {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert('Preencha os campos ogrigatórios').show();
    } else {
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
}

/*  void testToken() {
    String token =
        'eyJhbGciOiJIUzUxMiJ9.eyJhc3NvY2lhdGVkSWQiOjEsInN1YiI6ImF0YWpyIiwiZXhwIjoxNjEwNTg3NjUxLCJpYXQiOjE2MTA1Njk2NTF9.e8OIa6r6h4JuMJhxIilo3QO7LKGbCjlr32iyQWN4QnXW-2TFkwZSRvNbr6hwCVcbgP6bjjhpxI5pED3Qd608Wg';
    // To decode the token
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    // Print the payload
    print("payload: $payload");

    // Print one of its property(example: email):
    //print(payload['email']);

//   To get expiry date
    DateTime expiryDate = Jwt.getExpiryDate(token);
//   Print the expiry date
    print("expiryDate: $expiryDate");

    // To check if token is expired
    bool isExpired = Jwt.isExpired(token);
    print("isExpired: $isExpired");

    // Can be used for auth state
    if (!isExpired) {
      //   Token isn't expired
    } else {
      //   Token is expired
    }
  }*/
