/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que cria um objeto RaisedButton padrao

*/
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _label;
  final IconData _icon;
  final Function onClick;

  Button(this._label, this._icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      child: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: BorderSide(color: Colors.white30),
        ),
        child: Icon(
          _icon,
          color: Colors.black,
          size: 40,
        ),
        onPressed: () async {
          onClick();
        },
      ),
    );
  }

  @override
  Widget buildx(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 50.0,
      child: RaisedButton(
        //padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.white30),
        ),
        child: Container(
          /*decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.deepOrange],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ), */
          //height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
/*
              Text(
                _label + "  ",
                style: TextStyle(color: Colors.black, fontSize: 17.0),
              ),
*/
              Icon(
                _icon,
                color: Colors.white30,
                size: 30,
              ),
            ],
          ),
        ),

        onPressed: () async {
          onClick();
        },
      ),
    );
  }

}
