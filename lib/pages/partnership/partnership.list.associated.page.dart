import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'dart:math';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/partnership.list.controller.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'dart:io';

import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const SCALE_FRACTION = 0.2;
const FULL_SCALE = 0.9;
const PAGER_HEIGHT = 200.0;

const String _labelNotExists = 'Não existem parceiros cadastrados.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Parcerias';

class PartnershipListAssociatedPage extends StatefulWidget {
  PartnershipListAssociatedPage();

  @override
  _PartnershipListAssociatedPageState createState() =>
      _PartnershipListAssociatedPageState();
}

class _PartnershipListAssociatedPageState
    extends State<PartnershipListAssociatedPage> {
  PartnershipListController _controller = PartnershipListController();
  double viewPortFraction = 0.5;

  @override
  void initState() {
    _controller.pageController = PageController(
      initialPage: _controller.currentPage,
      viewportFraction: viewPortFraction,
    );
    _controller.getFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar: MyBottomAppBar(),
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
                    _controller.partnerships.addAll(snapshot.data!);
                    _controller.partnerships.sort(
                      (a, b) => a.partner.compareTo(b.partner),
                    );
                    _controller.getActivePartnerships;
                    return _widgets();
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

  _widgets() => Column(
        children: [
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
                      _controller
                          .activePartnerships[_controller.currentPage].partner,
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
      image: _controller.activePartnerships[index].photoUrl != ""
          ? NetworkImage(_controller.activePartnerships[index].photoUrl)
          : PhotoImageProvider().getImageProvider(
              File(_pathNoImage),
            ) as ImageProvider,
      fit: BoxFit.contain);

  Widget buildDetail() => Observer(
        builder: (_) => Container(
          height: MediaQuery.of(context).size.height,
          //color: Colors.deepOrange[300],
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
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Endereço: ' +
                  _controller
                      .activePartnerships[_controller.currentPage].address,
            ),
            Text(
              'Telefone(s): ' +
                  _controller
                      .activePartnerships[_controller.currentPage].phone1 +
                  ' - ' +
                  _controller
                      .activePartnerships[_controller.currentPage].phone2,
            ),
          ],
        ),
      );
}
