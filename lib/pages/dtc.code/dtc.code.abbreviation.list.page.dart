import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/dtc.code.abbreviation.list.controller.dart';

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
    _controller.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white30, Colors.deepOrange],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: _widgets()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button(
        icon: Icons.arrow_back,
        onClick: () => Navigator.of(context).pop(),
      ),
    );
  }

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
            TopMargin(),
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
                        subtitle: Text(_controller.listFiltered[i].description +
                            '\n' +
                            _controller.listFiltered[i].translation),
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
