import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/payment.associated.controller.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/pages/payment/payment.add.page.dart';
import '../../common/messages.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../http/http.exception.dart';
import '../../models/associated.dart';
import '../../models/template.dart';

const String _title = 'Mensalidades';

class PaymentAssociatedPage extends StatefulWidget {
  final String _selectedProfile;
  final Associated _associated;

  const PaymentAssociatedPage(
    this._selectedProfile,
    this._associated,
  );

  @override
  _PaymentAssociatedPageState createState() => _PaymentAssociatedPageState();
}

class _PaymentAssociatedPageState extends State<PaymentAssociatedPage> {
  final PaymentAssociatedController _controller = PaymentAssociatedController();

  @override
  void initState() {
    _controller.getFuture(widget._associated.id).then((value) {
      _controller.setButtonVisibilty();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar: MyBottomAppBar(),
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
                  return CenteredMessage(
                      title: _title, message: snapshot.error.toString());
                } else {
                  if ((snapshot.data?.length)! > 0) {
                    _controller.init();
                    _controller.payments.addAll(snapshot.data!);
                    _controller.payments.sort(
                      (a, b) => b.year.compareTo(a.year),
                    );
                    return _widgets();
                  } else
                    return widget._selectedProfile == ADMIN
                        ? _widgets()
                        : CenteredMessage(
                            title: _title,
                            message: NOTEXIST,
                          );
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              title: _title,
              message: UNKNOWN,
            );
          },
        ),
        floatingActionButtonLocation: widget._selectedProfile == ADMIN
            ? FloatingActionButtonLocation.centerDocked
            : null,
        floatingActionButton: widget._selectedProfile == ADMIN
            ? Observer(
                builder: (_) => _controller.isHidedButton
                    ? SizedBox()
                    : Button(
                        icon: Icons.add,
                        onClick: () {
                          _add(context);
                        },
                      ),
              )
            : null,
      );

  _add(BuildContext context) {
    Payment _payment = Template().loadPayment();
    _payment.associated = widget._associated;
    final Future future = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentAddPage(
          widget._selectedProfile,
          _payment,
          _controller.loadYears(),
        ),
      ),
    );
    future.then((value) {
      if (value != null) {
        _controller.payments.add(value);
      }
    });
  }

  _widgets() => Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: Observer(
              builder: (_) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: _controller.payments.length,
                itemBuilder: (_, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[300],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
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
                      trailing: widget._selectedProfile == ADMIN
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
                                    final Future future = Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymentAddPage(
                                          widget._selectedProfile,
                                          _controller.payments[i],
                                          _controller.loadYears(),
                                        ),
                                      ),
                                    );
                                    future.then(
                                      (payment) {
                                        if (payment != null) {
                                          _controller.payments.removeAt(i);
                                          _controller.payments
                                              .insert(i, payment);
                                        }
                                      },
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
                                      widget._selectedProfile,
                                      _controller.payments[i],
                                      _controller.loadYears(),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  );
                },
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
          ),
        ],
      );

  _delete(int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão?');
        });
    if (response == true) {
      try {
        _controller.deleteById(_controller.payments[i]);
        AsukaSnackbar.success(SUCCESS).show();
        _controller.payments.removeAt(i);
      } on HttpException catch (e) {
        AsukaSnackbar.alert(e.message.toString()).show();
      } on Exception catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }
}
