import 'package:flutter/material.dart';

import '../../core/sizedbox.dart';

class MainCard0 extends StatelessWidget {
  const MainCard0({
    super.key,
    required this.imageurl,
  });

  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: kradias,
        image: DecorationImage(
          image: NetworkImage(imageurl),
        ),
      ),
    );
  }
}
