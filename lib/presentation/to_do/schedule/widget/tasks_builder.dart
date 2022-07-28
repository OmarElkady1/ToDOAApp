import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';

class MyTasksBuilder extends StatelessWidget {
  const MyTasksBuilder({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubite.get(context).allTaskesPage.isNotEmpty,
          builder: (context) {
            return ListView.builder(
                itemCount: AppCubite.get(context).allTaskesPage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${AppCubite.get(context).allTaskesPage[index]['time']}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${AppCubite.get(context).allTaskesPage[index]['title']}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Checkbox(
                                value: AppCubite.get(context).isChecked[index],
                                checkColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            10.0))), // Rounded Checkbox
                                activeColor: Colors.white,
                                side: BorderSide(color: Colors.white),
                                onChanged: (value) {
                                  if (value == true) {
                                    AppCubite.get(context)
                                        .onChangedd(value!, index);
                                    AppCubite.get(context).updateDate(
                                        status: 'completed',
                                        id: AppCubite.get(context)
                                            .allTaskesPage[index]['id']);
                                  }
                                  if (value == false) {
                                    AppCubite.get(context)
                                        .onChangedd(value!, index);

                                    AppCubite.get(context).updateDate(
                                        status: 'uncompleted',
                                        id: AppCubite.get(context)
                                            .allTaskesPage[index]['id']);
                                  }
                                }),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                    ),
                  );
                });
          },
          fallback: (context) => const Center(child: Text("No tasks yet")),
        );
      },
    );
  }
}
