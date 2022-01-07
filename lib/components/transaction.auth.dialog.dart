import 'package:flutter/material.dart';

const String _labelOK = 'OK';
const String _labelCancel = 'Cancelar';

class TransactionAuthDialog extends StatelessWidget {
  final String msg;

  const TransactionAuthDialog({required this.msg});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        Icons.warning_amber_sharp,
        size: 70.0,
        color: Colors.orangeAccent,
      ),
      content: Text(
        this.msg,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(_labelCancel),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(_labelOK),
        ),
      ],
    );
  }
}
