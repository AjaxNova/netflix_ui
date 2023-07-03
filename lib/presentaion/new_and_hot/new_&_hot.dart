import 'package:flutter/material.dart';
import 'package:netflixx/presentaion/new_and_hot/widgets/comingsoon.dart';
import 'package:netflixx/presentaion/new_and_hot/widgets/everyone_is_watching_widget.dart';

import '../../core/colors/colors.dart';
import '../../core/sizedbox.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            actions: [
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
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: whitecolor,
              labelColor: blackcolor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: whitecolor,
                borderRadius: kradias30,
              ),
              tabs: const [
                Tab(
                  text: '🍿️ Coming Soon',
                ),
                Tab(
                  text: "👀️ Everyones's Watching",
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            CommingSoon(key: Key('coming_soon')),
            EveryoneIsWatching(
              key: Key('everyone_is_watching'),
            )
          ],
        ),
      ),
    );
  }
}

// class EveryOneWatching extends StatelessWidget {
//   const EveryOneWatching({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) => EveryOneIsWatchingWidget(),
//       itemCount: 10,
//     );
//   }
// }
