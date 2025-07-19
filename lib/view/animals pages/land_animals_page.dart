import 'package:animal_app/providers/land_animals_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../widgets/build_category_gridview.dart';

class LandAnimals extends StatefulWidget {
  const LandAnimals({super.key});

  @override
  State<LandAnimals> createState() => _LandAnimalsState();
}

class _LandAnimalsState extends State<LandAnimals> {
  @override
  void initState() {
    super.initState();
    context.read<LandAnimalsProvider>().getLandAnimalsCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Land Animal")),
      body: Consumer<LandAnimalsProvider>(
        builder: (context, controller, child) {
          if (controller.getLandAnimalsCategoryData.isEmpty) {
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
              itemCount: controller.getLandAnimalsCategoryData.length,
              itemBuilder: (context, index) {
                final category = controller.getLandAnimalsCategoryData[index];
                return buildCategoryGridItem(category);
              },
            );
          }
        },
      ),
    );
  }
}
