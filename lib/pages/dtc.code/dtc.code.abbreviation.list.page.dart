import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/dtc.code.abbreviation.list.controller.dart';
import 'package:hcslzapp/models/dtc.code.abbreviation.dart';

class DtcCodeAbbreviationListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DtcCodeAbbreviationListPageState();
  }
}

class DtcCodeAbbreviationListPageState
    extends State<DtcCodeAbbreviationListPage> {
  DtcCodeAbbreviationListController _controller =
      DtcCodeAbbreviationListController();

  @override
  void initState() {
    _controller.getFuture().then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
    builder: (_) => Scaffold(
      body: FutureBuilder<List<DtcCodeAbbreviation>>(
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
                  _controller.init();
                  _controller.abbreviations.addAll(snapshot.data);
                  return _widgets();
                } else
                  return CenteredMessage(
                    'Não existem abreviaturas de códigos DTC cadastradas.',
                  );
              }
          } //switch (snapshot.connectionState)
          return CenteredMessage(
            'Houve um erro desconhecido ao executar a transação.',
          );
        },
      ),
    ),
  );

  _widgets() => Container(
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
            MyTextFormField(
              textEditingController: _controller.codeCtrl,
              label: labelAbbreviation,
              hint: hintAbbreviation,
              icon: Icons.search,
              inputType: TextInputType.text,
              onChanged: _controller.setFilter,
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _controller.listFiltered.length,
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
                          _controller.listFiltered[i].code,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          _controller.listFiltered[i].description,
                        ),
                        leading: CircleAvatar(
                          child: Icon(Icons.check),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, int index) => const Divider(),
                ),
              ),
            ),
          ],
        ),
      );
}
