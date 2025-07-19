import 'package:animal_app/providers/water_animals_provider.dart';

import '../../widgets/build_category_gridview.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class WaterAnimals extends StatefulWidget {
  const WaterAnimals({super.key});

  @override
  State<WaterAnimals> createState() => _WaterAnimalsState();
}

class _WaterAnimalsState extends State<WaterAnimals> {
  @override
  void initState() {
    super.initState();
    context.read<WaterAnimalsProvider>().getWaterAnimalsCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Water Animal")),
      body: Consumer<WaterAnimalsProvider>(
        builder: (context, controller, child) {
          if (controller.getWaterAnimalsCategoryData.isEmpty) {
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
              itemCount: controller.getWaterAnimalsCategoryData.length,
              itemBuilder: (context, index) {
                final category = controller.getWaterAnimalsCategoryData[index];
                return buildCategoryGridItem(category);
              },
            );
          }
        },
      ),
    );
  }
}
