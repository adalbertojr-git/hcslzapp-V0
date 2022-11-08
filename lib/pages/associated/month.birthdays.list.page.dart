import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/month.birthdays.list.controller.dart';
import 'package:hcslzapp/models/month.birthdays.dart';

const String _labelNotExists =
    'Não existem Harleyros aniversariantes neste mês.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _title = 'Aniversariantes do Mês';

class MonthBirthdaysListPage extends StatelessWidget {
  final MonthBirthdaysListController _controller =
      MonthBirthdaysListController();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          body: FutureBuilder<List<MonthBirthdays>>(
            future: _controller.getFuture(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                case ConnectionState.active:
                  break;
                default:
                  if (snapshot.hasError) {
                    return CenteredMessage(
                      title: _title,
                      message: snapshot.error.toString(),
                    );
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        title: _title,
                        message: _controller.errorMsg,
                      );
                    if ((snapshot.data?.length)! > 0) {
                      _controller.associateds.addAll((snapshot.data)!);
                      _controller.associateds.sort(
                        (a, b) => a.name.compareTo(b.name),
                      );
                      return _widgets(context);
                    } else
                      return CenteredMessage(
                        title: _title,
                        message: _labelNotExists,
                      );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                title: _title,
                message: _labelUnknown,
              );
            },
          ),
        ),
      );

  _widgets(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TopBar(
              title: _title,
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _controller.associateds.length,
                  itemBuilder: (_, int i) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 5.0),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          _controller.associateds[i].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Data de Nascimento: ' +
                            (_controller.associateds[i].date_birth) +
                            '\n' +
                            'Status: ' +
                            _controller.associateds[i].status),
                        leading: CircleAvatar(
                          child: Icon(Icons.cake),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, int index) => const Divider(),
                ),
              ),
            ),
          ],
        ),
      );
}
