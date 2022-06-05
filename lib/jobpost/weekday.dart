import 'package:flutter/material.dart';

class WeekDaySelector extends StatefulWidget {
  final Function callback;
  const WeekDaySelector({Key? key, required this.callback}) : super(key: key);

  @override
  State<WeekDaySelector> createState() => WeekDaySelectorState();
}

class WeekDaySelectorState extends State<WeekDaySelector> {
  bool fr = false;
  bool sa = false;
  bool su = false;
  bool mo = false;
  bool tu = false;
  bool we = false;
  bool th = false;

  void onChangeUpdate() {
    String temp = "";
    if (fr) {
      temp += "fr,";
    }
    if (sa) {
      temp += "sa,";
    }
    if (su) {
      temp += "su,";
    }
    if (mo) {
      temp += "mo,";
    }
    if (tu) {
      temp += "tu,";
    }
    if (we) {
      temp += "we,";
    }
    if (th) {
      temp += "th,";
    }
    widget.callback(temp);
  }

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
                    onChangeUpdate();
                  });
                },
              ),
              Text("Sa:"),
              Checkbox(
                value: sa,
                onChanged: (bool? value) {
                  setState(() {
                    sa = value!;
                    onChangeUpdate();
                  });
                },
              ),
              Text("Su:"),
              Checkbox(
                value: su,
                onChanged: (bool? value) {
                  setState(() {
                    su = value!;
                    onChangeUpdate();
                  });
                },
              ),
              Text("Mo:"),
              Checkbox(
                value: mo,
                onChanged: (bool? value) {
                  setState(() {
                    mo = value!;
                    onChangeUpdate();
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
                    onChangeUpdate();
                  });
                },
              ),
              Text("We:"),
              Checkbox(
                value: we,
                onChanged: (bool? value) {
                  setState(() {
                    we = value!;
                    onChangeUpdate();
                  });
                },
              ),
              Text("Th:"),
              Checkbox(
                value: th,
                onChanged: (bool? value) {
                  setState(() {
                    th = value!;
                    onChangeUpdate();
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
