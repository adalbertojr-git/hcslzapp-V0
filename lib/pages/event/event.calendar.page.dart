import 'dart:io';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../common/associated.profiles.dart';
import '../../common/photo.image.provider.dart';
import '../../components/button.dart';
import '../../components/centered.message.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../components/progress.dart';
import '../../components/transaction.auth.dialog.dart';
import '../../controllers/event.calendar.controller.dart';
import 'event.add.page.dart';

const String _title = 'Eventos';
const String _pathNoImage = 'assets/imgs/noImage.png';

class EventCalendarPage extends StatefulWidget {
  final String _selectedProfile;

  EventCalendarPage(this._selectedProfile);

  @override
  _EventCalendarPageState createState() => _EventCalendarPageState();
}

class _EventCalendarPageState extends State<EventCalendarPage> {
  final EventCalendarController _controller = EventCalendarController();
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  final kToday = DateTime.now();
  late var kFirstDay;
  late var kLastDay;

  @override
  void initState() {
    super.initState();
    _loadAllEvents();
  }

  _loadAllEvents() {
    _controller.getFuture().then((value) {
      _controller.setButtonVisibilty();
    }).catchError((e) {});
    _selectedDay = _focusedDay;
    kFirstDay = DateTime(2023, 01, 01);
    kLastDay = DateTime(2101, 12, 31);
  }

  @override
  void dispose() {
    _controller.selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    if (_controller.events[day] == null)
      return [];
    else
      return _controller.events[day] as List<Event>;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    //if (!isSameDay(_selectedDay, selectedDay)) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _rangeStart = null; // Important to clean those
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });
    _controller.selectedEvents.value = _getEventsForDay(selectedDay);
    //}
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar:
              _controller.isHidedButton ? null : MyBottomAppBar(),
          body: FutureBuilder<String>(
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
                    _controller.init();
                    _controller.events =
                        _controller.convertJsonToDateMap(snapshot.data!);
                    _controller.selectedEvents =
                        ValueNotifier(_getEventsForDay(_selectedDay!));
                    return _widgets();
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                title: ERROR,
                message: UNKNOWN,
              );
            },
          ),
          floatingActionButtonLocation: widget._selectedProfile == ADMIN
              ? FloatingActionButtonLocation.centerDocked
              : null,
          floatingActionButton: widget._selectedProfile == ADMIN
              ? _controller.isHidedButton
                  ? null
                  : Button(
                      icon: Icons.add,
                      onClick: () {
                        Future future = Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventAddPage(
                              widget._selectedProfile,
                              null,
                              _selectedDay.toString().substring(0, 10),
                            ),
                          ),
                        );
                        future.then((value) {
                          if (value != null) _loadAllEvents();
                        });
                      },
                    )
              : null,
        ),
      );

  _widgets() => Column(
        children: [
          Card(
            elevation: 5,
            child: TableCalendar<Event>(
              locale: 'pt_BR',
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode,
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                // Use `CalendarStyle` to customize the UI
                outsideDaysVisible: false,
                isTodayHighlighted: true,
              ),
              onDaySelected: _onDaySelected,
              //onRangeSelected: _onRangeSelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
                _controller.selectedEvents.value = [];
              },
              rowHeight: 50,
/*              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  if (day.weekday == DateTime.sunday) {
                    final text = DateFormat.E().format(day);

                    return Center(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                },
                markerBuilder: (context, day, selectedEvents) {

                }
              ),*/
            ),
          ),
          const SizedBox(height: 5.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _controller.selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: _photo(value[index]),
                            title: Text(
                              value[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: value[index]
                                        .initialDate
                                        .compareTo(value[index].endDate) !=
                                    0
                                ? Text(
                                    'Período: de ' +
                                        value[index]
                                            .initialDate
                                            .substring(8, 10) +
                                        ' a ' +
                                        value[index].endDate.substring(8, 10),
                                  )
                                : Text(
                                    'Período: dia ' +
                                        value[index]
                                            .initialDate
                                            .substring(8, 10),
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
                                          _delete(value[index]);
                                        },
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.edit,
                                        ),
                                        onTap: () {
                                          Future future = Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EventAddPage(
                                                widget._selectedProfile,
                                                value[index],
                                                _selectedDay
                                                    .toString()
                                                    .substring(0, 10),
                                              ),
                                            ),
                                          );
                                          future.then((value) {
                                            if (value != null) _loadAllEvents();
                                          });
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
                                          builder: (context) => EventAddPage(
                                            widget._selectedProfile,
                                            value[index],
                                            _selectedDay
                                                .toString()
                                                .substring(0, 10),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      );

  _photo(Event event) => Container(
        width: 60.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(130.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(130.0),
            image: _loadPhoto(event),
          ),
        ),
      );

  DecorationImage _loadPhoto(Event event) => DecorationImage(
      image: event.photoUrl != ""
          ? NetworkImage(event.photoUrl)
          : PhotoImageProvider().getImageProvider(
              File(_pathNoImage),
            ) as ImageProvider,
      fit: BoxFit.fill);

  _delete(Event event) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão?');
        });
    if (response == true) {
      try {
        AsukaSnackbar.message(WAIT).show();
        await _controller.deleteById(event);
        if (event.photoUrl != '') {
          await _controller.deletePhoto(event.photoUrl);
        }
        AsukaSnackbar.success(SUCCESS).show();
        _loadAllEvents();
      } on HttpException catch (e) {
        AsukaSnackbar.alert(e.message.toString()).show();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }
}
