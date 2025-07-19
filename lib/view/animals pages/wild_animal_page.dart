import 'package:animal_app/providers/wild_animals_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../widgets/build_category_gridview.dart';

class WildAnimal extends StatefulWidget {
  const WildAnimal({super.key});

  @override
  State<WildAnimal> createState() => _WildAnimalState();
}

class _WildAnimalState extends State<WildAnimal> {
  @override
  void initState() {
    super.initState();
    context.read<WildAnimalsProvider>().getWildAnimalCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wild Animal")),
      body: Consumer<WildAnimalsProvider>(
        builder: (context, controller, child) {
          if (controller.getWildAnimalCategoryData.isEmpty) {
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
              itemCount: controller.getWildAnimalCategoryData.length,
              itemBuilder: (context, index) {
                final category = controller.getWildAnimalCategoryData[index];
                return buildCategoryGridItem(category);
              },
            );
          }
        },
      ),
    );
  }
}
