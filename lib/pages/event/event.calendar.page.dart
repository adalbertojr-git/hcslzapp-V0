import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../common/associated.profiles.dart';
import '../../components/button.dart';
import '../../components/centered.message.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../components/progress.dart';
import '../../controllers/event.calendar.controller.dart';
import 'event.add.page.dart';

const String _title = 'Eventos';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';

class EventCalendarPage extends StatefulWidget {
  final String _selectedProfile;

  EventCalendarPage(this._selectedProfile);

  @override
  _EventCalendarPageState createState() => _EventCalendarPageState();
}

class _EventCalendarPageState extends State<EventCalendarPage> {
  final EventCalendarController _controller = EventCalendarController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
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
    _controller.getFuture().then((value) {
      if (value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    });
    _selectedDay = _focusedDay;
    kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
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
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      _controller.selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          appBar: MyAppBar(_title),
          bottomNavigationBar: MyBottomAppBar(),
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
                        title: _title, message: snapshot.error.toString());
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        title: _title,
                        message: _controller.errorMsg,
                      );

                    _controller.init();
                    _controller.events =
                        _controller.convertJsonToDateMap(snapshot.data!);
                    _controller.selectedEvents =
                        ValueNotifier(_getEventsForDay(_selectedDay!));

                    return _widgets();
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                title: _title,
                message: _labelUnknown,
              );
            },
          ),
          floatingActionButtonLocation: widget._selectedProfile == ADMIN
              ? FloatingActionButtonLocation.centerDocked
              : null,
          floatingActionButton: widget._selectedProfile == ADMIN
              ? Button(
                  icon: Icons.add,
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventAddPage(
                          null,
                          _selectedDay.toString().substring(0, 10),
                        ),
                      ),
                    );
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
              rowHeight: 60,
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _controller.selectedEvents,
              builder: (context, value, _) {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[300],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            child: Icon(Icons.event),
                            backgroundColor: Colors.white,
                          ),
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
                                      //_delete(i);
                                    },
                                  ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.edit,
                                    ),
                                    onTap: () {
                                      //_controller.setEventTitle(event.title);
                                      //_showAddDialog(event, i);
                                    },
                                  ),
                                ],
                              )
                            : null,
                        title: Text(
                          value[index].title,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, int index) => const Divider(),
                );
              },
            ),
          ),
        ],
      );
}
