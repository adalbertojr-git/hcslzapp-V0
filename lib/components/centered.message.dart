import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'degradee.background.dart';
import 'hc.logo.dart';

class CenteredMessage extends StatefulWidget {
  final String message;
  final String title;

  CenteredMessage({
    required this.title,
    required this.message,
  });

  @override
  _CenteredMessageState createState() => _CenteredMessageState();
}

class _CenteredMessageState extends State<CenteredMessage> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _showMessage);
    super.initState();
  }

  get _showMessage {
    AsukaSnackbar.message(widget.message).show();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: DegradeBackground(
          Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                HcLogo(0.0),
                Icon(
                  Icons.warning_amber_sharp,
                  size: 80,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      );
}
