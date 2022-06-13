import 'package:flutter/material.dart';

class AddressPicker extends StatefulWidget {
  final Function callback;
  const AddressPicker({Key? key, required this.callback}) : super(key: key);

  @override
  State<AddressPicker> createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  String dropdownValue = 'Dhanmondi';

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
        items: <String>[
          'Dhanmondi',
          'Mohammadpur',
          'Mirpur',
          'Banasree',
          'Gulshan',
          'Badda',
          'Banani',
          'Bashundhara',
          'Uttara'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Text(value)),
          );
        }).toList(),
      ),
    );
  }
}
