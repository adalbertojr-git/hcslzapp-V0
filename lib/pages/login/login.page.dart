import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcslzapp/common/messages.dart';
import '../../common/labels.and.hints.dart';
import '../../components/degradee.background.dart';
import '../../components/my.text.form.field.dart';
import '../../controllers/login.controller.dart';
import '../access.request/access.request.add.page.dart';
import '../password/send.email.page.dart';
import 'loading.dart';

const String _labelAppTitle = 'HCSlz App';
const String _pathLogoImage = 'assets/imgs/logo.png';
const String _labelForgotPsw = 'Esqueci minha senha';
const String _labelFirstAcc = 'Solicitar acesso';

class MyCustomLoginUI extends StatefulWidget {
  @override
  _MyCustomLoginUIState createState() => _MyCustomLoginUIState();
}

class _MyCustomLoginUIState extends State<MyCustomLoginUI>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final LoginController _controllerLogin = LoginController();

  @override
  void initState() {
    super.initState();
    _controllerLogin.init();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: .7, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )
      ..addListener(
        () {
          setState(() {});
        },
      )
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: DegradeBackground(
          _widgets(),
        ),
      );

  _widgets() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: SizedBox(
          height: _height,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 180.0,
                            child: Image.asset(_pathLogoImage),
                          ),
                        ),
                        MyTextFormField(
                          textEditingController: _controllerLogin.userLoginCtrl,
                          label: labelUser,
                          hint: hintUser,
                          icon: Icons.person,
                          inputType: TextInputType.text,
                          onChanged: _controllerLogin.formController.changeUser,
                          errorText: _controllerLogin.validateUser(),
                        ),
                        MyTextFormField(
                          textEditingController: _controllerLogin.pswLoginCtrl,
                          label: labelPsw,
                          hint: hintPsw,
                          icon: Icons.vpn_key,
                          inputType: TextInputType.text,
                          hidden: true,
                          onChanged:
                              _controllerLogin.formController.changePassword,
                          errorText: _controllerLogin.validatePassword(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: _labelForgotPsw,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                HapticFeedback.lightImpact();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SendEmailPage(),
                                  ),
                                );
                              },
                          ),
                        ),
                        SizedBox(),
                        RichText(
                          text: TextSpan(
                            text: _labelFirstAcc,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                HapticFeedback.lightImpact();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AccessRequestAddPage(),
                                  ),
                                );
                              },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: _width * .07),
                        height: _width * .7,
                        width: _width * .7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Color(0xff09090A),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.scale(
                        scale: _animation.value,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            _login();
                          },
                          child: Container(
                            height: _width * .2,
                            width: _width * .2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.login_sharp,
                              color: Colors.black,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    if (_controllerLogin.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Loading(
            _controllerLogin.userLoginCtrl.text,
            _controllerLogin.pswLoginCtrl.text,
          ),
        ),
      );
    }
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
