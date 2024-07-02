
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sofiacare/patient/screens/rendez_vous/validate.dart';

import '../../../widgets/buttons/app_bar.dart';
import '../widgets/buttons/button_login.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late double _height;
 late double _width;


  late String _hour, _minute, _time;

  late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = '$_hour : $_minute';
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
     
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
            const  AppBarTop(textTop: "Calender"),
          const Text(
            'Choisir une date de Rendez-vous',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5),
          ),
          InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              width: _width / 1.7,
              height: _height / 9,
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: TextFormField(
                style: const TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
                enabled: false,
                keyboardType: TextInputType.text,
                controller: _dateController,
                onSaved: (val) {
                },
                decoration: const InputDecoration(
                    disabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
               
                    contentPadding: EdgeInsets.only(top: 0.0)),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const Text(
                'Choisir une heure',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
              ),
              InkWell(
                onTap: () {
                  _selectTime(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: _width / 1.7,
                  height: _height / 9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 40),
                    textAlign: TextAlign.center,
                   onSaved: (val) {
                    },
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: _timeController,
                    decoration: const InputDecoration(
                        disabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                 
                        contentPadding: EdgeInsets.all(5)),
                  ),
                ),
              ),
           const   SizedBox(height: 50),
              Padding(
                  padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
                child: ButtonLogin(onTap: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Validate(),
                          ),
                        );
                }, text: "Confirmer votre Rendez-vous"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

