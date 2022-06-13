import 'package:flutter/material.dart';

class SexPicker extends StatefulWidget {
  final Function callback;
  const SexPicker({Key? key, required this.callback}) : super(key: key);

  @override
  State<SexPicker> createState() => _SexPickerState();
}

class _SexPickerState extends State<SexPicker> {
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            widget.callback(newValue);
          });
        },
        items: <String>['Male', 'Female']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Text(value)),
          );
        }).toList(),
      ),
    );
  }
}
