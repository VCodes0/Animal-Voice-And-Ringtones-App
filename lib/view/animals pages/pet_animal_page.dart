import 'package:animal_app/providers/pet_animals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/build_category_gridview.dart';

class PetAnimal extends StatefulWidget {
  const PetAnimal({super.key});

  @override
  State<PetAnimal> createState() => _PetAnimalState();
}

class _PetAnimalState extends State<PetAnimal> {
  @override
  void initState() {
    super.initState();
    context.read<PetAnimalsPovider>().getPetAnimalCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pet Animal")),
      body: Consumer<PetAnimalsPovider>(
        builder: (context, controller, child) {
          if (controller.getPetAnimalCategoryData.isEmpty) {
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
              itemCount: controller.getPetAnimalCategoryData.length,
              itemBuilder: (context, index) {
                final category = controller.getPetAnimalCategoryData[index];
                return buildCategoryGridItem(category);
              },
            );
          }
        },
      ),
    );
  }
}
