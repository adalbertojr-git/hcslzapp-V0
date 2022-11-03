import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/forgot.password.controller.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:hcslzapp/models/password.dto.dart';
import 'package:hcslzapp/pages/password/change.password.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

const String _title = 'Esqueceu a senha?';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ForgotPasswordController _controller = ForgotPasswordController();
  final CountDownController _controllerCountDown = CountDownController();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: _widgets(context),
        );
      },
    );
  }

  _widgets(BuildContext context) => Container(
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
              TopBar(
                title: _title,
              ),
              MyTextFormField(
                textEditingController: _controller.emailForgotPswCtrl,
                hint: hintEmail,
                label: labelEmail + " *",
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                onChanged: _controller.formController.changeEmail,
                errorText: _controller.validateEmail(),
              ),
              SizedBox(
                height: 20.0,
              ),
              Button(
                icon: Icons.email,
                onClick: () {
                  _forgotPassword();
                },
              ),
              SizedBox(
                height: 60.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: RichText(
                  text: const TextSpan(
                    text: 'Atenção: Após pressionar o botão acima, você receberá um email em nome do Harley Club ' +
                        'contendo um código de segurança (numérico de 6 dígitos), o qual deverá ser informado ' +
                        'para geração de nova senha. ' +
                        'Caso não encontre o email na Caixa de Entrada, verifique sua caixa de Spam.',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: RichText(
                  text: const TextSpan(
                    text: 'Atenção: Você tem 2 minutos para informar o código enviado. Após esse prazo, ' +
                        'o código irá expirar e uma nova requisição deve ser feita.',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  _forgotPassword() {
    if (_controller.hasErrors) {
      asuka.showSnackBar(
        SnackBar(
          content: const Text('Atenção: Existem erros no formulário que devem '
              'ser corrigidos antes de efetivar a transação.'),
        ),
      );
    } else {
      asuka.showSnackBar(
        SnackBar(
          content: const Text('Aguarde...'),
        ),
      );
      _controller
          .forgotPassword(_controller.emailForgotPswCtrl.text)
          .then((value) {
        if (value != null) {
          if (value.aux.startsWith('ERRO'))
            asuka.showSnackBar(
              SnackBar(
                content: Text(value.aux),
              ),
            );
          else {
            _controller.initTextFields();
            _showCodedDialog(value);
          }
        } else {
          asuka.showSnackBar(
            SnackBar(
              content: Text(_controller.errorMsg),
            ),
          );
        }
      });
    }
  }

  _forgotPassword2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ChangePasswordPage('FORGOT')),
    );
  }

  _showCodedDialog(PasswordDTO password) async {
    await showDialog(
        context: context,
        builder: (context) => Dialog(
            backgroundColor: Colors.deepOrange[200],
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepOrange[200],
                  ),
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child: Column(
                    children: [
                      MyTextFormField(
                        textEditingController: _controller.codeCtrl,
                        label: labelCode,
                        hint: hintCode,
                        fontSize: 30,
                        inputType: TextInputType.number,
                        maskTextInputFormatter:
                            MaskTextInputFormatter(mask: "######"),
                        textAlign: TextAlign.center,
                      ),
                      Divider(height: 20),
                      showCountdown(context),
                      Divider(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: FloatingActionButton(
                              heroTag: 'btnCancel',
                              mini: true,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Colors.deepOrangeAccent[100],
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: FloatingActionButton(
                              heroTag: 'btnSend',
                              mini: true,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.deepOrangeAccent[100],
                              ),
                              onPressed: () {
                                _controller.validateCode(PasswordDTO(
                                  associatedId: password.associatedId,
                                  aux: _controller.codeCtrl.text,
                                ));

/*                                if (_controller.codeCtrl.text == code) {
                                  asuka.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'O código informado está correto.'),
                                    ),
                                  );
                                  Navigator.pop(context);
                                } else
                                  asuka.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'O código informado não é válido.'),
                                    ),
                                  );*/
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )));
  }

  Center showCountdown(BuildContext c) => Center(
        child: CircularCountDownTimer(
          // Countdown duration in Seconds.
          duration: 120,

          // Countdown initial elapsed Duration in Seconds.
          initialDuration: 0,

          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
          controller: _controllerCountDown,

          // Width of the Countdown Widget.
          //width: MediaQuery.of(context).size.width / 2,
          width: 80,

          // Height of the Countdown Widget.
          //height: MediaQuery.of(context).size.height / 2,
          height: 80,

          // Ring Color for Countdown Widget.
          ringColor: Colors.grey[300]!,

          // Ring Gradient for Countdown Widget.
          ringGradient: null,

          // Filling Color for Countdown Widget.
          fillColor: Colors.deepOrange[400]!,

          // Filling Gradient for Countdown Widget.
          fillGradient: null,

          // Background Color for Countdown Widget.
          backgroundColor: Colors.black,

          // Background Gradient for Countdown Widget.
          backgroundGradient: null,

          // Border Thickness of the Countdown Ring.
          strokeWidth: 10.0,

          // Begin and end contours with a flat edge and no extension.
          strokeCap: StrokeCap.round,

          // Text Style for Countdown Text.
          textStyle: const TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),

          // Format for the Countdown Text.
          textFormat: CountdownTextFormat.S,

          // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
          isReverse: false,

          // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
          isReverseAnimation: false,

          // Handles visibility of the Countdown Text.
          isTimerTextShown: true,

          // Handles the timer start.
          autoStart: true,

          // This Callback will execute when the Countdown Starts.
          onStart: () {
            // Here, do whatever you want
            debugPrint('Countdown Started');
          },

          // This Callback will execute when the Countdown Ends.
          onComplete: () {
            Navigator.pop(c);
          },

          // This Callback will execute when the Countdown Changes.
/*          onChange: (String timeStamp) {
            // Here, do whatever you want
            debugPrint('Countdown Changed $timeStamp');
          },*/
        ),
      );
}
