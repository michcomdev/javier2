import 'package:flutter/material.dart';
import 'package:myhealthy/utils/colors.dart';
import 'package:myhealthy/utils/models/day.dart';
import 'package:myhealthy/widgets/appbar.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'add_food.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final ValueNotifier<List<Day>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          myAppbar(
              titleColor: red1,
              leading: Icon(
                Icons.menu,
                color: red1,
                size: 7.0.w,
              ),
              trailing: SizedBox.shrink(),
              title: 'Calendario'),
          // subtitle: Text(
          //   StringUtils.capitalize(
          //       DateFormat.EEEE("es_ES").format(today) + " ${today.day}"),
          //   style: TextStyle(color: red4, fontSize: 14.0.sp),
          // ),

          TableCalendar<Day>(
            locale: "es_ES",
            firstDay: _focusedDay,
            lastDay: _focusedDay.add(Duration(days: 100)),
            focusedDay: _focusedDay,
            availableCalendarFormats: {
              CalendarFormat.month: "Mes",
              CalendarFormat.twoWeeks: "2 semanas",
              CalendarFormat.week: "Semana"
            },
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            // eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            // onDaySelected: _onDaySelected,
            // onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: 2.0.h),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddFood(),
                    ));
              },
              child: Text("test"))
        ],
      ),
    );
  }
}
