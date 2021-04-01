import 'package:flutter/material.dart';
import 'package:hcslzapp/components/top.bar.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => _showMessage);
    super.initState();
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
      child: Column(
        children: <Widget>[
          TopBar(),
          SizedBox(
            height: 80,
          ),
          HcLogo(0.0),
          SizedBox(
            height: 30.0,
          ),
          Icon(
            Icons.warning_amber_sharp,
            size: 80,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
