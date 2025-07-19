import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/all_animals_model.dart';

class WildAnimalsProvider extends ChangeNotifier {
  final dio = Dio();
  String dynamicUrl =
      "https://appy.trycatchtech.com/v3/animal_sound_prank_and_ringtones/animal_sound_prank_and_ringtones_child_category_list?parent_id=2";

  List<AllAnimals> _getWildAnimalCategoryData = [];

  List<AllAnimals> get getWildAnimalCategoryData => _getWildAnimalCategoryData;

  Future<void> getWildAnimalCategory() async {
    var response = await dio.get(dynamicUrl);
    try {
      if (response.statusCode == 200 && response.data != null) {}
      {
        final List<dynamic> dataDecode = jsonDecode(response.data);
        _getWildAnimalCategoryData = AllAnimals.getAllAnimals(dataDecode);
        SharedPreferences sh = await SharedPreferences.getInstance();
        await sh.setString('wild_animal_data', response.data);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching wild animal : $e");
      throw Exception("Failed to load wild animal: $e");
    }
  }
}
