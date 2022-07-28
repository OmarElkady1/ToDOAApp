import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app2/core/utils/cubit/cubit.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubite, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: AppCubite.get(context).categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              AppCubite.get(context).changeIndex(index);
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppCubite.get(context).categories[index],
                                    style: TextStyle(
                                        color: index ==
                                                AppCubite.get(context)
                                                    .selectedIndex
                                            ? Colors.black
                                            : Colors.black26),
                                  ),
                                  if (index ==
                                      AppCubite.get(context).selectedIndex)
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              400,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
