import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var favorite = AppCubite.get(context).favoriteTasks;

        return ConditionalBuilder(
            condition: AppCubite.get(context).favoriteTasks.isNotEmpty,
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
                                    // if (value == true) {
                                    //   AppCubite.get(context)
                                    //       .onChangedd(value!, index);

                                    //   AppCubite.get(context).updateDate(
                                    //       status: 'uncompleted ',
                                    //       id: favorite[index]['id']);
                                    // } else {
                                    //   AppCubite.get(context).updateDate(
                                    //       status: 'completed  ',
                                    //       id: favorite[index]['id']);
                                    // }
                                    // if (value == true) {
                                    //   AppCubite.get(context)
                                    //       .onChangedd(value!, index);

                                    //   AppCubite.get(context).updateDate(
                                    //       status: 'uncompleted ',
                                    //       id: favorite[index]['id']);
                                    // } else {
                                    //   AppCubite.get(context).updateDate(
                                    //       status: 'completed  ',
                                    //       id: favorite[index]['id']);
                                    // }
                                  }),
                              Text('${favorite[index]['title']}'),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            AppCubite.get(context).updateDate(
                                status: 'favorite', id: favorite[index]['id']);
                          },
                          icon: const Icon(Icons.favorite_border_outlined)),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  );
                },
                itemCount: AppCubite.get(context).favoriteTasks.length,
              );
            },
            fallback: (context) =>
                const Center(child: Text("No Favoret Tasks yet")));
      },
    );
  }
}
