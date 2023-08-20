import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MonthEvent extends Equatable {
  final int month;
  final int year;
  const MonthEvent(this.month, this.year);
}

class LoadMonthEvent extends MonthEvent {
  const LoadMonthEvent(super.month, super.year);

  @override
  List<Object?> get props => [month,year];
}