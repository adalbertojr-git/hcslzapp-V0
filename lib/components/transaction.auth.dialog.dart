import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black45,
      title: Icon(
        Icons.warning_amber_sharp,
        size: 50.0,
        color: Colors.orangeAccent,
      ),
      content: Text(
        'Deseja excluir o registro selecionado?',
        style: TextStyle(
          color: Colors.white,
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
