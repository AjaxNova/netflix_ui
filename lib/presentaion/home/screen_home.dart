import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixx/presentaion/home/widgets/background_card.dart';
import 'package:netflixx/presentaion/home/widgets/number_card_tile.dart';

import '../../Application/Home/home_bloc.dart';
import '../../core/sizedbox.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

//main
class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollnotifier,
        builder: (context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollnotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollnotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      const Center(
                        child: Text(
                          'error while getting data',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    //  releasesPastYear

                    final _releasesPastYear = state.pastYearMovie.map(
                      (m) {
                        return '$imageAppenturl${m.posterPath}';
                      },
                    ).toList();

                    _releasesPastYear.shuffle();

                    // trending

                    final _trending = state.trendingMovie.map(
                      (m) {
                        return '$imageAppenturl${m.posterPath}';
                      },
                    ).toList();
                    _trending.shuffle();

                    // teens drama

                    final _teensDrama = state.teensDramaMovie.map(
                      (m) {
                        return '$imageAppenturl${m.posterPath}';
                      },
                    ).toList();

                    _teensDrama.shuffle();

                    // south indian movies

                    final _southIndian = state.southIndianMovie.map(
                      (m) {
                        return '$imageAppenturl${m.posterPath}';
                      },
                    ).toList();

                    _southIndian.shuffle();

                    // tv shows

                    final _tvshows = state.trendingTvMovie.map((e) {
                      return '$imageAppenturl${e.posterPath}';
                    }).toList();

                    _tvshows.shuffle();

                    log(state.trendingTvMovie.length.toString());
                    if (_releasesPastYear.length < 10 ||
                        _trending.length < 10 ||
                        _teensDrama.length < 10 ||
                        _southIndian.length < 10 ||
                        _tvshows.length < 10) {
                      return const CircularProgressIndicator();
                    } else {
                      return ListView(
                        children: [
                          const BackgroundCard(),
                          height,
                          MainTitleCard(
                              title: 'Released In the Past Year',
                              posterList: _releasesPastYear.sublist(0, 10)),
                          height,
                          MainTitleCard(
                              title: 'Trending Now',
                              posterList: _trending.sublist(0, 10)),
                          height,
                          NumberCardTile(posterList: _tvshows.sublist(0, 10)),
                          height,
                          MainTitleCard(
                              title: 'Teens Drama',
                              posterList: _teensDrama.sublist(0, 10)),
                          height,
                          MainTitleCard(
                              title: 'South Indian cenima',
                              posterList: _southIndian.sublist(0, 10)),
                          height
                        ],
                      );
                    }
                  },
                ),
                scrollnotifier.value == true
                    ? Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 60,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    'https://cdn.icon-icons.com/icons2/2699/PNG/512/netflix_logo_icon_170919.png',
                                    height: 40,
                                    width: 40,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Tv Shows',
                                    style: khometextstyle,
                                  ),
                                  Text(
                                    'Movies',
                                    style: khometextstyle,
                                  ),
                                  Text(
                                    'Categories',
                                    style: khometextstyle,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : height
              ],
            ),
          );
        },
      ),
    );
  }
}
