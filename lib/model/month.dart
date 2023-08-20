import 'days.dart';

class Month {
  final String month;
  final int year;
  final List<Days> days;

  Month({
    required this.month,
    required this.year,
    required this.days,
  });

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        month: json['month'],
        year: json['year'],
        days: json['days'].map<Days>((caseItem) => Days.fromJson(caseItem)).toList(),
      );
}
