import 'dart:developer';

import 'package:animal_app/model/all_animals_model.dart';
import 'package:animal_app/model/animal_detail_model.dart';
import 'package:animal_app/view/animals%20details/animals_details_page.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../main.dart';

class MusicPage extends StatefulWidget {
  final AllAnimals category;
  final AnimalDetailModel animalDetail;

  const MusicPage({
    super.key,
    required this.category,
    required this.animalDetail,
  });

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    try {
      final audioUrl = widget.animalDetail.postAudio;

      if (audioUrl == null || audioUrl.isEmpty) {
        log("❌ Audio URL is null or empty");
        return;
      }

      await _player.setUrl(audioUrl);
    } catch (e) {
      log("❌ Audio error: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.brown),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.category.catName ?? "Animal",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: mq.height * .05),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.shade100,
              ),
              padding: const EdgeInsets.all(10),
              child: CachedNetworkImage(
                imageUrl: widget.category.catImg ?? '',
                imageBuilder: (context, imageProvider) =>
                    CircleAvatar(radius: 120, backgroundImage: imageProvider),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image, size: 120),
              ),
            ),

            const SizedBox(height: 30),
            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ProgressBar(
                    progress: positionData?.position ?? Duration.zero,
                    buffered: positionData?.bufferedPosition ?? Duration.zero,
                    total: positionData?.duration ?? Duration.zero,
                    timeLabelTextStyle: const TextStyle(color: Colors.brown),
                    progressBarColor: Colors.brown,
                    baseBarColor: Colors.brown.withAlpha(50),
                    bufferedBarColor: Colors.orange.withAlpha(80),
                    thumbColor: Colors.brown,
                    onSeek: _player.seek,
                  ),
                );
              },
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () => _player.seek(Duration.zero),
                  iconSize: 40,
                ),
                StreamBuilder<PlayerState>(
                  stream: _player.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final isPlaying = playerState?.playing;
                    final processingState = playerState?.processingState;

                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return const CircularProgressIndicator();
                    } else if (isPlaying != true) {
                      return CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 35,
                        child: IconButton(
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          iconSize: 40,
                          onPressed: _player.play,
                        ),
                      );
                    } else {
                      return CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 35,
                        child: IconButton(
                          icon: const Icon(Icons.pause, color: Colors.white),
                          iconSize: 40,
                          onPressed: _player.pause,
                        ),
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: () => _player.seek(Duration.zero),
                  iconSize: 40,
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnimalsDetailsPage(
                          category: widget.category,
                          id: widget.category.id.toString(),
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/audio_scr_ad.png',
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}
