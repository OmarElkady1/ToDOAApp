 import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';

class AllTaskesPage extends StatelessWidget {
  const AllTaskesPage({
    Key? key,
    // required this.task,
  }) : super(key: key);
  //List<Map> task;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var allTaskes = AppCubite.get(context).allTaskesPage;

        return ConditionalBuilder(
            condition: allTaskes.length > 0,
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
                                          status: 'completed',
                                          id: allTaskes[index]['id']);
                                    } else if (value == false) {
                                      AppCubite.get(context)
                                          .onChangedd(value!, index);
                                      AppCubite.get(context).updateDate(
                                          status: 'uncompleted',
                                          id: allTaskes[index]['id']);
                                    }
                                  }),
                              Text('${allTaskes[index]['title']}'),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            AppCubite.get(context).updateDate(
                                status: 'favorite', id: allTaskes[index]['id']);
                          },
                          icon: const Icon(Icons.favorite_border_outlined)),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  );
                },
                itemCount: allTaskes.length,
              );
            },
            fallback: (context) => const Center(child: Text("No Taskes yet")));
      },
    );
  }
}
