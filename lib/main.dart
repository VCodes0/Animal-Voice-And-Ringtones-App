import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'providers/animal_caegory_provider.dart';
import 'providers/birds_provider.dart';
import 'providers/farm_provider.dart';
import 'providers/insect_provider.dart';
import 'providers/land_animals_provider.dart';
import 'providers/mammals_provider.dart';
import 'providers/pet_animals_provider.dart';
import 'providers/reptiles_and_amphibians_providers.dart';
import 'providers/water_animals_provider.dart';
import 'providers/wild_animals_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnimalCategoryProvider()),
        ChangeNotifierProvider(create: (context) => WaterAnimalsProvider()),
        ChangeNotifierProvider(create: (context) => WildAnimalsProvider()),
        ChangeNotifierProvider(create: (context) => LandAnimalsProvider()),
        ChangeNotifierProvider(create: (context) => FarmAnimalProvider()),
        ChangeNotifierProvider(create: (context) => PetAnimalsPovider()),
        ChangeNotifierProvider(create: (context) => InsectsProvider()),
        ChangeNotifierProvider(create: (context) => MammalsProvider()),
        ChangeNotifierProvider(create: (context) => BirdsProvider()),
        ChangeNotifierProvider(
          create: (context) => ReptilesAndAmphibiansProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Animal Voice And Ringtone App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
