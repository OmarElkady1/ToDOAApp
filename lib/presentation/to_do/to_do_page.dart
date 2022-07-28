import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';
import 'package:to_do_app2/core/utils/widgets/Button.dart';
import 'package:to_do_app2/presentation/to_do/add_task/add_task_page.dart';
import 'package:to_do_app2/presentation/to_do/schedule/schedule_page.dart';
import 'package:to_do_app2/presentation/to_do/widgets/categories.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Board',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SchedualePage()));
                },
                icon: const Icon(
                  Icons.schedule_outlined,
                ),
                color: Colors.black,
              ),
              const SizedBox(width: 15),
            ],
          ),
          body: Column(
            children: [
              const Categories(),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      child: ConditionalBuilder(
                          fallback: (context) =>
                              const Center(child: Text('this is not true')),
                          condition: AppCubite.get(context).scrennss.isNotEmpty,
                          builder: (context) => AppCubite.get(context)
                              .scrennss[AppCubite.get(context).selectedIndex]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: MyButton(
                          text: 'Add a Task ',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddTask()));
                          },
                          radius: 9,
                          width: double.infinity,
                          height: 40,
                          background: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
