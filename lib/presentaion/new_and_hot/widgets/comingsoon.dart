import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:netflixx/presentaion/new_and_hot/widgets/video_widget.dart';

import '../../../Application/hot_and _new/hot_and_new_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/sizedbox.dart';
import '../../home/widgets/custom_button_widget.dart';

class CommingSoon extends StatelessWidget {
  const CommingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
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
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('Coming Soon List is Empty'),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];

                if (movie.id == null) {
                  return const SizedBox();
                }

                String month = '';
                String date = '';

                try {
                  final _date = DateTime.parse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMd('en_US').format(_date);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }

                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: date,
                  posterpath: '$imageAppenturl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No title',
                  description: movie.overview ?? 'No decription Available',
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterpath,
    required this.movieName,
    required this.description,
  });

  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String movieName;
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 16,
                  color: greycolor,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  letterSpacing: 4,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(url: posterpath),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomButton(
                    icon: Icons.all_out_sharp,
                    text: 'Remind Me',
                    iconsize: 20,
                    fontsize: 12,
                  ),
                  width,
                  CustomButton(
                    icon: Icons.info_outline_rounded,
                    text: 'Info',
                    iconsize: 20,
                    fontsize: 12,
                  ),
                  width
                ],
              ),
              height,
              Text('Coming On $day $month'),
              height,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(
                  color: greycolor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
