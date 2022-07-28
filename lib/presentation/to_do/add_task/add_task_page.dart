import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';
import 'package:to_do_app2/core/utils/style/color.dart';
import 'package:to_do_app2/core/utils/widgets/Button.dart';
import 'package:to_do_app2/presentation/to_do/add_task/widgets/date_picker%20.dart';
import 'package:to_do_app2/presentation/to_do/add_task/widgets/my_input_field.dart';
import 'package:to_do_app2/presentation/to_do/add_task/widgets/remind_widget.dart';
import 'package:to_do_app2/presentation/to_do/add_task/widgets/repeat.dart';
import 'package:to_do_app2/presentation/to_do/add_task/widgets/time_picker.dart';
import 'package:to_do_app2/presentation/to_do/all_tasks/all_tasks_page.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  var dateController = TextEditingController();
  var titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add Task',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 2),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyInputField(
                          controller: titleController,
                          title: 'Title',
                          hint: 'Enter your Title ',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyInputDate(
                            controller: dateController,
                            title: 'Date',
                            hint: DateFormat.yMd()
                                .format(AppCubite.get(context).selectedDate)),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MyInputTime(
                                controller: startTimeController,
                                title: 'Start time ',
                                hint: DateFormat('hh:mm').format(
                                  DateTime.now(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MyInputTime(
                                controller: endTimeController,
                                title: 'End time',
                                hint: DateFormat('hh:mm').format(
                                  DateTime.now(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const RemindWidget(title: 'Remider'),
                        const SizedBox(
                          height: 10,
                        ),
                        const RepeatWidget(title: 'Repeat'),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Color"),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: List<Widget>.generate(3, (index) {
                                  return InkWell(
                                    onTap: () {
                                      AppCubite.get(context)
                                          .changeColorIndex(index);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundColor: index == 0
                                            ? kPrimaryColor
                                            : index == 1
                                                ? kSecondryColor
                                                : kTheardColor,
                                        child: AppCubite.get(context)
                                                    .selecredColor ==
                                                index
                                            ? Icon(
                                                Icons.done,
                                                color: Colors.white,
                                                size: 16,
                                              )
                                            : Container(),
                                      ),
                                    ),
                                  );
                                }),
                              )
                            ]),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: MyButton(
                            text: 'Create a Task ',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                AppCubite.get(context).insertToDatabase(
                                    title: titleController.text,
                                    time: startTimeController.text,
                                    date: dateController.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllTaskesPage()));
                              }
                            },
                            radius: 9,
                            width: double.infinity,
                            height: 40,
                            background: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
