import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';
import 'package:to_do_app2/core/utils/widgets/my_form_field.dart';

class MyInputDate extends StatelessWidget {
  MyInputDate(
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
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                      return 'Date must not be empty';
                    }
                  },
                  suffix: const Icon(Icons.keyboard_arrow_down),
                  controller: controller,
                  value: true,
                  textInputType: TextInputType.text,
                  label: '',
                  isPassword: false,
                  hint: hint,
                  onTap: () async {
                    DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100));
                    if (pickDate != null) {
                      controller.text = DateFormat.yMMMEd().format(pickDate);
                    } else {}
                  }),
            ),
          ],
        );
      },
    );
  }
}
