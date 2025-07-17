import 'package:animal_app/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/all_animals_model.dart';

class AnimalsDetailsPage extends StatefulWidget {
  final AllAnimals category;
  const AnimalsDetailsPage({super.key, required this.category});

  @override
  State<AnimalsDetailsPage> createState() => _AnimalsDetailsPageState();
}

class _AnimalsDetailsPageState extends State<AnimalsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.brown),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("${widget.category.catName}"),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.shade100,
              ),
              padding: const EdgeInsets.all(10),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: widget.category.catImg ?? '',
                  imageBuilder: (context, imageProvider) =>
                      CircleAvatar(radius: 120, backgroundImage: imageProvider),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.broken_image, size: 120),
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  child: SizedBox(
                    width: mq.width,
                    height: mq.height * .38,
                    child: Text(""),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: mq.width,
                    height: mq.height * .25,
                    child: Padding(
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
