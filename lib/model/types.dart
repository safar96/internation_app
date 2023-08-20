class Types {
  final int type;
  final String color;

  Types({
    required this.type,
    required this.color,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        type: json['type'],
        color: json['color'],
      );
}
