import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixx/presentaion/Search/widgets/searchtile.dart';

import '../../../Application/search/search_bloc.dart';
import '../../../core/sizedbox.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  // final imgaeurl = 'https://www.themoviedb.org/t/p/original/zpCCTtuQMHiHycpsrWnW2eCrBql.jpg';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Searchtile(title: 'Movies & TV'),
        height,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList.isEmpty) {
                return const Text("No data Found");
              } else {
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.4,
                  children: List.generate(20, (index) {
                    final movie = state.searchResultList[index];
                    return MainCard(imageurl1: movie.imageurl);
                  }),
                );
              }
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageurl1;
  const MainCard({
    super.key,
    required this.imageurl1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(7)),
          image: DecorationImage(
            image: NetworkImage(imageurl1),
            fit: BoxFit.cover,
          )),
    );
  }
}
