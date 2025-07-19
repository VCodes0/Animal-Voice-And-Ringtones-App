import 'package:animal_app/providers/farm_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../widgets/build_category_gridview.dart';

class FarmAnimal extends StatefulWidget {
  const FarmAnimal({super.key});

  @override
  State<FarmAnimal> createState() => _FarmAnimalState();
}

class _FarmAnimalState extends State<FarmAnimal> {
  @override
  void initState() {
    super.initState();
    context.read<FarmAnimalProvider>().getFarmAnimalCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Farm Animal")),
      body: Consumer<FarmAnimalProvider>(
        builder: (context, controller, child) {
          if (controller.getFarmAnimalCategoryData.isEmpty) {
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
              itemCount: controller.getFarmAnimalCategoryData.length,
              itemBuilder: (context, index) {
                final category = controller.getFarmAnimalCategoryData[index];
                return buildCategoryGridItem(category);
              },
            );
          }
        },
      ),
    );
  }
}
