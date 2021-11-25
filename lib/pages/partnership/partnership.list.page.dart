import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/progress.dart';
import 'dart:math';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/partnership.list.controller.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:hcslzapp/pages/partnership/partnership.add.page.dart';
import 'dart:io';
import 'package:asuka/asuka.dart' as asuka;

const SCALE_FRACTION = 0.2;
const FULL_SCALE = 0.9;
const PAGER_HEIGHT = 200.0;

class PartnershipListPage extends StatefulWidget {
  final String _selectedProfile;

  PartnershipListPage(this._selectedProfile);

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
          future: widget._selectedProfile == ADMIN
              ? _controller.getFuture()
              : _controller.future,
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
                    _controller.init();
                    _controller.partnerships.addAll(snapshot.data);
                    _controller.partnerships.sort(
                      (a, b) => a.partner.compareTo(b.partner),
                    );
                    if (widget._selectedProfile == ASSOCIATED) {
                      _controller.getActivePartnerships;
                    }
                  }
                  return _widgets();
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              'Houve um erro desconhecido ao executar a transação.',
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: widget._selectedProfile == ADMIN
            ? Observer(
                builder: (_) => _controller.isHidedButton
                    ? Container()
                    : Button(
                        icon: Icons.add,
                        onClick: () {
                          _add(context);
                        },
                      ),
              )
            : Container(),
      );

  _add(BuildContext context) {
    final Future<Partnership> future = Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PartnershipAddPage(null)),
    );
    future.then(
      (partnership) {
        if (partnership != null) {
          _controller.partnerships.add(partnership);
        }
      },
    );
  }

  _widgets() =>
      widget._selectedProfile == ADMIN ? _listAdmin() : _listAssociated();

  _listAdmin() => Container(
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
                builder: (_) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _controller.partnerships.length,
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
                            _controller.partnerships[i].partner,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                              'Status: ' + _controller.partnerships[i].status),
                          leading: CircleAvatar(
                            child: Icon(Icons.emoji_people),
                            backgroundColor: Colors.white,
                          ),
                          trailing: Wrap(
                            spacing: 10,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.delete,
                                ),
                                onTap: () {
                                  _delete(i);
                                },
                              ),
                              GestureDetector(
                                  child: Icon(Icons.arrow_forward),
                                  onTap: () {
                                    final Future<Partnership> future =
                                        Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PartnershipAddPage(
                                                  _controller.partnerships[i])),
                                    );
                                    future.then((partnership) {
                                      if (partnership != null) {
                                        _controller.partnerships.removeAt(i);
                                        _controller.partnerships
                                            .insert(i, partnership);
                                      }
                                    });
                                  }),
                            ],
                          )),
                    );
                  },
                  separatorBuilder: (_, int index) => const Divider(),
                ),
              ),
            ),
          ],
        ),
      );

  _listAssociated() => Container(
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
                          itemCount: _controller.activePartnerships.length,
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
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        _controller.activePartnerships[_controller.currentPage]
                            .partner,
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
            height: PAGER_HEIGHT * scale,
            width: PAGER_HEIGHT * scale,
            child: Card(
              elevation: 15,
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
      image: _controller.activePartnerships[index].photoUrl != null
          ? NetworkImage(_controller.activePartnerships[index].photoUrl)
          : PhotoImageProvider().getImageProvider(
              File('assets/imgs/noImage.png'),
            ),
      fit: BoxFit.contain);

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
                  _controller
                      .activePartnerships[_controller.currentPage].promotion,
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
        title: Text(
          _controller.activePartnerships[_controller.currentPage].partner,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Endereço: ' +
                  _controller
                      .activePartnerships[_controller.currentPage].address,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              'Telefone(s): ' +
                  _controller
                      .activePartnerships[_controller.currentPage].phone1 +
                  ' - ' +
                  _controller
                      .activePartnerships[_controller.currentPage].phone2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );

  _delete(int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(
              msg: 'Deseja excluir o registro selecionado?');
        });
    if (response == true) {
      _controller.deleteById(_controller.partnerships[i]).then((value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: Text('Parceiro excluído com sucesso.'),
            ),
          );
          _controller.partnerships.removeAt(i);
        } else {
          asuka.showSnackBar(
            SnackBar(
              content: Text(_controller.errorMsg),
            ),
          );
        }
      });
    }
  }
}
