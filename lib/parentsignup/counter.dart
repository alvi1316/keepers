import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final String title;
  final callbackFunction;
  const Counter({Key? key, required this.title, required this.callbackFunction})
      : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 1;
  final _countTextController = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              child: TextField(
                readOnly: true,
                controller: _countTextController,
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
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                  _countTextController.text = _count.toString();
                  widget.callbackFunction(_count);
                });
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(40, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  primary: Colors.white,
                  onPrimary: Colors.black),
              child: Text("+"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_count > 1) {
                  setState(() {
                    _count--;
                    _countTextController.text = _count.toString();
                    widget.callbackFunction(_count);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(40, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  primary: Colors.white,
                  onPrimary: Colors.black),
              child: Text("-"),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
