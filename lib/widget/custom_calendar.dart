import 'package:flutter/material.dart';
import 'package:internation_app/model/days.dart';
import 'package:internation_app/model/month.dart';
import '../component/global_class.dart';
import '../model/types.dart';

class CustomCalendar extends StatelessWidget {
  final double height;
  final double width;
  final List<Types> types;
  final Month month;
  final void Function(int, int) onTap;

  const CustomCalendar({
    super.key,
    required this.height,
    required this.width,
    required this.onTap,
    required this.types,
    required this.month,
  });

  Color _getDayColor(int dayType) {
    Color color = Colors.transparent;
    if (types.any((element) => element.type == dayType)) {
      color = Color(int.parse(types.firstWhere((element) => element.type == dayType).color.replaceFirst('#', '0xFF')));
    }
    return color;
  }

  Widget _getDays() {
    List<Widget> rows = [];
    List<Widget> cols = [];

    DateTime lastDayOfMonth = DateTime(month.year, int.parse(month.month) + 1, 0);
    DateTime firstDayOfMonth = DateTime(month.year, int.parse(month.month), 1);
    for (int i = 1; i < firstDayOfMonth.weekday; i++) {
      rows.add(
        Container(
          width: width / 7,
          height: height * 0.07,
          alignment: Alignment.center,
        ),
      );
    }
    for (int j = 1; j <= lastDayOfMonth.day; j++) {
      bool isExist = month.days.any((element) => element.day == j);
      Days? day;
      if (isExist) {
        day = month.days.firstWhere((element) => element.day == j);
      }
      rows.add(
        Container(
          width: width / 7,
          height: height * 0.07,
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              if (isExist) {
                onTap(day!.type, day.day);
              }
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: width / 9,
              height: height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isExist ? _getDayColor(day!.type) : Colors.transparent,
              ),
              child: Text(
                j.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: rows.length ==6 ? Colors.red : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
      );
      if (rows.length == 7) {
        cols.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: rows,
          ),
        );
        rows = [];
      } else if (rows.length != 7 && j == lastDayOfMonth.day) {
        cols.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: rows,
          ),
        );
      }
    }

    return Column(
      children: cols,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (int i = 0; i < Global.weekDays.length; i++)
                  Container(
                    width: width / 7,
                    height: height * 0.07,
                    alignment: Alignment.center,
                    child: Text(
                      Global.weekDays[i].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Global.weekDays[i].color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.5,
            child: _getDays(),
          ),
        ],
      ),
    );
  }
}
