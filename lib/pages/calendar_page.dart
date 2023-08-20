import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internation_app/bloc/month_block.dart';
import 'package:internation_app/bloc/month_state.dart';
import 'package:internation_app/component/size_config.dart';
import 'package:internation_app/widget/custom_calendar.dart';
import '../bloc/month_event.dart';
import '../bloc/month_repository.dart';

class CalendarPage extends StatefulWidget {
  final int month;
  final int year;

  const CalendarPage({super.key, required this.month, required this.year});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<MonthBloc>(
          create: (BuildContext context) => MonthBloc(MonthRepository()),
        ),
      ],
      child: Scaffold(
        body: SizedBox(
          height: getConfigFullHeight(),
          width: getConfigWidth(1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getConfigTopHeight(),
                ),
                Container(
                  alignment: Alignment.center,
                  height: getConfigHeight(1),
                  width: getConfigWidth(1),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getConfigHeight(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: getConfigWidth(0.15),
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getConfigWidth(0.85),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getConfigHeight(0.1),
                      ),
                      BlocProvider(
                        create: (context) => MonthBloc(
                          MonthRepository(),
                        )..add(LoadMonthEvent(widget.month, widget.year)),
                        child: BlocBuilder<MonthBloc, MonthState>(
                          builder: (context, state) {
                            if (state is MonthLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is MonthErrorState) {
                              return const Center(child: Text("Error"));
                            }
                            if (state is MonthLoadedState) {
                              return CustomCalendar(
                                height: getConfigHeight(0.8),
                                width: getConfigWidth(0.8),
                                onTap: (type, day) {
                                  print(type);
                                  print(day);
                                },
                                types: state.types,
                                month: state.month,
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
