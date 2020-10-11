/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020
*/
import 'package:flutter/material.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/http/webclients/payment.webclient.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/models/payment.months.dart';

const _tituloAppBar = 'Mensalidades';

class PaymentList extends StatelessWidget {
  final PaymentWebClient _webClient = PaymentWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: MyAppBar(_tituloAppBar),
      body: FutureBuilder<List<Payment>>(
        /*
        carrega JSON com dados da api
        */
        future: _webClient.findByAssociado_Codigo(1),
        /*
        -------------------------------
        */
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
                print('mensalidades');
                print(mensalidades);
                if (mensalidades.isNotEmpty) {
                  return Container(
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
                        SizedBox (
                          height: 20.0,
                        ),
                        InputTextField(
                          //controlador: _controladorPadrinho,
                          label: 'Situaçao', //_rotuloPadrinho,
                          icon: Icons.attach_money,
                          valor: 'ADIMPLENTE', //mensalidades[i].,
                          disabled: true,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        Text('Meses Quitados:'),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: mensalidades.length,
                            itemBuilder: (context, i) {
                              return buildExpansionTile(mensalidades, i);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
              return CenteredMessage(
                'Mensalidades nao encontradas.',
                icon: Icons.warning,
              );
              break;
          }
          /*
            este codigo na pratica nao e alcançado (todos os cenarios possiveis ja
            foram tratados acima), podendo assi retornar Null, mas
            deve-se sempre evitar essa situacao
            Envia-se uma msg generica
          */
          return CenteredMessage(
            'Erro desconhecido.',
            icon: Icons.error,
          );
        },
      ),
    );
  }

  ExpansionTile buildExpansionTile(List<Payment> mensalidades, int i) {
    return ExpansionTile(
      backgroundColor: Colors.white30,
      title: Text(
        'Ano: ' + mensalidades[i].year,
      ),
      children: <Widget>[
        Column(
          children:
              mensalidades[i].paymentMonths.map(buildListTile).toList(),
        ),
      ],
    );
  }

  ListTile buildListTile(PaymentMonths mesesMensalidade) {
    return ListTile(
      dense: true,
      leading: Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 30,
      ),
      title: Text(
        'Mes: ' + mesesMensalidade.month.toString(),
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('Valor Pago: 25,00'),
    );
  }
}
