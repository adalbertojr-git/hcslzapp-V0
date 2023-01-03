import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart' hide showDialog;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/controllers/send.email.controller.dart';
import 'package:hcslzapp/models/password.dto.dart';
import 'package:hcslzapp/pages/password/forgot.password.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Esqueci minha senha';

class SendEmailPage extends StatefulWidget {
  @override
  State<SendEmailPage> createState() => _SendEmailPageState();
}

class _SendEmailPageState extends State<SendEmailPage> {
  final SendEmailController _controller = SendEmailController();
  final CountDownController _controllerCountDown = CountDownController();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar: MyBottomAppBar(),
        body: _widgets(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Button(
          icon: Icons.email,
          onClick: () => _send(),
        ),
      );

  _widgets() => Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Observer(
              builder: (_) => MyTextFormField(
                textEditingController: _controller.emailForgotPswCtrl,
                hint: hintEmail,
                label: labelEmail + " *",
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                onChanged: _controller.formController.changeEmail,
                errorText: _controller.validateEmail(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text.rich(
                const TextSpan(
                  text: 'Atenção: Você receberá um email em nome do Harley Club ' +
                      'contendo um código de segurança (numérico de 6 dígitos). ' +
                      'Caso não encontre o email na Caixa de Entrada, verifique sua caixa de Spam.',
                ),
              ),
            ),
          ],
        ),
      );

  _send() async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        AsukaSnackbar.alert(WAIT).show();
        final value = await _controller.sendEmail(
          _controller.emailForgotPswCtrl.text,
        );
        if (value.aux.startsWith('ERRO'))
          AsukaSnackbar.alert(value.aux).show();
        else {
          _controller.initTextFields();
          _showDialog(value);
        }
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }

  _showDialog(PasswordDTO password) async {
    await Asuka.showDialog(
      builder: (context) => Dialog(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 310,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepOrange,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  MyTextFormField(
                    textEditingController: _controller.codeCtrl,
                    label: labelCode,
                    hint: hintCode,
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
                          onPressed: () => _validateCode(
                            context,
                            PasswordDTO(
                              associatedId: password.associatedId,
                              aux: _controller.codeCtrl.text,
                              psw: '',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center showCountdown(BuildContext c) => Center(
        child: CircularCountDownTimer(
          // Countdown duration in Seconds.
          duration: 180,

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

  _validateCode(BuildContext context, PasswordDTO passwordDTO) async {
    if (passwordDTO.aux.length != 0) {
      final value = await _controller.validateCode(passwordDTO);
      if (value.startsWith('OK')) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ForgotPasswordPage(
              passwordDTO,
            ),
          ),
        );
      } else
        AsukaSnackbar.alert('O código informado não é válido.').show();
    }
  }
}
