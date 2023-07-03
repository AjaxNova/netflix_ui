import 'package:flutter/material.dart';

import '../../core/sizedbox.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height20,
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Spacer(),
            width,
            const Icon(
              Icons.cast_connected,
              color: Colors.white,
            ),
            width,
            Container(
              height: 20,
              width: 20,
              color: Colors.white,
            ),
            width
          ],
        ),
      ],
    );
  }
}
