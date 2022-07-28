import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';
import 'package:to_do_app2/presentation/to_do/schedule/widget/date_piker.dart';
import 'package:to_do_app2/presentation/to_do/schedule/widget/tasks_builder.dart';
import 'package:to_do_app2/presentation/to_do/schedule/widget/text_date.dart';

class SchedualePage extends StatelessWidget {
  const SchedualePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubite.get(context).allTaskesPage;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Schedule',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(children: const [
              DatePikerWidget(),
              SizedBox(
                height: 10,
              ),
              TextDateWidget(),
              SizedBox(
                height: 10,
              ),
              Expanded(child: MyTasksBuilder()),
            ]),
          ),
        );
      },
    );
  }
}
