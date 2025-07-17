import 'package:animal_app/view/music page/music_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/all_animals_model.dart';
import '../model/animal_detail_model.dart';
import '../providers/animal_detail_provieder.dart';

Widget buildCategoryGridItem(AllAnimals category) {
  Color labelBackgroundColor = CupertinoColors.white;
  return GestureDetector(
    onTap: () async {
      final provider = AnimalDetailProvider();
      provider.setCategoryId(category.id.toString());
      await provider.getAllAnimalDetails(); 

      if (provider.allAni.isNotEmpty) {
        final AnimalDetailModel detail = provider.allAni.first;

        if (detail.postAudio != null && detail.postAudio!.isNotEmpty) {
          Get.to(() => MusicPage(category: category, animalDetail: detail));
          return;
        }
      }
      Get.snackbar(
        "Audio not available",
        "No audio found for ${category.catName}.",
        snackPosition: SnackPosition.BOTTOM,
      );
    },
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: category.catImg != null && category.catImg!.isNotEmpty
                ? ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: category.catImg!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Icon(Icons.image, size: 80, color: Colors.grey[300]),
                  ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            decoration: BoxDecoration(
              color: labelBackgroundColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16.0),
              ),
            ),
            child: Center(
              child: Text(
                category.catName ?? 'Unknown',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
