import 'package:flutter/material.dart';
import 'package:hcslzapp/components/appBar.dart';

const _tituloAppBar = 'Lista de Parcerias';

class ListaParcerias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List choices = const [
      const Choice(
          title: 'New Road Fortaleza',
          date: '1 June 2019',
          description:
              'Descontos de 10% na compra de acessorios',
          imglink:
              'https://www.newroadhd.com.br/wp-content/uploads/2018/01/logo.jpg'),
      const Choice(
          title: 'Hangar Motos',
          date: '1 June 2019',
          description:
          'Descontos de 10% na compra de motos',
          imglink:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTAydS3H3oWCCKWGIJdZnoqkTXEtYAzbrl-fQ&usqp=CAU'),
    ];
    return Scaffold(
        appBar: MyAppBar(_tituloAppBar),
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
            //padding: const EdgeInsets.all(0.0),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Image.network(choice.imglink),
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
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
      ),
    );
  }
}
