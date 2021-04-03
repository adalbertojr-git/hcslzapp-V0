import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'dart:math';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/partnership.list.controller.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/pages/partnership/partnership.add.page.dart';
import 'dart:io';

const SCALE_FRACTION = 0.6;
const FULL_SCALE = 1.0;
const PAGER_HEIGHT = 200.0;

class PartnershipListPage extends StatefulWidget {
  final String _user;

  PartnershipListPage(this._user);

  @override
  _PartnershipListPageState createState() => _PartnershipListPageState();
}

class _PartnershipListPageState extends State<PartnershipListPage> {
  PartnershipListController _controller = PartnershipListController();
  double viewPortFraction = 0.5;

  @override
  void initState() {
    _controller.pageController = PageController(
      initialPage: _controller.currentPage,
      viewportFraction: viewPortFraction,
    );
    _controller.getFuture().then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<Partnership>>(
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
                  return CenteredMessage(snapshot.error.toString());
                } else {
                  if (snapshot.data == null)
                    return CenteredMessage(
                      _controller.errorMsg,
                    );
                  if (snapshot.data.length > 0) {
                    _controller.init;
                    _controller.partnerships.addAll(snapshot.data);
                    return _widgets();
                  } else
                    return CenteredMessage(
                      'Não existem parcerias cadastradas.',
                    );
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              'Houve um erro desconhecido ao executar a transação.',
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: widget._user == 'admin'
            ? _controller.isHidedButton
                ? null
                : Button(
                    icon: Icons.add,
                    onClick: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PartnershipAddPage(null, widget._user)),
                    ),
                  )
            : null,
      );

  _widgets() => Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
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
            TopBar(),
            Expanded(
              child: Observer(
                builder: (_) => ListView(
                  children: <Widget>[
                    Container(
                      height: PAGER_HEIGHT,
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification notification) {
                          if (notification is ScrollUpdateNotification) {
                            setState(() {
                              _controller.notificationListener();
                            });
                          }
                          return false;
                        },
                        child: PageView.builder(
                          onPageChanged: (pos) {
                            _controller.onPageChanged(pos);
                          },
                          physics: BouncingScrollPhysics(),
                          controller: _controller.pageController,
                          itemCount: _controller.partnerships.length,
                          itemBuilder: (context, index) {
                            final scale = max(
                              SCALE_FRACTION,
                              (FULL_SCALE - (index - _controller.page).abs()) +
                                  viewPortFraction,
                            );
                            return circleOffer(index, scale);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        _controller
                            .partnerships[_controller.currentPage].partner,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    buildDetail()
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget circleOffer(int index, double scale) => Observer(
        builder: (_) => Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            height: PAGER_HEIGHT * scale,
            width: PAGER_HEIGHT * scale,
            child: Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: CircleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 5)),
              child: Container(
                decoration: BoxDecoration(
                  image: _loadPhoto(index),
                ),
              ),
            ),
          ),
        ),
      );

  DecorationImage _loadPhoto(int index) => DecorationImage(
      image: _controller.partnerships[index].photoUrl != null
          ? NetworkImage(_controller.partnerships[index].photoUrl)
          : PhotoImageProvider().getImageProvider(
              File('assets/imgs/noImage.png'),
            ),
      fit: BoxFit.fill);

  Widget buildDetail() => Observer(
    builder: (_) => Container(
          color: Colors.white70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildUserInfo(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Text(
                  _controller.partnerships[_controller.currentPage].promotion,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
  );

  Widget buildUserInfo() => ListTile(
        isThreeLine: true,
        title: Text(_controller.partnerships[_controller.currentPage].partner),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Endereço: ' +
                _controller.partnerships[_controller.currentPage].address),
            Text('Telefone(s): ' +
                _controller.partnerships[_controller.currentPage].phone1 +
                ' - ' +
                _controller.partnerships[_controller.currentPage].phone2),
          ],
        ),
        trailing: widget._user == 'admin'
            ? Wrap(
                spacing: 10,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.delete,
                    ),
                    onTap: () {
                      _controller.partnerships
                          .removeAt(_controller.currentPage);
                    },
                  ),
                  GestureDetector(
                      child: Icon(Icons.edit),
                      onTap: () {
                        final Future<Partnership> future = Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PartnershipAddPage(
                                  _controller
                                      .partnerships[_controller.currentPage],
                                  widget._user)),
                        );
                        future.then(
                          (partnership) {
                            if (partnership != null) {
                              print(_controller.currentPage);
                              print(partnership);
                              _controller.partnerships
                                  .removeAt(_controller.currentPage);
                              _controller.partnerships.add(partnership);
                            }
                          },
                        );
                      }),
                ],
              )
            : null,
      );
}
