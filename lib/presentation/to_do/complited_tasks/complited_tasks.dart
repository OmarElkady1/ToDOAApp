import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';

class ComplitedTasks extends StatelessWidget {
  const ComplitedTasks({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var completTasks = AppCubite.get(context).completedTasks;
        var uncompletTasks = AppCubite.get(context).unCompletedTasks;

        return ConditionalBuilder(
            condition: AppCubite.get(context).completedTasks.isNotEmpty,
            builder: (context) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Expanded(
                          child: Row(
                            children: [
                              Checkbox(
                                  value:
                                      AppCubite.get(context).isChecked[index],
                                  checkColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              6.0))), // Rounded Checkbox
                                  fillColor: MaterialStateProperty.resolveWith(
                                    (states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Colors
                                            .red; // the color when checkbox is selected;
                                      }
                                      return Colors
                                          .green; //the color when checkbox is unselected;
                                    },
                                  ),
                                  onChanged: (value) {
                                    if (value == true) {
                                      AppCubite.get(context)
                                          .onChangedd(value!, index);

                                      AppCubite.get(context).updateDate(
                                          status: 'uncompleted ',
                                          id: uncompletTasks[index]['id']);
                                    } else {
                                      AppCubite.get(context).updateDate(
                                          status: 'completed  ',
                                          id: completTasks[index]['id']);
                                    }
                                  }),
                              Text('${completTasks[index]['title']}'),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            AppCubite.get(context).updateDate(
                                status: 'favorite',
                                id: completTasks[index]['id']);
                          },
                          icon: const Icon(Icons.favorite_border_outlined)),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  );
                },
                itemCount: AppCubite.get(context).completedTasks.length,
              );
            },
            fallback: (context) =>
                const Center(child: Text("No Completed Tasks yet")));
      },
    );
  }
}
