import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/controllers/login.controller.dart';
import 'package:hcslzapp/models/token.dart';
import 'package:hcslzapp/pages/dashboard/dashboard.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:hcslzapp/pages/login/request.access.dart';
import 'forgot.password.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController _controller = LoginController();

  @override
  void initState() {
    _controller.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: _sliverAppBar(context),
        );
      },
    );
  }

  _sliverAppBar(BuildContext context) => CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            elevation: 50,
            expandedHeight: 150.0,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "HCSlz App",
                style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.orangeAccent,
                ),
              ),
              background: Image.asset(
                'assets/imgs/passeio.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverFillRemaining(
            child: _widgets(context),
          ),
        ],
      );

  _widgets(BuildContext context) => Stack(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/imgs/logo_login.png'),
            ),
          ),
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
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputTextField(
                    textEditingController: _controller.userLoginCtrl,
                    label: labelUser,
                    hint: hintUser,
                    icon: Icons.person,
                    inputType: TextInputType.text,
                    onChanged: _controller.formController.changeUser,
                    errorText: _controller.validateUser(),
                  ),
                  InputTextField(
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
                    height: 30.0,
                  ),
                  Button(
                    icon: Icons.arrow_forward,
                    heroTag: 'btnLogin',
                    onClick: () {
                      _login(context);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()),
                          );
                        },
                        child: Text(
                          'Esqueci a senha',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RequestAccess()),
                          );
                        },
                        child: Text(
                          'Primeiro acesso?',
                          style: TextStyle(
                            color: Colors.indigo,
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
    _controller.errorMsg = null;
    _controller.login().then((token) {
      if (_controller.errorMsg != null) {
        asuka.showSnackBar(
          SnackBar(
            content: Text(_controller.errorMsg),
          ),
        );
      } else {
        Token t = token;
        print(t.token);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }
    });
  }
}

/*-- Usuarios Login
--{
--	"username": "admin",
--	"password": "hcslzapp"
--}
--
--{
--	"username": "atajr",
--	"password": "1234"
--	"associatedId": "1"
--}*/

class SnackBarWidget extends StatelessWidget {
  String heroTag;

  SnackBarWidget(this.heroTag);

  @override
  Widget build(BuildContext context) {
    return Button(
        icon: Icons.email_rounded,
        heroTag: heroTag,
        onClick: () {
          asuka.showSnackBar(SnackBar(
            content: Text("Hello World"),
          ));
        });
  }
}
