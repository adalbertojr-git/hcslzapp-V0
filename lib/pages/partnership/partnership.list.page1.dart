import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/pages/partnership/partnership.add.page.dart';

class PartnershipListPage1 extends StatefulWidget {
  final String _user;

  PartnershipListPage1(this._user);

  @override
  _PartnershipListPage1State createState() => _PartnershipListPage1State();
}

class _PartnershipListPage1State extends State<PartnershipListPage1> {

  @override
  void initState() {
/*    _controller.getFuture(widget._associatedId).then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: PageView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return DetailPage(index);
                    }));
              },
              child: Hero(
                tag: index,
                child: Card(
                  margin: EdgeInsets.fromLTRB(5, 50, 5, 80),
                  color: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 10,
                          bottom: 20,
                          right: 10,
                          child: Image.asset(
                            'assets/imgs/noImage.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
/*      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button(icon: Icons.add, onClick: () =>
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PartnershipAddPage(null, widget._user)),
          ),
      ),*/
    );
  }
}

class DetailPage extends StatefulWidget {
  final index;

  DetailPage(this.index);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                buildSliverHead(),
                SliverToBoxAdapter(child: buildDetail()),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery
                    .of(context)
                    .padding
                    .top,
              ),
              child: SizedBox(
                height: kToolbarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
/*                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    )*/
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expandedHeight,
        roundedContainerHeight,
        widget.index,
      ),
    );
  }

  Widget buildDetail() {
    return Container(
      color: Colors.black26,
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
              'Creates insets with symmetrical vertical and horizontal offsets.' *
                  20,
              style: TextStyle(
                color: Colors.black,
                height: 1.4,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserInfo() {
    return ListTile(
/*      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 24,
        backgroundImage: AssetImage(
          'assets/imgs/hdlogo.png',
        ),
      ),*/
      title: Text('siberian'),
      subtitle: Text('owl'),
      trailing: Icon(Icons.arrow_upward_rounded),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;
  final index;

  DetailSliverDelegate(this.expandedHeight, this.roundedContainerHeight,
      this.index);

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Hero(
        tag: index,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/imgs/noImage.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              fit: BoxFit.contain,
            ),
            Positioned(
              top: expandedHeight - roundedContainerHeight - shrinkOffset,
              left: 0,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: roundedContainerHeight,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
/*            Positioned(
              top: expandedHeight - 120 - shrinkOffset,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Flutter',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'owl',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
