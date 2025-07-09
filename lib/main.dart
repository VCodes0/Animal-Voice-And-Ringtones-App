import 'package:animal_voice_app/view/app%20pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'view/app pages/splash_page.dart';
import 'view/onboards/first_onboard_page.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sh = await SharedPreferences.getInstance();
  initScreen = sh.getInt('initScreen');
  await sh.setInt('initScreen', 1);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimalCategoryProvider()),
        ChangeNotifierProvider(create: (_) => WaterAnimalsProvider()),
        ChangeNotifierProvider(create: (_) => WildAnimalsProvider()),
        ChangeNotifierProvider(create: (_) => LandAnimalsProvider()),
        ChangeNotifierProvider(create: (_) => FarmAnimalProvider()),
        ChangeNotifierProvider(create: (_) => PetAnimalsPovider()),
        ChangeNotifierProvider(create: (_) => InsectsProvider()),
        ChangeNotifierProvider(create: (_) => MammalsProvider()),
        ChangeNotifierProvider(create: (_) => BirdsProvider()),
        ChangeNotifierProvider(create: (_) => ReptilesAndAmphibiansProvider()),
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
      theme: ThemeData(
        scaffoldBackgroundColor: CupertinoColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: CupertinoColors.white,
          foregroundColor: CupertinoColors.black,
          centerTitle: true,
          titleSpacing: 1,
          titleTextStyle: TextStyle(
            fontSize: 15,
            letterSpacing: 1,
            color: CupertinoColors.black,
          ),
        ),
      ),
      initialRoute: initScreen == 0 || initScreen == null
          ? 'FirstOnboardingPage'
          : 'CategoryPage',
      routes: {
        'FirstOnboardingPage': (context) => const FirstOnboardingPage(),
        'CategoryPage': (context) => const CategoryPage(),
      },
      home: const SplashPage(),
    );
  }
}
