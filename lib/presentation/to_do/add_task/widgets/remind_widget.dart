import 'package:flutter/material.dart';
import 'package:to_do_app2/service/local_notification.dart';

class RemindWidget extends StatefulWidget {
  const RemindWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<RemindWidget> createState() => _RemindWidgetState();
}

class _RemindWidgetState extends State<RemindWidget> {
  var controller = TextEditingController();
  late final LocalNotificationService service;

  List<String> a = [
    '5 minutes early',
    '10 minutes early',
    '15 minutes early',
    '20 minutes early'
  ];

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    super.initState();
  }

  String dropdownValue = '5 minutes early';

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
            onTap: () async {
              await service.showNotification(
                  id: 0, title: "TodoAppNotifation", body: "5 minutes early");
            },
            value: dropdownValue,
            icon: Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Icon(
                Icons.keyboard_arrow_down,
              ),
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
            items: a.map<DropdownMenuItem<String>>((String value) {
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
