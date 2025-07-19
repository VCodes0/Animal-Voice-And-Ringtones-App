import 'package:animal_app/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/all_animals_model.dart';
import '../../providers/animal_detail_provieder.dart';

class AnimalsDetailsPage extends StatefulWidget {
  final String id;
  final AllAnimals category;

  const AnimalsDetailsPage({
    super.key,
    required this.category,
    required this.id,
  });

  @override
  State<AnimalsDetailsPage> createState() => _AnimalsDetailsPageState();
}

class _AnimalsDetailsPageState extends State<AnimalsDetailsPage> {
  late AnimalDetailProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = AnimalDetailProvider();
    _provider.setCategoryId(widget.id);
    _provider.getAllAnimalDetails();
  }

  // Function to manually remove basic HTML tags and convert to plain text
  String parseHtmlString(String htmlString) {
    return htmlString
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '')
        .replaceAll(RegExp(r'<[^>]*>'), '') // Remove all remaining tags
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AnimalDetailProvider>.value(
      value: _provider,
      child: Consumer<AnimalDetailProvider>(
        builder: (context, animal, _) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.brown),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                widget.category.catName ?? "Animal",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: mq.height * .02),
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
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 120,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.broken_image, size: 120),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mq.height * .03),
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: mq.width,
                          height: mq.height * .38,
                          child: animal.allAni.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  itemCount: animal.allAni.length,
                                  itemBuilder: (context, index) {
                                    final list = animal.allAni[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        parseHtmlString(
                                          list.description ?? 'No description',
                                        ),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: mq.width,
                          height: mq.height * .25,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 20,
                            ),
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
        },
      ),
    );
  }
}
