import 'package:flutter/material.dart';
import 'button.dart';
import 'hc.logo.dart';
import 'package:asuka/asuka.dart' as asuka;

class CenteredMessage extends StatefulWidget {
  final String _message;

  CenteredMessage(this._message);

  @override
  _CenteredMessageState createState() => _CenteredMessageState();
}

class _CenteredMessageState extends State<CenteredMessage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showMessage);
  }

  get _showMessage {
    asuka.showSnackBar(
      SnackBar(
        content: Text(widget._message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white30, Colors.deepOrange],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      //color: Colors.red[400],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HcLogo(0.0),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                //widget._message,
                "Oops!!! Houve um erro ao executar a transação!!!",
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Button(
              icon: Icons.arrow_back,
              onClick: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
