import 'package:flutter/material.dart';

class RepeatWidget extends StatefulWidget {
  const RepeatWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RepeatWidget> createState() => _RepeatWidgetState();
}

class _RepeatWidgetState extends State<RepeatWidget> {
  String dropdownValue = 'None';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          width: double.infinity,
          height: 52,
          padding: const EdgeInsets.only(left: 14),
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Padding(
              padding: EdgeInsets.only(left: 210),
              child: Icon(Icons.keyboard_arrow_down),
            ),
            iconSize: 32,
            elevation: 4,
            style: const TextStyle(color: Colors.grey),
            underline: Container(
              height: 0,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              'None',
              'Daily',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
