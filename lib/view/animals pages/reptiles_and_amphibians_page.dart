import 'package:animal_app/providers/reptiles_and_amphibians_providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../widgets/build_category_gridview.dart';

class ReptilesAndAmphibians extends StatefulWidget {
  const ReptilesAndAmphibians({super.key});

  @override
  State<ReptilesAndAmphibians> createState() => _ReptilesAndAmphibiansState();
}

class _ReptilesAndAmphibiansState extends State<ReptilesAndAmphibians> {
  @override
  void initState() {
    super.initState();
    context
        .read<ReptilesAndAmphibiansProvider>()
        .getReptilesAmphibianslCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reptiles & AndAmphibians")),
      body: Consumer<ReptilesAndAmphibiansProvider>(
        builder: (context, controller, child) {
          if (controller.getReptilesAmphibiansCategoryData.isEmpty) {
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
              itemCount: controller.getReptilesAmphibiansCategoryData.length,
              itemBuilder: (context, index) {
                final category =
                    controller.getReptilesAmphibiansCategoryData[index];
                return buildCategoryGridItem(category);
              },
            );
          }
        },
      ),
    );
  }
}
