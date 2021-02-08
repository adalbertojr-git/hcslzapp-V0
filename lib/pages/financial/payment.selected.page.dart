import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/payment.selected.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/models/payment.months.dart';
import 'package:hcslzapp/pages/financial/payment.add.page.dart';
import 'package:asuka/asuka.dart' as asuka;

class PaymentSelected extends StatefulWidget {
  final Associated _associated;

  const PaymentSelected(this._associated);

  @override
  _PaymentSelectedState createState() => _PaymentSelectedState();
}

class _PaymentSelectedState extends State<PaymentSelected> {
  PaymentSelectedController _controller = PaymentSelectedController();

  @override
  void initState() {
    _controller.getFuture(widget._associated.id).then((value) {
      if (value != null) {
        _controller.setButtonVisibilty();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          body: FutureBuilder<List<Payment>>(
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
                    _controller.init;
                    if (snapshot.data.length > 0) {
                      _controller.payments.addAll(snapshot.data);
                    }
                    return _buildListView;
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                'Houve um erro desconhecido ao executar a transação.',
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: _controller.isHidedButton
              ? null
              : Button(
                  icon: Icons.add,
                  onClick: () {
                    final Future<Payment> future = Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PaymentAdd(null, widget._associated)));
                    future.then(
                      (payment) {
                        if (payment != null) {
                          _controller.payments.add(payment);
                        }
                      },
                    );
                  },
                ),
        ),
      );

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
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _controller.payments.length,
                itemBuilder: (_, i) {
                  var payments = List<Payment>.from(_controller.payments);
                  return _buildExpansionTile(payments, i);
                },
              ),
            ),
          ],
        ),
      );

  ExpansionTile _buildExpansionTile(List<Payment> payments, int i) =>
      ExpansionTile(
        //initiallyExpanded: true,
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
                _delete(_controller.payments[i]);
              },
            ),
            GestureDetector(
              child: Icon(
                Icons.edit,
                size: 30.0,
              ),
              onTap: () {
                print(_controller.payments[i]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentAdd(
                          _controller.payments[i], widget._associated)),
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

  _delete(Payment payment) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog();
        });
    if (response == true) {
      _controller.deleteById(payment).then((value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: Text('Mensalidade excluída com sucesso.'),
            ),
          );
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
