import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixx/presentaion/FastLaughs/widgets/video_list.dart';

import '../../Application/fast_laugh/fast_laugh_bloc.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error While Getting Data'),
            );
          } else if (state.videosList.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                state.videosList.length,
                (index) => VideoListInheritWidget(
                  widget: VideoList(
                    index: index,
                  ),
                  movieDaat: state.videosList[index],
                ),
              ),
            );
          }
        },
      )),
    );
  }
}
