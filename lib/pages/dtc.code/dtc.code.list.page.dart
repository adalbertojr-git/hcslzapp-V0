import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/dtc.code.list.controller.dart';

class DtcCodeListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DtcCodeListPageState();
  }
}

class DtcCodeListPageState extends State<DtcCodeListPage> {
  DtcCodeListController _controller = DtcCodeListController();

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
              label: labelDtcCode,
              hint: hintDtcCode,
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
                        isThreeLine: true,
                        title: Text(
                          _controller.listFiltered[i].code,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Text(
                              _controller.listFiltered[i].description,
                              textAlign: TextAlign.justify,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text('\n' +
                                _controller.listFiltered[i].group,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 11.0),
                              ),
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          child: Icon(Icons.error_outline_rounded),
                          backgroundColor: Colors.red,
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
