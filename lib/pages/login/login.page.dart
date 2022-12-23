import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/injection.dart';
import '../../common/labels.and.hints.dart';
import '../../common/token.details.dart';
import '../../components/degradee.background.dart';
import '../../components/my.text.form.field.dart';
import '../../controllers/login.controller.dart';
import '../../http/http.exception.dart';
import '../access.request/access.request.add.page.dart';
import '../dashboard/dashboard.page.dart';
import '../password/forgot.password.page.dart';

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
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                          onChanged:
                              _controllerLogin.formController.changePassword,
                          errorText: _controllerLogin.validatePassword(),
                        ),
                        SizedBox(),
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
                                        builder: (context) =>
                                            ForgotPasswordPage(),
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
                                _login();
                              },
                              child: Container(
                                height: _width * .2,
                                width: _width * .2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.login_sharp,
                                  size: 80,
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

  _login() async {
    try {
      final value = await _controllerLogin.authenticate();
      debugPrint(value.token);
      loadTokenSingleton(value);
      TokenDetails _tokenDetails = TokenDetails(value.token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            _tokenDetails.associatedId(),
          ),
        ),
      );
    } on HttpException catch (e) {
      AsukaSnackbar.alert(e.message.toString()).show();
    } on Exception catch (e) {
      AsukaSnackbar.alert(e.toString()).show();
    } catch (e) {
      AsukaSnackbar.alert(e.toString()).show();
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
