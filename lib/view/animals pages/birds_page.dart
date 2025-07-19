import 'package:animal_app/providers/birds_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../widgets/build_category_gridview.dart';

class BirdsPage extends StatefulWidget {
  const BirdsPage({super.key});

  @override
  State<BirdsPage> createState() => _BirdsPageState();
}

class _BirdsPageState extends State<BirdsPage> {
  @override
  void initState() {
    super.initState();
    context.read<BirdsProvider>().getBirdsCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Birds")),
      body: Consumer<BirdsProvider>(
        builder: (context, controller, child) {
          if (controller.getBirdsCategoryData.isEmpty) {
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
              itemCount: controller.getBirdsCategoryData.length,
              itemBuilder: (context, index) {
                final category = controller.getBirdsCategoryData[index];
                return buildCategoryGridItem(category);
              },
            );
          }
        },
      ),
    );
  }
}
