import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/payment.list.controller.dart';
import 'package:hcslzapp/pages/payment/payment.table.page.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../models/associated.dto.dart';

const String _labelNotExists =
    'Não existem associados cadastrados. Confira as requisições de acesso.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _title = 'Associados';

class PaymentListPage extends StatefulWidget {
  final String _selectedProfile;

  const PaymentListPage(this._selectedProfile);

  @override
  _PaymentListPageState createState() => _PaymentListPageState();
}

class _PaymentListPageState extends State<PaymentListPage> {
  final PaymentListController _controller = PaymentListController();

  @override
  void initState() {
    //_controller = Provider.of<AssociatedController>(context, listen: false);
    _controller.init();
    _controller.getFuture().then((value) {
      _controller.setButtonVisibilty();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
      builder: (_) => Scaffold(
            appBar: MyAppBar(_title),
            bottomNavigationBar: MyBottomAppBar(),
            body: FutureBuilder<List<AssociatedDTO>>(
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
                      return CenteredMessage(
                          title: _title, message: snapshot.error.toString());
                    } else {
                      if (snapshot.data == null)
                        return CenteredMessage(
                          title: _title,
                          message: _controller.errorMsg,
                        );
                      if ((snapshot.data?.length)! > 0) {
                        _controller.init();
                        _controller.associateds.addAll(snapshot.data!);
                        _controller.associateds.sort(
                          (a, b) => a.name.compareTo(b.name),
                        );
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _controller.isHidedButton
                ? Container()
                : Button(
                    icon: Icons.apps,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentsTablePage()),
                      );
                    },
                  ),
          ));

  _widgets() => Center(
        child: ListView(
          children: [
            SizedBox(height: 10),
            MyTextFormField(
              textEditingController: _controller.nameCtrl,
              label: labelNamePayment,
              hint: hintNamePayment,
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
                        _controller.listFiltered[i].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Tel.: ' +
                          (_controller.listFiltered[i].phone != null
                              ? _controller.listFiltered[i].phone
                              : 'Não informado') +
                          '\n' +
                          'Status: ' +
                          _controller.listFiltered[i].status),
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
                            ),
                            onTap: () {
/*                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentAssociatedPage(
                                    widget._selectedProfile,
                                    _controller.listFiltered[i],
                                  ),
                                ),
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
          ],
        ),
      );
}
