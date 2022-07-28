import 'package:flutter/material.dart';
import 'package:to_do_app2/core/utils/widgets/my_form_field.dart';

class MyInputField extends StatelessWidget {
  const MyInputField(
      {Key? key,
      required this.hint,
      required this.title,
      required this.controller})
      : super(key: key);
  final TextEditingController controller;

  // var titleController = TextEditingController();
  final String title;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  return 'title must not be empty';
                }
              },
              value: false,
              controller: controller,
              textInputType: TextInputType.text,
              label: '',
              isPassword: false,
              hint: hint,
              onTap: () {}),
        ),
      ],
    );
  }
}
