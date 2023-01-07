import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'dart:math';
import 'package:hcslzapp/controllers/partnership.list.controller.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'dart:io';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const SCALE_FRACTION = 0.2;
const FULL_SCALE = 0.9;
const PAGER_HEIGHT = 300.0;

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
  final PartnershipListController _controller = PartnershipListController();
  final double viewPortFraction = 0.5;

  @override
  void initState() {
    _controller.pageController = PageController(
      initialPage: _controller.currentPage,
      viewportFraction: viewPortFraction,
    );
    _controller.getFuture().then((value) {
      _controller.setButtonVisibilty();
    }).catchError((e) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar:
              _controller.isHidedButton ? null : MyBottomAppBar(),
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
                      title: ERROR,
                      message: snapshot.error.toString(),
                    );
                  } else {
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
      image: _controller.activePartnerships[index].photoUrl != ''
          ? NetworkImage(_controller.activePartnerships[index].photoUrl)
          : PhotoImageProvider().getImageProvider(
              File(_pathNoImage),
            ) as ImageProvider,
      fit: BoxFit.contain);

  Widget buildDetail() => Observer(
        builder: (_) => Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              Card(
                elevation: 5,
                color: Colors.deepOrange[300],
                child: ListTile(
                  isThreeLine: true,
                  title: Text(
                    _controller
                        .activePartnerships[_controller.currentPage].partner,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Endereço: ' +
                            _controller
                                .activePartnerships[_controller.currentPage]
                                .address,
                      ),
                      Text(
                        'Telefone(s): ' +
                            _controller
                                .activePartnerships[_controller.currentPage]
                                .phone1 +
                            ' - ' +
                            _controller
                                .activePartnerships[_controller.currentPage]
                                .phone2,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 570,
                child: Card(
                  elevation: 5,
                  color: Colors.deepOrange[300],
                  child: Center(
                    child: Text(
                      _controller.activePartnerships[_controller.currentPage]
                          .promotion,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
