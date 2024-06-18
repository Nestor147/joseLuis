import 'package:cuteapp/config/helpers/datasource/cuna.dart';
import 'package:cuteapp/config/helpers/models/document.dart';
import 'package:cuteapp/config/themes/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoViewScreen extends StatefulWidget {
  final Content content;
  const VideoViewScreen({super.key, required this.content});

  @override
  State<VideoViewScreen> createState() => _VideoViewScreenState();
}

class _VideoViewScreenState extends State<VideoViewScreen> {
 // String videoURL = "https://www.youtube.com/watch?v=v_PpzoLfAsg";
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.content.content);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );

    // Establece la orientación en vertical al inicializar
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // Restablece la orientación al salir de la pantalla
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;

        return Scaffold(
          appBar: isLandscape
              ? null
              : AppBar(
                  title: Text(widget.content.name,style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: colorSDATheme,
                ),
          body: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: isLandscape ? constraints.maxWidth : constraints.maxWidth * 0.99,
                  height: isLandscape ? constraints.maxHeight : constraints.maxHeight * 0.4,
                  child: YoutubePlayer(
                    controller: _controller!,
                    progressColors: ProgressBarColors(backgroundColor: Colors.red),
                    onReady: () {
                      _controller!.addListener(() {
                        if (_controller!.value.isFullScreen) {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.landscapeRight,
                            DeviceOrientation.landscapeLeft,
                          ]);
                        } else {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                            DeviceOrientation.portraitDown,
                          ]);
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
