import 'package:flutter/material.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.access.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.list.dart';

const _tituloAppBar = 'Codigos DTC';

class TabDtcCode extends StatelessWidget {
  const TabDtcCode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.help_outline), text: 'Como acessar?'),
      Tab(icon: Icon(Icons.search), text: 'Pesquisar'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            _tituloAppBar,
            style: TextStyle(color: Colors.orange),
          ),
          // If `TabController controller` is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 25.0),
                insets: EdgeInsets.symmetric(horizontal: 30.0)),
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(children: <Widget>[
          DtcCodeAccess(),
          DtcCodeList(),
        ]),
      ),
    );
  }
}
