import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/head.notification.list.controller.dart';
import 'package:hcslzapp/models/head.notification.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _labelNotExists = 'Não existem avisos cadastrados.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _title = 'Avisos da Diretoria';

class HeadNotificationListAssociatedPage extends StatelessWidget {
  final HeadNotificationListController _controller =
      HeadNotificationListController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar: MyBottomAppBar(),
        body: FutureBuilder<List<HeadNotification>>(
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
                      title: _title, message: snapshot.error.toString());
                } else {
                  if (snapshot.data == null)
                    return CenteredMessage(
                      title: _title,
                      message: _controller.errorMsg,
                    );
                  if ((snapshot.data?.length)! > 0) {
                    _controller.init();
                    _controller.headNotifications.addAll(snapshot.data!);
                    _controller.headNotifications.sort(
                      (a, b) => b.datePublication.compareTo(a.datePublication),
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
      );

  _widgets(BuildContext context) => ListView(
    children: [
      SizedBox(height: 10),
      Observer(
        builder: (_) => ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15),
          shrinkWrap: true,
          itemCount: _controller.headNotifications.length,
          itemBuilder: (_, int i) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.message_outlined),
                    Text('Publicado em: ' +
                        _controller
                            .headNotifications[i].datePublication)
                  ],
                ),
                Container(
                  height: 450,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 1.0,
                    child: Column(
                      children: <Widget>[
                        Center(
                          heightFactor: 1.1,
                          child: Image.asset(
                            'assets/imgs/logo.png',
                            fit: BoxFit.cover,
                            width: 300.0,
                          ),
                        ),
                        Container(
                          color: Colors.black26,
                          height: 200,
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.fromLTRB(10, 0, 10, 0),
                            dense: true,
                            title: Text(
                              _controller.headNotifications[i].title +
                                  '\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            subtitle: Text(
                                _controller
                                    .headNotifications[i].notification,
                                style: TextStyle(fontSize: 17.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (_, int index) => const Divider(),
        ),
      ),
    ],
  );
}
