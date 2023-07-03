import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixx/Application/downloads/downloads_bloc.dart';

import '../../Application/Home/home_bloc.dart';
import '../../Application/hot_and _new/hot_and_new_bloc.dart';
import '../main_page/widgets/main_page.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoMainPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
      // BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }

  Future<void> gotoMainPage() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainPage()));
  }
}
