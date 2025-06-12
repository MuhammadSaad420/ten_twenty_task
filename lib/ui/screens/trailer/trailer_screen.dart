import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerScreen extends HookWidget {
  TrailerScreen({super.key, required this.videoId});

  final String videoId;

  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
            autoPlay: true,
            hideControls: true,
            enableCaption: true,
            forceHD: true),
      );
      return () {
        _controller.dispose();
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      };
    }, []);
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return YoutubePlayer(
          aspectRatio: orientation == Orientation.landscape ? 16 / 9 : 9 / 16,
          controller: _controller,
          onEnded: (_) {
            Navigator.of(context).pop();
          },
        );
      }),
    );
  }
}
