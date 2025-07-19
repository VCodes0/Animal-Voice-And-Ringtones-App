import 'package:animal_app/providers/animal_category_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../model/animals_category.dart';
import '../animals pages/birds_page.dart';
import '../animals pages/farm_animals.dart';
import '../animals pages/insects_page.dart';
import '../animals pages/land_animals_page.dart';
import '../animals pages/mammals_page.dart';
import '../animals pages/pet_animal_page.dart';
import '../animals pages/reptiles_and_amphibians_page.dart';
import '../animals pages/water_animals_page.dart';
import '../animals pages/wild_animal_page.dart';
import 'drawer_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List pageOfList = [
    PetAnimal(),
    WildAnimal(),
    FarmAnimal(),
    BirdsPage(),
    MammalsPage(),
    ReptilesAndAmphibians(),
    InsectsPage(),
    LandAnimals(),
    WaterAnimals(),
  ];
  @override
  void initState() {
    super.initState();
    context.read<AnimalCategoryProvider>().getCategoryAnimalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animal Sound Prank & Ringtones',
          style: TextStyle(fontSize: 15),
        ),
      ),
      drawer: DrawerPage(),
      body: Consumer<AnimalCategoryProvider>(
        builder: (context, controller, child) {
          if (controller.getAnimalCategoryData.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.85,
              ),
              itemCount: controller.getAnimalCategoryData.length,
              itemBuilder: (context, index) {
                final category = controller.getAnimalCategoryData[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(pageOfList[index]);
                  },
                  child: _buildCategoryGridItem(category),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryGridItem(AnimalCategory category) {
    Color labelBackgroundColor;
    switch (category.id) {
      case '1':
        labelBackgroundColor = const Color(0xFFFDD835);
        break;
      case '2':
        labelBackgroundColor = const Color(0xFFFFF176);
        break;
      case '3':
        labelBackgroundColor = const Color(0xFFC5E1A5);
        break;
      case '4':
        labelBackgroundColor = const Color(0xFFF8BBD0);
        break;
      case '5':
        labelBackgroundColor = const Color(0xFFF48FB1);
        break;
      default:
        labelBackgroundColor = Colors.grey[200]!;
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: category.catImage != null && category.catImage!.isNotEmpty
                ? ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: category.catImage!,
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
    );
  }
}
