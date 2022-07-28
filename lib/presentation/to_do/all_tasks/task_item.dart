import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';

class MyTaskItem extends StatelessWidget {
  MyTaskItem({
    Key? key,
    required this.model,
  }) : super(key: key);
  Map model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                AppCubite.get(context)
                    .updateDate(status: 'completed', id: model['id']);
              },
              child: Expanded(
                child: Row(
                  children: [
                    Text('${model['title']}'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  AppCubite.get(context)
                      .updateDate(status: 'favorite', id: model['id']);
                },
                icon: const Icon(Icons.favorite_border_outlined)),
            const SizedBox(
              width: 20,
            ),
          ],
        );
      },
    );
  }
}
