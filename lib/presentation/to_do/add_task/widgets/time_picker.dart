import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app2/core/utils/widgets/my_form_field.dart';

class MyInputTime extends StatelessWidget {
  const MyInputTime(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller})
      : super(key: key);

  final TextEditingController controller;
  final String title;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          height: 52,
          padding: const EdgeInsets.only(left: 14),
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: MYFormField(
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'time must not be empty';
                }
              },
              suffix: const Icon(Icons.access_time_rounded),
              value: true,
              controller: controller,
              textInputType: TextInputType.text,
              label: '',
              isPassword: false,
              hint: hint,
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedTime != null) {
                  print(pickedTime.format(context)); //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm()
                      .parse(pickedTime.format(context).toString());
                  String formattedTime =
                      DateFormat('HH:mm a').format(parsedTime);
                  controller.text = formattedTime;
                }
              }),
        ),
      ],
    );
  }
}
