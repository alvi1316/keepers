import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final String label;
  const TimePicker({Key? key, required this.label}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  var ctrl = TextEditingController(text: "Select Time");

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 150,
          child: TextField(
            readOnly: true,
            controller: ctrl,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(100, 50),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[700]!, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              primary: Colors.white,
              onPrimary: Colors.black),
          child: Text(widget.label),
          onPressed: () async {
            TimeOfDay initialTime = TimeOfDay.now();
            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: initialTime,
            );
            if (pickedTime != null) {
              setState(() {
                ctrl.text =
                    "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')} ${pickedTime.period.toString().split(".")[1]}";
              });
            }
          },
        ),
      ],
    );
  }
}
