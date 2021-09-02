import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  final String msg;

  const TransactionAuthDialog({@required this.msg});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        Icons.warning_amber_sharp,
        size: 70.0,
        color: Colors.orangeAccent,
      ),
      content: Text(
        //'Deseja excluir o registro selecionado?',
        this.msg,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('Cancelar'),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text('OK'),
        ),
      ],
    );
  }
}
