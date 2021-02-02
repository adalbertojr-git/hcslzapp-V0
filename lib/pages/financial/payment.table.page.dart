import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/payment.table.controller.dart';
import 'package:hcslzapp/models/payment.table.dart';

class PaymentTablePage extends StatefulWidget {
  @override
  _PaymentTablePageState createState() => _PaymentTablePageState();
}

class _PaymentTablePageState extends State<PaymentTablePage> {
  PaymentTableController _controller = PaymentTableController();
  int _rowsPerPage = 10;

  @override
  void initState() {
    //_controller = Provider.of<AssociatedController>(context, listen: false);
    _controller.getFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          body: FutureBuilder<List<PaymentTable>>(
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
                      _controller.init;
                      _controller.payments.addAll(snapshot.data);
                      return _widgets();
                    } else
                      return CenteredMessage(
                        'Não existem requisições de acesso a serem aprovadas.',
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
            TopMargin(),
            Row(
              children: [
                Expanded(
                  child: InputTextField(
                    textEditingController: _controller.yearCtrl,
                    label: labelYear,
                    icon: Icons.calendar_today_outlined,
                    inputType: TextInputType.number,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InputTextField(
                    textEditingController: _controller.nameCtrl,
                    label: labelName,
                    icon: Icons.person,
                    inputType: TextInputType.text,
                  ),
                ),
                Button(
                  icon: Icons.search,
                  mini: true,
                  onClick: null,
                ),
              ],
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _controller.payments.length,
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
                          _controller.payments[i].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Total:' +
                            (_controller.payments[i].total.toString())),
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                          backgroundColor: Colors.white,
                        ),
                        trailing: Wrap(
                          spacing: 10, // space between two icons
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(
                                Icons.arrow_forward,
                                size: 30.0,
                              ),
                              onTap: () {
/*                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AssociatedUpdate(
                                      _controller.payments[i].id)),
                            );*/
                              },
                            ),
                          ],
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
