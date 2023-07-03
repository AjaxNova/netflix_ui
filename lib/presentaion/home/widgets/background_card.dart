import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Application/downloads/downloads_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/sizedbox.dart';
import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            if (state.downloads.isEmpty) {
              return const CircularProgressIndicator();
            } else {
              return Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "$imageAppenturl${state.downloads[1].posterpath}"),
                  ),
                ),
              );
            }
          },
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(icon: Icons.add, text: 'My List'),
                _playbutton(),
                CustomButton(icon: Icons.info, text: 'Info'),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playbutton() {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(whitecolor),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: blackcolor,
        size: 25,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Text(
          'Play',
          style: TextStyle(
            color: blackcolor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
