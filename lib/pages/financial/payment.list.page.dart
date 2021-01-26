import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/controllers/payment.controller.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/models/payment.months.dart';
import 'package:hcslzapp/repositories/payment.repo.dart';

class PaymentList extends StatefulWidget {
  final int paymentId;

  const PaymentList(this.paymentId);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  PaymentController _controller = PaymentController();

  @override
  void initState() {
    _controller.getFuture(widget.paymentId).then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.hideButton();
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
                    if (snapshot.data.length > 0) {
                      _controller.init;
                      _controller.payments.addAll(snapshot.data);
                      return _buildListView;
                    } else
                      return CenteredMessage(
                        'Não existem registros de mensalidades para o associado.',
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
              : Button(
                  icon: Icons.arrow_back,
                  onClick: () => Navigator.of(context).pop(),
                ),
        ),
      );

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Payment>>(
        */ /*
        carrega JSON com dados da api
        */ /*
        future: _webClient.findByAssociado_Codigo(2),
        */ /*
        -------------------------------
        */ /*
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Payment> mensalidades = snapshot.data;
                if (mensalidades.isNotEmpty) {
                  return _buildListView(context, mensalidades);
                }
              }
              return CenteredMessage(
                'Mensalidades nao encontradas.',
              );
              break;
          }
          */ /*
            este codigo na pratica nao e alcançado (todos os cenarios possiveis ja
            foram tratados acima), podendo assi retornar Null, mas
            deve-se sempre evitar essa situacao
            Envia-se uma msg generica
          */ /*
          return CenteredMessage(
            'Erro desconhecido.',
          );
        },
      ),
    );
  }*/

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
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Pagamentos realizados:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
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

  ExpansionTile _buildExpansionTile(List<Payment> payments, int i) => ExpansionTile(
        leading: Icon(
          Icons.calendar_today,
          color: Colors.orangeAccent,
          size: 30,
        ),
        title: Text(
          'Ano: ' + payments[i].year,
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
      subtitle: Text('Valor Pago: 25,00'),
    );

}
