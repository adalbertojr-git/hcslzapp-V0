import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/labels.and.hints.dart';
import '../../components/degradee.background.dart';
import '../../components/my.text.form.field.dart';
import '../../controllers/login.controller.dart';
import '../access.request/access.request.add.page.dart';
import '../password/forgot.password.page.dart';
//import 'package:fluttertoast/fluttertoast.dart';

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
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: DegradeBackground(
        ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: _height,
              child: Column(
                children: [
                  //Expanded(child: SizedBox()),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 230,
                          child: Image.asset(_pathLogoImage),
                        ),
                        SizedBox(),

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
                          onChanged: _controllerLogin.formController.changePassword,
                          errorText: _controllerLogin.validatePassword(),
                        ),

/*                        component1(Icons.account_circle_outlined,
                            'User name...', false, false),
                        component1(
                            Icons.lock_outline, 'Password...', true, false),*/


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
                                        builder: (context) => ForgotPasswordPage(),
                                      ),
                                    );
                                  },
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: _labelFirstAcc,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    HapticFeedback.lightImpact();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AccessRequestAddPage(),
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
                    flex: 3,
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
                              },
                              child: Container(
                                height: _width * .2,
                                width: _width * .2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffA9DED8),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.login,
                                  size: 40,
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
        ),
      ),
    );
  }

  Widget component1(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: _width / 8,
      width: _width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: _width / 30),
      decoration: BoxDecoration(
        color: Color(0xff212428),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white.withOpacity(.9)),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
