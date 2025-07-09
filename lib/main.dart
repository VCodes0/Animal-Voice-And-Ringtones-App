import 'package:animal_voice_app/providers/animal_caegory_provider.dart';
import 'package:animal_voice_app/providers/birds_provider.dart';
import 'package:animal_voice_app/providers/farm_provider.dart';
import 'package:animal_voice_app/providers/insect_provider.dart';
import 'package:animal_voice_app/providers/land_animals_provider.dart';
import 'package:animal_voice_app/providers/mammals_provider.dart';
import 'package:animal_voice_app/providers/pet_animals_povider.dart';
import 'package:animal_voice_app/providers/reptiles_and_amphibians_providers.dart';
import 'package:animal_voice_app/providers/water_animals_provider.dart';
import 'package:animal_voice_app/providers/wild_animals_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
