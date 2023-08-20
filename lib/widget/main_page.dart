import 'package:flutter/material.dart';
import 'package:internation_app/pages/calendar_page.dart';
import '../component/size_config.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SizedBox(
          height: getConfigFullHeight(),
          width: getConfigWidth(1),
          child: Column(
            children: [
              SizedBox(
                height: getConfigTopHeight(),
              ),
              SizedBox(
                height: getConfigHeight(0.1),
                child: const Center(
                  child: Text("Enter your date to get calendar"),
                ),
              ),
              SizedBox(
                height: getConfigHeight(0.1),
              ),
              Container(
                height: getConfigHeight(0.2),
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: getConfigWidth(0.4),
                      height: getConfigHeight(0.1),
                      child: TextField(
                        controller: _yearController,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                          hintText: 'Year',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: getConfigWidth(0.4),
                      height: getConfigHeight(0.1),
                      child: TextField(
                        controller: _monthController,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                          hintText: 'Month',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getConfigHeight(0.07),
                width: getConfigWidth(0.8),
                child: OutlinedButton(
                  onPressed: () {
                    if (_monthController.text.isNotEmpty && _yearController.text.isNotEmpty) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarPage(
                            month: int.parse(_monthController.text),
                            year: int.parse(_yearController.text),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Get calendar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
