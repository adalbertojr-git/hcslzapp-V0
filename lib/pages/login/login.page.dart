import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/token.details.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/login.controller.dart';
import 'package:hcslzapp/models/token.dart';
import 'package:hcslzapp/pages/dashboard/dashboard.page.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:hcslzapp/pages/access.request/access.request.add.page.dart';
import '../forgot.password/forgot.password.page.dart';

class LoginPage extends StatelessWidget {
  LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: _widgets(_),
        );
      },
    );
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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    child: Image.asset('assets/imgs/logo.png'),
                  ),
                  MyTextFormField(
                    textEditingController: _controller.userLoginCtrl,
                    label: labelUser,
                    hint: hintUser,
                    icon: Icons.person,
                    inputType: TextInputType.text,
                  ),
                  MyTextFormField(
                    textEditingController: _controller.pswLoginCtrl,
                    label: labelPsw,
                    hint: hintPsw,
                    icon: Icons.vpn_key,
                    inputType: TextInputType.text,
                    hidden: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Button(
                    icon: Icons.arrow_forward,
                    onClick: () {
                      _login(context);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => Visibility(
                          child: CircularProgressIndicator(),
                          visible: _controller.isLoading,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccessRequestAddPage()),
                          );
                        },
                        child: Text(
                          'Primeiro acesso?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  _login(BuildContext context) {
    _controller.setLoading(true);
    _controller.errorMsg = null;
    _controller.authenticate().then(
      (token) async {
        if (_controller.errorMsg != null) {
          asuka.showSnackBar(
            SnackBar(
              content: Text(_controller.errorMsg),
            ),
          );
        } else {
          Token _t = token;
          print(_t.token);
          _controller.setTokenToDevice(_t.token);
          _controller.setUserToDevice(_controller.userLoginCtrl.text);
          TokenDetails _tokenDetails = TokenDetails(_t.token);
          if (_controller.userLoginCtrl.text != 'admin')
            await _controller
                .findByIdToList(_tokenDetails.associatedId())
                .then((value) {
              _controller.associated = value[0];
            });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(
                _controller.associated,
              ),
            ),
          );
        }
      },
    );
    _controller.setLoading(false);
  }
}
