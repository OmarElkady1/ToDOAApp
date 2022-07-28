// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:to_do_app/core/utils/cubit/cubit.dart';
// import 'package:to_do_app/core/utils/cubit/states.dart';

// class AllToDo extends StatelessWidget {
//   AllToDo({
//     Key? key,
//     //  required this.onChanged,
//     required this.model,
//     //required this.isChecked,
//     //required this.label
//   }) : super(key: key);
//   //bool isChecked = false;
//   //Function onChanged;
//   Map model;
//   // final String label;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubite, AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Row(
//           children: [
//             InkWell(
//               onTap: () {
//                 AppCubite.get(context).onChangedd();
//                 AppCubite.get(context)
//                     .updateDate(status: 'completed', id: model['id']);
//               },
//               child: Row(
//                 children: [
//                   Checkbox(
//                       value: AppCubite.get(context).isChecked,
//                       checkColor: Colors.white,
//                       shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(
//                               Radius.circular(6.0))), // Rounded Checkbox
//                       fillColor: MaterialStateProperty.resolveWith(
//                         (states) {
//                           if (states.contains(MaterialState.selected)) {
//                             return Colors
//                                 .red; // the color when checkbox is selected;
//                           }
//                           return Colors
//                               .green; //the color when checkbox is unselected;
//                         },
//                       ),
//                       onChanged: (bool? value) {
//                         AppCubite.get(context).onChangedd();
//                         // AppCubite.get(context)
//                         //     .updateDate(status: 'completed', id: model['id']);
//                       }),
//                   Text('${model['title']}'),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             IconButton(
//                 onPressed: () {
//                   AppCubite.get(context)
//                       .updateDate(status: 'favorite', id: model['id']);
//                 },
//                 icon: const Icon(Icons.favorite_border_outlined)),
//             const SizedBox(
//               width: 20,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
