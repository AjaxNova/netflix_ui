import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixx/Application/search/search_bloc.dart';
import 'package:netflixx/presentaion/Search/widgets/searchtile.dart';

import '../../../core/colors/colors.dart';
import '../../../core/sizedbox.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Searchtile(title: 'Top Searches'),
        height,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.iserror) {
                return const Center(
                  child: Text('Error While Getting data'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('List is Emty'),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = state.idleList[index];
                  return TopSearchViw(
                    title: movie.originalTitle ?? 'No Title',
                    imageUrl: '$imageAppenturl${movie.backdroppath}',
                  );
                },
                separatorBuilder: (context, index) => height20,
                itemCount: state.idleList.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class TopSearchViw extends StatelessWidget {
  const TopSearchViw({
    super.key,
    required this.title,
    required this.imageUrl,
  });
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: width * 0.35,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: whitecolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: whitecolor,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: blackcolor,
            radius: 20,
            child: Icon(
              CupertinoIcons.play_fill,
              color: whitecolor,
            ),
          ),
        )
      ],
    );
  }
}
