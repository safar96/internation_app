class Days {
  final int day;
  final int type;

  Days({
    required this.day,
    required this.type,
  });

  factory Days.fromJson(Map<String, dynamic> json) => Days(
        day: json['day'],
        type: json['type'],
      );
}
