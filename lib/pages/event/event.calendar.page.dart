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
    print('_getEventsForDay');
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
                    _controller.events = _controller.convertJsonToDateMap(snapshot.data!);
                    _controller.selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

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
                    //_controller.titleCtrl.clear();
                    //_showAddDialog(null, 0);
                  },
                )
              : SizedBox(),
        ),
      );

  _widgets() => Column(
        children: [
          TableCalendar<Event>(
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
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _controller.selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      );
}
