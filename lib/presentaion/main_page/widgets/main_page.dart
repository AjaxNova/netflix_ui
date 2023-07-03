import 'package:flutter/material.dart';
import 'package:netflixx/presentaion/downloads/downloads.dart';
import 'package:netflixx/presentaion/main_page/widgets/bottomnavigation.dart';
import 'package:netflixx/presentaion/new_and_hot/new_&_hot.dart';

import '../../FastLaughs/fast_laughs.dart';
import '../../Search/search.dart';
import '../../home/screen_home.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: navigationNotifier,
        builder: (context, index, child) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavi(),
    );
  }
}
