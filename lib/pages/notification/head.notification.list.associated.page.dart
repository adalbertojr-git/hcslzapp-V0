import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/head.notification.list.controller.dart';
import 'package:hcslzapp/models/head.notification.dart';
import '../../common/photo.image.provider.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _labelNotExists = 'Não existem avisos cadastrados.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _title = 'Avisos da Diretoria';
const String _pathLogoImage = 'assets/imgs/logo.png';

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

  _widgets(BuildContext context) => Column(
        children: [
          SizedBox(height: 10),
          Observer(
            builder: (_) => Expanded(
              child: ListView.separated(
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
                              _controller.headNotifications[i].datePublication)
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 1.6,
                        color: Colors.black,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 1.0,
                          child: Column(
                            children: <Widget>[
                              _photo(context, i),
                              Container(
                                child: ListTile(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 0),
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
          ),
        ],
      );

  _photo(BuildContext context, int i) => Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: _loadPhoto(i),
            ),
          ),
        ),
      );

  DecorationImage _loadPhoto(int i) => DecorationImage(
      image: _controller.headNotifications[i].photoUrl != ''
          ? NetworkImage(_controller.headNotifications[i].photoUrl)
          : PhotoImageProvider().getImageProvider(
              File(_pathLogoImage),
            ) as ImageProvider,
      fit: BoxFit.fill);
}
