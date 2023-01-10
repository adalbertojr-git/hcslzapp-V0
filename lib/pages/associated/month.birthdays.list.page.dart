import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/controllers/month.birthdays.list.controller.dart';
import 'package:hcslzapp/models/month.birthdays.dart';
import 'package:intl/intl.dart';
import '../../common/photo.image.provider.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';

const String _title = 'Aniversariantes do Mês';
const String _pathNoImage = 'assets/imgs/noImage.png';

class MonthBirthdaysListPage extends StatefulWidget {
  @override
  State<MonthBirthdaysListPage> createState() => _MonthBirthdaysListPageState();
}

class _MonthBirthdaysListPageState extends State<MonthBirthdaysListPage> {
  final MonthBirthdaysListController _controller =
      MonthBirthdaysListController();

  @override
  void initState() {
    _controller.getFuture().then((value) {
      _controller.setButtonVisibilty();
    }).catchError((e) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar:
              _controller.isHidedButton ? null : MyBottomAppBar(),
          body: FutureBuilder<List<MonthBirthdays>>(
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
                      title: ERROR,
                      message: snapshot.error.toString(),
                    );
                  } else {
                    if ((snapshot.data?.length)! > 0) {
                      _controller.associateds.clear();
                      _controller.associateds.addAll((snapshot.data)!);
                      _controller.associateds.sort(
                        (a, b) => a.date_birth.compareTo(b.date_birth),
                      );
                      return _widgets();
                    } else
                      return CenteredMessage(
                        title: WARNING,
                        message: NOTEXIST,
                      );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                title: ERROR,
                message: UNKNOWN,
              );
            },
          ),
        ),
      );

  _widgets() => Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _controller.associateds.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width - 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange[300],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      _photo(_controller.associateds[index]),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 3,
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Text(
                                'O Harley Club deseja a você,\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                _controller.associateds[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                '\nMuita saúde e kms de felicidades!!!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Dia: ' +
                              _controller.associateds[index].date_birth
                                  .toString()
                                  .substring(0, 2),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );

  _photo(MonthBirthdays birthdays) => Container(
        height: 270.0,
        width: 270.0,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(130.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(130.0),
            image: _loadPhoto(birthdays),
          ),
        ),
      );

  DecorationImage _loadPhoto(MonthBirthdays birthdays) => DecorationImage(
      image: birthdays.photoUrl != ''
          ? NetworkImage(birthdays.photoUrl)
          : PhotoImageProvider().getImageProvider(
              File(_pathNoImage),
            ) as ImageProvider,
      fit: BoxFit.fill);

  bool isToday(String dateBirth) {
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM');
    String formattedDate = formatter.format(now);
    if (dateBirth.substring(0, 5).compareTo(formattedDate) == 0)
      return true;
    else
      return false;
  }
}
