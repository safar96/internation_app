import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:internation_app/model/month.dart';
import '../model/types.dart';

@immutable
abstract class MonthState extends Equatable {}

class MonthLoadingState extends MonthState {
  @override
  List<Object?> get props => [];
}

class MonthLoadedState extends MonthState {
  final Month month;
  final List<Types> types;
  MonthLoadedState(this.month,this.types);
  @override
  List<Object?> get props => [month,types];
}

class MonthErrorState extends MonthState {
  final String error;
  MonthErrorState(this.error);
  @override
  List<Object?> get props => [error];
}