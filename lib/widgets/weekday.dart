import 'package:flutter/material.dart';

class WeekDaySelector extends StatefulWidget {
  const WeekDaySelector({Key? key}) : super(key: key);

  @override
  State<WeekDaySelector> createState() => _WeekDaySelectorState();
}

class _WeekDaySelectorState extends State<WeekDaySelector> {
  bool fr = false;
  bool sa = false;
  bool su = false;
  bool mo = false;
  bool tu = false;
  bool we = false;
  bool th = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          width: 1,
          color: (Colors.grey[700])!,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("Fr:"),
              Checkbox(
                value: fr,
                onChanged: (bool? value) {
                  setState(() {
                    fr = value!;
                  });
                },
              ),
              Text("Sa:"),
              Checkbox(
                value: sa,
                onChanged: (bool? value) {
                  setState(() {
                    sa = value!;
                  });
                },
              ),
              Text("Su:"),
              Checkbox(
                value: su,
                onChanged: (bool? value) {
                  setState(() {
                    su = value!;
                  });
                },
              ),
              Text("Mo:"),
              Checkbox(
                value: mo,
                onChanged: (bool? value) {
                  setState(() {
                    mo = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text("Tu:"),
              Checkbox(
                value: tu,
                onChanged: (bool? value) {
                  setState(() {
                    tu = value!;
                  });
                },
              ),
              Text("We:"),
              Checkbox(
                value: we,
                onChanged: (bool? value) {
                  setState(() {
                    we = value!;
                  });
                },
              ),
              Text("Th:"),
              Checkbox(
                value: th,
                onChanged: (bool? value) {
                  setState(() {
                    th = value!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
