import 'package:animal_app/providers/mammals_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../widgets/build_category_gridview.dart';

class MammalsPage extends StatefulWidget {
  const MammalsPage({super.key});

  @override
  State<MammalsPage> createState() => _MammalsPageState();
}

class _MammalsPageState extends State<MammalsPage> {
  @override
  void initState() {
    super.initState();
    context.read<MammalsProvider>().getMammalsCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mammals")),
      body: Consumer<MammalsProvider>(
        builder: (context, controller, child) {
          if (controller.getMammalsCategoryData.isEmpty) {
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
              itemCount: controller.getMammalsCategoryData.length,
              itemBuilder: (context, index) {
                final category = controller.getMammalsCategoryData[index];
                return buildCategoryGridItem(category);
              },
            );
          }
        },
      ),
    );
  }
}
