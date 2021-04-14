import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/controllers/event.calendar.controller.dart';
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
  final String _user;

  const EventCalendarPage(this._user);

  @override
  State<StatefulWidget> createState() => EventCalendarPageState();
}

class EventCalendarPageState extends State<EventCalendarPage>
    with SingleTickerProviderStateMixin {
  EventCalendarController _controller = EventCalendarController();

  @override
  void initState() {
    _controller.init;
    _controller.calController = CalendarController();
    _controller.animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _controller.animController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.animController.dispose();
    _controller.calController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    _controller.setSelectedEvents(events);
  }

  void _onDayLongPressed(DateTime day, List events) {
    _controller.setSelectedEvents(events);
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {}

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {}

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
                _buildTableCalendarWithBuilders(),
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

  Container buildAddEventButton() => Container(
        child: FloatingActionButton(
          mini: true,
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      );

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
                  itemCount: _controller.selectedEvents.length,
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
                        trailing: widget._user == 'admin'
                            ? Wrap(
                                spacing: 10, // space between two icons
                                children: <Widget>[
                                  GestureDetector(
                                    child: Icon(
                                      Icons.delete,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _controller.removeSelectedEvent(i);
                                      });
                                    },
                                  ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.edit,
                                    ),
                                    onTap: () {
                                      _showAddDialog(
                                          _controller.setEventCtrl(
                                            _controller.selectedEvents[i]
                                                .toString(),
                                          ),
                                          i);
                                    },
                                  ),
                                ],
                              )
                            : null,
                        title: Text(
                          _controller.selectedEvents[i].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //subtitle: Text(event.toString()),
                      ),
                    );
                  },
                  separatorBuilder: (_, int index) => const Divider(),
                ),
              ),
            ),
            widget._user == 'admin'
                ? Container(
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
                        _showAddDialog(null, null);
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      );

  _showAddDialog(String event, int i) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white70,
              title: Text("Adicionar Evento"),
              content: MyTextFormField(
                nLines: 2,
                textEditingController: _controller.eventCtrl,
              ),
              actions: <Widget>[
                Row(
                  children: [
                    FlatButton(
                      child: Text(
                        'Cancelar',
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      child: Text(
                        "Salvar",
                      ),
                      onPressed: () {
                        if (event != null)
                          _controller.editEvent(i);
                        else
                          _controller.addEvent();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ));
  }

  Widget _buildTableCalendarWithBuilders() => Observer(
        builder: (_) => TableCalendar(
          locale: 'pt_BR',
          calendarController: _controller.calController,
          events: _controller.events,
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
            weekendStyle: TextStyle().copyWith(color: Colors.purple),
            holidayStyle: TextStyle().copyWith(color: Colors.purple),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: TextStyle().copyWith(color: Colors.purple),
          ),
          headerStyle: HeaderStyle(
            centerHeaderTitle: true,
            formatButtonVisible: false,
          ),
          builders: CalendarBuilders(
            selectedDayBuilder: (context, date, _) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0)
                    .animate(_controller.animController),
                child: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  child: Text(
                    '${date.day}',
                    style: TextStyle().copyWith(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
            todayDayBuilder: (context, date, _) {
              return CircleAvatar(
                backgroundColor: Colors.white,
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
            _controller.animController.forward(from: 0.0);
          },
          onVisibleDaysChanged: _onVisibleDaysChanged,
          onCalendarCreated: _onCalendarCreated,
        ),
      );

  Widget _buildEventsMarker(DateTime date, List events) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _controller.calController.isSelected(date)
              ? Colors.brown[500]
              : _controller.calController.isToday(date)
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

  Widget _buildHolidaysMarker() => Icon(
        Icons.add_box,
        size: 20.0,
        color: Colors.blueGrey[800],
      );
}
