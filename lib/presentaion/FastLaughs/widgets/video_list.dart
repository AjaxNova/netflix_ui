import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Application/fast_laugh/fast_laugh_bloc.dart';
import '../../../Domain/downloads/models/downloads.dart';
import '../../../core/colors/colors.dart';
import '../../../core/sizedbox.dart';

class VideoListInheritWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieDaat;

  const VideoListInheritWidget({
    super.key,
    required this.widget,
    required this.movieDaat,
  }) : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListInheritWidget oldWidget) {
    return oldWidget.movieDaat != movieDaat;
  }

  static VideoListInheritWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoListInheritWidget>();
  }
}

class VideoList extends StatelessWidget {
  const VideoList({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final posterPath = VideoListInheritWidget.of(context)?.movieDaat.posterpath;
    final videourl = videoUrls[index % videoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videourl,
          onStateChanged: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_rounded,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$imageAppenturl$posterPath'),
                      radius: 30,
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideoesIdNotifier,
                      builder: (BuildContext ctx, Set<int> newLikedListIds,
                          Widget? _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context).add(UnlikeVideo(id: _index));
                              likedVideoesIdNotifier.value.remove(_index);
                              likedVideoesIdNotifier.notifyListeners();
                            },
                            child: const VideoAction(
                              icon: Icons.favorite,
                              text: 'Liked',
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<FastLaughBloc>(context).add(LikeVideo(id: _index));
                            likedVideoesIdNotifier.value.add(_index);
                            likedVideoesIdNotifier.notifyListeners();
                          },
                          child: const VideoAction(
                            icon: Icons.emoji_emotions,
                            text: 'LoL',
                          ),
                        );
                      },
                    ),
                    const VideoAction(icon: Icons.add, text: 'My List'),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListInheritWidget.of(context)?.movieDaat.title;

                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child:
                          const VideoAction(icon: Icons.share, text: 'Share'),
                    ),
                    const VideoAction(icon: Icons.play_arrow, text: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoAction extends StatelessWidget {
  const VideoAction({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: whitecolor,
            size: 30,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  const FastLaughVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.onStateChanged,
  });

  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
