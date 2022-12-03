import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/dtc.code.list.controller.dart';
import 'package:hcslzapp/models/dtc.code.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _labelNotExists = 'Não existem códigos DTC cadastrados.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _title = 'Códigos DTC';


class DtcCodeListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DtcCodeListPageState();
  }
}

class DtcCodeListPageState extends State<DtcCodeListPage> {
  final DtcCodeListController _controller = DtcCodeListController();

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
          appBar: MyAppBar(_title),
          bottomNavigationBar: MyBottomAppBar(),
          body: FutureBuilder<List<DtcCode>>(
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
                    return CenteredMessage(title: _title,
                        message: snapshot.error.toString());
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        title: _title,
                        message: _controller.errorMsg,
                      );
                    if ((snapshot.data?.length)! > 0) {
                      _controller.init();
                      _controller.codes.addAll(snapshot.data!);
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
        ),
      );

  _widgets() => ListView(
    children: [
      SizedBox(height: 10),
      MyTextFormField(
        textEditingController: _controller.codeCtrl,
        label: labelDtcCode,
        hint: hintDtcCode,
        icon: Icons.search,
        inputType: TextInputType.text,
        onChanged: _controller.setFilter,
      ),
      Observer(
        builder: (_) => ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15),
          shrinkWrap: true,
          itemCount: _controller.listFiltered.length,
          itemBuilder: (_, int i) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange[300],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                title: Text(
                  _controller.listFiltered[i].code,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _controller.listFiltered[i].description,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '\n' +
                            _getGroup(_controller.listFiltered[i].code),
                        textAlign: TextAlign.left,
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
    ],
  );

  String _getGroup(String code) {
    if (code.startsWith('P'))
      return 'Problema monitorado pela ECM';
    else if (code.startsWith('C'))
      return 'Problema com ABS';
    else if (code.startsWith('B'))
      return 'Problema definido por Rádio, Instrumentos e BCM';
    else
      return 'Problema de comunicação com os módulos';
  }
}
