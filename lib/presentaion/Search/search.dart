import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixx/presentaion/Search/widgets/search_idle.dart';
import 'package:netflixx/presentaion/Search/widgets/search_rs.dart';

import '../../Application/search/search_bloc.dart';
import '../../Domain/core/debounce/debounce.dart';
import '../../core/sizedbox.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _debouncer.run(
                    () {
                      BlocProvider.of<SearchBloc>(context).add(
                        SearchMovie(movieQuery: value),
                      );
                    },
                  );
                },
              ),
              height,
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.searchResultList.isEmpty) {
                      return const SearchIdle();
                    } else {
                      return const SearchResult();
                    }
                  },
                ),
              )
              //  const Expanded(child: SearchResult())
            ],
          ),
        ),
      ),
    );
  }
}
