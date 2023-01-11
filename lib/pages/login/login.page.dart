import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import '../../common/messages.dart';
import '../../controllers/login.controller.dart';
import '../access.request/access.request.add.page.dart';
import '../password/send.email.page.dart';
import 'loading.dart';

class MyCustomLoginUI extends StatefulWidget {
  @override
  _MyCustomLoginUIState createState() => _MyCustomLoginUIState();
}

class _MyCustomLoginUIState extends State<MyCustomLoginUI> {
  final LoginController _controller = LoginController();
  List<String> _greeting = [];

  @override
  void initState() {
    _greeting = _whatTimeIs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    _greeting[0],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                            child: SizedBox(
                              width: size.width * .9,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.width * .15,
                                      bottom: size.width * .1,
                                    ),
                                    child: Text(
                                        _greeting[1] + ', Harleyro!!!',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white.withOpacity(.8),
                                      ),
                                    ),
                                  ),
                                  _component(
                                    Icons.account_circle_outlined,
                                    'Usuário...',
                                    false,
                                    _controller.userCtrl,
                                  ),
                                  _component(
                                    Icons.lock_outline,
                                    'Senha...',
                                    true,
                                    _controller.pswCtrl,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Esqueci minha senha!',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              HapticFeedback.lightImpact();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SendEmailPage(),
                                                ),
                                              );
                                            },
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Solicitar acesso',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
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
                                  SizedBox(height: size.width * .3),
                                  Center(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        HapticFeedback.lightImpact();
                                        _login();
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .2,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.login_sharp,
                                          color: Colors.black,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> _whatTimeIs() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
       return ['assets/imgs/manha.jpg', 'Bom dia'];
    }
    if (hour < 18) {
      return ['assets/imgs/tarde.jpg', 'Boa tarde'];
    }
    return ['assets/imgs/noite.jpg', 'Boa noite'];
  }

  _login() async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Loading(
            _controller.userCtrl.text,
            _controller.pswCtrl.text,
          ),
        ),
      );
    }
  }

  Widget _component(
    IconData icon,
    String hintText,
    bool isPassword,
    TextEditingController controller,
  ) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
        controller: controller,
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
