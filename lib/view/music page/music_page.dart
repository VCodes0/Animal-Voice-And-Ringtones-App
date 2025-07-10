import 'package:animal_voice_app/model/music_model.dart';
import 'package:animal_voice_app/providers/music_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../widgets/format_time.dart';

class MusicPage extends StatefulWidget {
  final AllPosts allPosts;

  const MusicPage({super.key, required this.allPosts});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initMusicPage();

    // Listen to duration changes
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listen to position changes
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    // Listen to player state
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  Future<void> initMusicPage() async {
    try {
      await Provider.of<MusicProvider>(
        context,
        listen: false,
      ).getAnimalMusicData();
    } catch (e) {
      debugPrint("Error fetching music data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.allPosts;

    return Scaffold(
      appBar: AppBar(title: const Text("Music Player")),
      body: Consumer<MusicProvider>(
        builder: (context, musicProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Thumbnail image
                CircleAvatar(
                  radius: mq.height * .15,
                  backgroundImage: AssetImage(post.thumbImage ?? ''),
                ),
                const SizedBox(height: 20),

                // Description
                Text(
                  post.description ?? '',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Slider
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds
                      .clamp(0, duration.inSeconds)
                      .toDouble(),
                  onChanged: (value) async {
                    final newPosition = Duration(seconds: value.toInt());
                    await audioPlayer.seek(newPosition);
                  },
                ),

                // Time indicators
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration - position)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Play/pause button
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    iconSize: 35,
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () async {
                      final url = post.postAudio;
                      if (url != null && url.isNotEmpty) {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.play(UrlSource(url));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Audio URL is missing."),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
