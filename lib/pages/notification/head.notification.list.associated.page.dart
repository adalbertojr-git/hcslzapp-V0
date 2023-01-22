import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/head.notification.list.controller.dart';
import 'package:hcslzapp/models/head.notification.dart';
import '../../common/photo.image.provider.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Avisos da Diretoria';
const String _pathLogoImage = 'assets/imgs/logo.png';

class HeadNotificationListAssociatedPage extends StatefulWidget {
  @override
  State<HeadNotificationListAssociatedPage> createState() =>
      _HeadNotificationListAssociatedPageState();
}

class _HeadNotificationListAssociatedPageState
    extends State<HeadNotificationListAssociatedPage> {
  final HeadNotificationListController _controller =
      HeadNotificationListController();

  @override
  void initState() {
    _controller.getFuture().then((value) {
      _controller.setButtonVisibilty();
    }).catchError((e) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        return Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar:
              _controller.isHidedButton ? null : MyBottomAppBar(),
          body: FutureBuilder<List<HeadNotification>>(
            future: _controller.future,
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
                      title: ERROR,
                      message: snapshot.error.toString(),
                    );
                  } else {
                    if ((snapshot.data?.length)! > 0) {
                      _controller.init();
                      _controller.headNotifications.addAll(snapshot.data!);
                      _controller.headNotifications.sort(
                        (a, b) =>
                            b.datePublication.compareTo(a.datePublication),
                      );
                      return _widgets();
                    } else
                      return CenteredMessage(
                        title: WARNING,
                        message: NOTEXIST,
                      );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                title: ERROR,
                message: UNKNOWN,
              );
            },
          ),
        );
      });

  _widgets() => Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _controller.headNotifications.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width - 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange[300],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      _photo(index),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                Text(
                                  _controller.headNotifications[index].title +
                                      '\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                Text(
                                    _controller
                                        .headNotifications[index].notification,
                                    style: TextStyle(fontSize: 14.0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.message_outlined),
                            Text('Publicado em: ' +
                                _controller
                                    .headNotifications[index].datePublication)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );

  _photo(int i) => Container(
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
