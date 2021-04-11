import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/event.calendar.controller.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:hcslzapp/models/event.dart';
import 'package:hcslzapp/pages/dependent/dependent.add.page.dart';
import 'package:hcslzapp/pages/event/event.list.page.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:table_calendar/table_calendar.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class EventCalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventCalendarPageState();
  }
}

class EventCalendarPageState extends State<EventCalendarPage>
    with SingleTickerProviderStateMixin {
  Map<DateTime, List> _events = {};
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  TextEditingController _eventController;
  EventCalendarController _controller = EventCalendarController();

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _controller.getFuture().then((value) {
      if (value != null && value.isNotEmpty) {
        _events = convertJsonToDateMap(value);
        print(_events);
        _selectedEvents = _events[_selectedDay] ?? [];
      }
    });
/*    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };*/
/*
    _events = {
      DateTime.now(): [
        'Viagem pra Ubajara',
        'Passeio na Lito',
        'Entrega de cestas básicas no Maiobão',
        'Encontro na Sede',
      ],
      DateTime.utc(2021, 4, 10): [
        'Viagem pra Santa Inês',
      ],
    };
*/
    //_selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

  Map<DateTime, List> convertJsonToDateMap(String jsonSource) {
    var json = jsonDecode(jsonSource);
    var jsonEmbedded = json['_embedded'];
    var jsonEvents = jsonEmbedded['event'];
    Map<DateTime, List<String>> events = {};
    for (var event in jsonEvents) {
      var date = parseDate(event['date']);
      events.putIfAbsent(date, () => <String>[]);
      events[date].add(event['description']);
    }
    return events;
  }

  DateTime parseDate(String date) {
    var parts = date.split('-').map(int.tryParse).toList();
    return DateTime(parts[0], parts[1], parts[2]);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    print('Day: $day');
    print('Events: $events');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onDayLongPressed(DateTime day, List events) {
    print('CALLBACK: _onDayLongPressed');
    print('Day: $day');
    print('Events: $events');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white30, Colors.deepOrange],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TopBar(),
                //_buildTableCalendar(),
                _buildTableCalendarWithBuilders(),
/*                const SizedBox(height: 8.0),
                _buildButtons(),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_upward_rounded,
                      size: 12.0,
                    ),
                    Icon(
                      Icons.arrow_downward_rounded,
                      size: 12.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Expanded(child: _buildEventList()),
              ],
            ),
          ),
        ),
      );

  Container buildAddEventButton() {
    return Container(
      child: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

/*  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'pt_BR',
      rowHeight: 65.0,
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.blue[500],
        todayColor: Colors.deepOrange,
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.black, //deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
      onDayLongPressed: _onDayLongPressed,
    );
  }*/

/*
  Widget _buildEventList2() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: _selectedEvents
                .map(
                  (event) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8),
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.black12,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 16.0,
                      ),
                      dense: true,
                      //leading: Icon(Icons.event_note),
                      title: Text(
                        event.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => print('$event tapped!'),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Container(
          //padding: EdgeInsets.only(top: 20.0),
          child: FloatingActionButton(
            heroTag: "btnAdd",
            mini: true,
            backgroundColor: Colors.deepOrangeAccent[100],
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              final Future<Dependent> future = Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DependentAddPage(null)),
              );
*/
/*              future.then(
                    (dependent) {
                  if (dependent != null) {
                    _controller.dependents.add(dependent);
                  }
                },
              );*/ /*

            },
          ),
        ),
      ],
    );
  }
*/

  Widget _buildEventList() => Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Text(
              "Eventos",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _selectedEvents.length,
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
                        leading: Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            child: Icon(Icons.event),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        trailing: Wrap(
                          spacing: 10, // space between two icons
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(
                                Icons.delete,
                              ),
                              onTap: () {
                                //_controller.dependents.removeAt(i);
                              },
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.arrow_forward,
                              ),
                              onTap: () {
                                final Future<Dependent> future = Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DependentAddPage(null),
                                  ),
                                );
/*                          future.then(
                                  (dependent) {
                                if (dependent != null) {
                                  _controller.dependents.removeAt(i);
                                  _controller.dependents.add(dependent);
                                }
                              },
                            );*/
                              },
                            ),
                          ],
                        ),
                        title: Text(_selectedEvents[i].toString()),
                        //subtitle: Text(event.toString()),
                      ),
                    );
                  },
                  separatorBuilder: (_, int index) => const Divider(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: FloatingActionButton(
                heroTag: "btnAdd",
                mini: true,
                backgroundColor: Colors.deepOrangeAccent[100],
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  final Future<Dependent> future = Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DependentAddPage(null)),
                  );
/*              future.then(
                    (dependent) {
                  if (dependent != null) {
                    _controller.dependents.add(dependent);
                  }
                },
              );*/
                },
              ),
            ),
          ],
        ),
      );

// More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pt_BR',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      rowHeight: 40,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Mês'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 Semanas'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('1 Semana'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
/*        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),*/
      ],
    );
  }
}
