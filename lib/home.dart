import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedValue = 'Wake up';
  Time _time = Time(hour: 12, minute: 0);
  bool iosStyle = true;
  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amber,
          title: Text('Reminder App', style: TextStyle(color: Colors.white),),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:30),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Set reminders for daily activities', style: TextStyle(color: Colors.grey, fontSize: 16),),
                ),
              ),
              Container(
                width: double.infinity,
                height: 37,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Center(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade900,
                    underline: SizedBox(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Wake up',
                      'Go to gym',
                      'Breakfast',
                      'Meetings',
                      'Lunch',
                      'Quick nap',
                      'Go to library',
                      'Dinner',
                      'Go to sleep',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, textAlign:TextAlign.center,),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      showPicker(
                        showSecondSelector: true,
                        context: context,
                        value: _time,
                        onChange: onTimeChanged,
                        minuteInterval: TimePickerInterval.FIVE,
                        // Optional onChange to receive value as DateTime
                        onChangeDateTime: (DateTime dateTime) {
                          // print(dateTime);
                          debugPrint("[debug datetime]:  $dateTime");
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Select the time",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text('Selected Activity :  ${selectedValue}', style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Text('Selected Time :  ${_time.format(context)}', style: TextStyle(color: Colors.white),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){

                  }, child: Text(
                    "Set Reminder",
                    style: TextStyle(color: Colors.white),
                  ),),
                ),
              )
            ],
          ),
        )
    );
  }
}