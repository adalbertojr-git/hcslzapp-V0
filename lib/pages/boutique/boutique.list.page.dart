import 'package:flutter/material.dart';

class BoutiqueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List choices = const [
      const Choice(
          title: 'Jaqueta de Verao',
          date: '1 June 2019',
          description:
              'Feito de malha de poliéster 100% com ombro 100% poliéster reforçado e remendos de cotovelo. Bolsos de armadura nos cotovelos e ombros com cintura traseira, ombros e cotovelos levemente acolchoados',
          imglink:
              'https://www.rota67hde.com.br/uploads/imagens/5bcf91e14e39e_m.jpg'),
      const Choice(
          title: 'Cervejeiros',
          date: '1 June 2019',
          description:
              'Presentes Harley-Davidson para cervejeiros',
          imglink:
              'https://aletp.com.br/wp-content/uploads/2009/01/presentes-harley-davidson.jpg'),
    ];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white30, Colors.deepOrange],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            //padding: const EdgeInsets.all(20.0),
            children: List.generate(
              choices.length,
              (index) {
                return Center(
                  child: ChoiceCard(
                    choice: choices[index],
                    item: choices[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final String date;
  final String description;
  final String imglink;

  const Choice({this.title, this.date, this.description, this.imglink});
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);
  final Choice choice;
  final VoidCallback onTap;
  final Choice item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
      color: Colors.black12,
      margin: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Image.network(choice.imglink),
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(choice.title, style: Theme.of(context).textTheme.title),
                Text(
                  choice.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Text(choice.description),
              ],
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
