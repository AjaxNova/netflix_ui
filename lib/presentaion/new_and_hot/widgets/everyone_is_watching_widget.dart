import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixx/presentaion/new_and_hot/widgets/video_widget.dart';

import '../../../Application/hot_and _new/hot_and_new_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/sizedbox.dart';
import '../../home/widgets/custom_button_widget.dart';

class EveryOneIsWatchingWidget extends StatelessWidget {
  const EveryOneIsWatchingWidget({
    super.key,
    required this.posterpath,
    required this.movieName,
    required this.description,
  });
  final String posterpath;
  final String movieName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height,
        Text(
          movieName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        height,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: greycolor,
          ),
        ),
        height50,
        VideoWidget(url: posterpath),
        height,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.share,
              text: 'Share',
              iconsize: 25,
              fontsize: 16,
            ),
            width,
            CustomButton(
              icon: Icons.add,
              text: 'My List',
              iconsize: 25,
              fontsize: 16,
            ),
            width,
            CustomButton(
              icon: Icons.play_arrow,
              text: 'Play',
              iconsize: 25,
              fontsize: 16,
            ),
            width
          ],
        )
      ],
    );
  }
}

class EveryoneIsWatching extends StatelessWidget {
  const EveryoneIsWatching({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error loading ComingSoon Page'),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text('Coming Soon List is Empty'),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (context, index) {
                final Tv = state.everyOneIsWatchingList[index];

                if (Tv.id == null) {
                  return const SizedBox();
                }

                return EveryOneIsWatchingWidget(
                  posterpath: '$imageAppenturl${Tv.posterPath}',
                  movieName: Tv.originalName ?? 'Unkown Title',
                  description: Tv.overview ?? 'No Description Available',
                );
              },
            );
          }
        },
      ),
    );
  }
}
