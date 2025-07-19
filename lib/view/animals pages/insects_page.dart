import 'package:animal_app/providers/insect_provider.dart';

import '../../widgets/build_category_gridview.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class InsectsPage extends StatefulWidget {
  const InsectsPage({super.key});

  @override
  State<InsectsPage> createState() => _InsectsPageState();
}

class _InsectsPageState extends State<InsectsPage> {
  @override
  void initState() {
    super.initState();
    context.read<InsectsProvider>().getInsectsCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insects")),
      body: Consumer<InsectsProvider>(
        builder: (context, controller, child) {
          if (controller.getInsectsCategoryData.isEmpty) {
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
              itemCount: controller.getInsectsCategoryData.length,
              itemBuilder: (context, index) {
                final category = controller.getInsectsCategoryData[index];
                return buildCategoryGridItem(category);
              },
            );
          }
        },
      ),
    );
  }
}
