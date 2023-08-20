import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internation_app/bloc/month_event.dart';
import 'package:internation_app/bloc/month_repository.dart';
import 'package:internation_app/bloc/month_state.dart';

class MonthBloc extends Bloc<MonthEvent, MonthState> {
  final MonthRepository _monthRepository;

  MonthBloc(this._monthRepository) : super(MonthLoadingState()) {
    on<LoadMonthEvent>((event, emit) async {
      emit(MonthLoadingState());
      try {
        final months = await _monthRepository.getMonth(event.month,event.year);
        final types = await _monthRepository.getTypes();
        emit(MonthLoadedState(months,types));
      } catch (e) {
        emit(MonthErrorState(e.toString()));
      }
    });
  }
}