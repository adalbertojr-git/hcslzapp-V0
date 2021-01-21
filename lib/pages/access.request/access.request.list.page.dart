import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/access.request.controller.dart';
import 'package:hcslzapp/models/access.request.dart';

class AccessRequestList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccessRequestListState();
  }
}

class AccessRequestListState extends State<AccessRequestList> {
  AccessRequestController _controller = AccessRequestController();
  List<AccessRequest> _accessRequestList;

  @override
  void initState() {
    _controller.getFuture().then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.hideButton();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          body: FutureBuilder<List<AccessRequest>>(
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
                    print(snapshot.error.toString());
                    return CenteredMessage(snapshot.error.toString());
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        _controller.errorMsg,
                      );
                    if (snapshot.data.length > 0) {
                      _controller.init;
                      _controller.accessRequests.addAll(snapshot.data);
                      return _buildListView();
                    } else
                      return CenteredMessage(
                        'Não existem requisições de acesso a serem efetivadas.',
                      );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                'Houve um erro desconhecido ao executar a transação.',
              );
            },
          ),
          floatingActionButton: _controller.isHideButton
              ? null
              : Button(icon: Icons.save, onClick: () => _save),
        ),
      );

  _buildListView() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white30, Colors.deepOrange],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: _controller.accessRequests.length,
              itemBuilder: (_, int i) {
                ListItemController _listItemController = ListItemController();
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
                  child: Observer(
                    builder: (_) => ListTile(
                      title: Text(_controller.accessRequests[i].name),
                      subtitle: Text(_controller.accessRequests[i].email),
                      leading: Checkbox(
                          value: _listItemController.check,
                          onChanged: _listItemController.setCheck,
                          ),
                      trailing: Wrap(
                        spacing: 10, // space between two icons
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(
                              Icons.delete,
                              size: 25.0,
                            ),
                            onTap: () {
                              print(i);
                              _controller.accessRequests.removeAt(i);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, int index) =>
                  const Divider(),
            ),
          );
}

class _save {}
