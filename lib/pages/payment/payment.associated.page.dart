import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/payment.associated.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/pages/payment/payment.add.page.dart';
import 'package:asuka/asuka.dart' as asuka;

class PaymentAssociatedPage extends StatefulWidget {
  final String _user;
  final Associated _associated;

  const PaymentAssociatedPage(this._user, this._associated);

  @override
  _PaymentAssociatedPageState createState() => _PaymentAssociatedPageState();
}

class _PaymentAssociatedPageState extends State<PaymentAssociatedPage> {
  PaymentAssociatedController _controller = PaymentAssociatedController();

  @override
  void initState() {
    _controller.getFuture(widget._associated.id).then((value) {
      if (value != null) {
        _controller.setButtonVisibilty();
      }
    });
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<Payment>>(
          future: _controller.getFuture(widget._associated.id),
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
                      _controller.payments.sort(
                        (a, b) => b.year.compareTo(a.year),
                      );
                    }
                  }
                  return _buildListView();
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              'Houve um erro desconhecido ao executar a transação.',
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: widget._user == 'admin'
            ? Observer(
                builder: (_) => _controller.isHidedButton
                    ? Container()
                    : Button(
                        icon: Icons.add,
                        onClick: () {
                          _add();
                        },
                      ),
              )
            : Container(),
      );

  _add() async {
    var payment = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentAddPage(
            widget._user, null, _controller.loadYears(), widget._associated),
      ),
    );
    if (payment != null) {
      _controller.setPayments(payment);
    }
  }

  _buildListView() => Container(
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
                          'Ano: ' + _controller.payments[i].year,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Total pago: R\$ ' +
                            _controller
                                .getTotal(_controller.payments[i].year)
                                .toString()),
                        leading: CircleAvatar(
                          child: Icon(Icons.calendar_today),
                          backgroundColor: Colors.white,
                        ),
                        trailing: widget._user == 'admin'
                            ? Wrap(
                                spacing: 10, // space between two icons
                                children: <Widget>[
                                  GestureDetector(
                                    child: Icon(
                                      Icons.delete,
                                    ),
                                    onTap: () {
                                      _delete(i);
                                    },
                                  ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.arrow_forward,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentAddPage(
                                                    widget._user,
                                                    _controller.payments[i],
                                                    _controller.loadYears(),
                                                    widget._associated)),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : GestureDetector(
                                child: Icon(
                                  Icons.arrow_forward,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaymentAddPage(
                                            widget._user,
                                            _controller.payments[i],
                                            _controller.loadYears(),
                                            widget._associated)),
                                  );
                                },
                              ),
/*                    trailing: Wrap(
                      spacing: 10, // space between two icons
                      children: <Widget>[
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_forward,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentAddPage(_controller.payments[i],
                                      _controller.loadYears())),
                            );
                          },
                        ),
                      ],
                    ),*/
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

/*

  get _buildListView2 => Container(
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
        subtitle: Text('Total: R\$ ' + _controller.getTotal().toString()),
        trailing:  widget._user == 'admin' ? Wrap(
          spacing: 10, // space between two icons
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.delete,
              ),
              onTap: () {
                _delete(i);
              },
            ),
            GestureDetector(
              child: Icon(
                Icons.edit,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentAddPage(_controller.payments[i],
                          _controller.loadYears())),
                );
              },
            ),
          ],
        ) : null,
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
          _controller.getMonthName(paymentMonths.month),
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
*/

  _delete(int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(
              msg: 'Deseja excluir o registro selecionado?');
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
