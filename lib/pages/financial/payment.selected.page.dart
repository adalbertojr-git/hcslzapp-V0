import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/payment.selected.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/models/payment.months.dart';
import 'package:hcslzapp/pages/financial/payment.add.page.dart';
import 'package:asuka/asuka.dart' as asuka;

class PaymentSelectedPage extends StatefulWidget {
  final Associated _associated;

  const PaymentSelectedPage(this._associated);

  @override
  _PaymentSelectedPageState createState() => _PaymentSelectedPageState();
}

class _PaymentSelectedPageState extends State<PaymentSelectedPage> {
  PaymentSelectedController _controller = PaymentSelectedController();

  @override
  void initState() {
    _controller.getFuture(widget._associated.id).then((value) {
      if (value != null) {
        _controller.setButtonVisibilty();
      }
    });
    _controller.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<Payment>>(
          future: _controller.getFuture(widget._associated.id),//_controller.future,
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
                  if (_controller.payments.isEmpty) {
                    if (snapshot.data.length > 0) {
                      _controller.payments.addAll(snapshot.data);
                    }
                  }
                  return _buildListView;
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              'Houve um erro desconhecido ao executar a transação.',
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Observer(
          builder: (_) => _controller.isHidedButton
              ? Container()
              : Button(
                  icon: Icons.add,
                  onClick: () {
                    _add;
                  },
                ),
        ),
      );

  get _add async {
    var payment = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentAddPage(
          null,
          widget._associated,
          _controller.loadYears(),
        ),
      ),
    );
    if (payment != null) {
      _controller.setPayments(payment);
      print('Button:');
      print((_controller.payments.length));
    }
  }

  get _buildListView => Container(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
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
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: _controller.payments.length,
                  itemBuilder: (_, i) {
                    var payments = List<Payment>.from(_controller.payments);
                    return _buildExpansionTile(payments, i);
                  },
                ),
              ),
            ),
          ],
        ),
      );

  ExpansionTile _buildExpansionTile(List<Payment> payments, int i) =>
      ExpansionTile(
        title: Text(
          'Ano: ' + payments[i].year,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Total pago: R\$ '),
        trailing: Wrap(
          spacing: 10, // space between two icons
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.delete,
                size: 30.0,
              ),
              onTap: () {
                _delete(i);
              },
            ),
            GestureDetector(
              child: Icon(
                Icons.edit,
                size: 30.0,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentAddPage(_controller.payments[i],
                          widget._associated, _controller.loadYears())),
                );
              },
            ),
          ],
        ),
        children: <Widget>[
          Column(
            children: payments[i].paymentMonths.map(_buildListTile).toList(),
          ),
        ],
      );

  ListTile _buildListTile(PaymentMonths paymentMonths) => ListTile(
        leading: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 25,
        ),
        title: Text(
          'Mes: ' + paymentMonths.month.toString(),
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Valor Pago: R\$ ' + paymentMonths.value.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  _delete(int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Deseja excluir o registro selecionado?');
        });
    if (response == true) {
      _controller.deleteById(_controller.payments[i]).then((value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: Text('Mensalidade(s) excluída(s) com sucesso.'),
            ),
          );
          _controller.payments.removeAt(i);
          print(_controller.payments.length);
        } else {
          asuka.showSnackBar(
            SnackBar(
              content: Text(_controller.errorMsg),
            ),
          );
        }
      });
    }
  }
}
