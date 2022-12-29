import 'package:flutter/material.dart';
import 'package:hcslzapp/components/degradee.background.dart';

import '../common/messages.dart';

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
  static const double padding = 10;
  static const double avatarRadius = 100;

  @override
  Widget build(BuildContext context) => DegradeBackground(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(padding),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: contentBox(context),
        ),
      );

  contentBox(context) => Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                left: padding,
                top: avatarRadius + padding,
                right: padding,
                bottom: padding),
            margin: EdgeInsets.only(top: avatarRadius),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: widget.title == WARNING
                    ? Colors.yellow[300]
                    : Colors.red[500],
                borderRadius: BorderRadius.circular(padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.message,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.deepOrangeAccent[100],
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Positioned(
            left: padding,
            right: padding,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: avatarRadius,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
                  child: Image.asset('assets/imgs/logo.png')),
            ),
          ),
        ],
      );
}

/*  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _showMessage);
    super.initState();
  }

  get _showMessage {
    AsukaSnackbar.alert(widget.message).show();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: DegradeBackground(
          Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                HcLogo(0.0),
              ],
            ),
          ),
        ),
      );
}*/
