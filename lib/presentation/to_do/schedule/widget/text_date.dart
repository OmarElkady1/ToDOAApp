import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextDateWidget extends StatelessWidget {
  const TextDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          DateFormat('EEEE').format(DateTime.now()),
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        const Spacer(),
        Text(
          DateFormat.yMMMMd().format(DateTime.now()).toString(),
          style: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
