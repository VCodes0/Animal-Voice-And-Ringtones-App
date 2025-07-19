import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/all_animals_model.dart';

class PetAnimalsPovider extends ChangeNotifier {
  final dio = Dio();
  String dynamicUrl =
      "https://appy.trycatchtech.com/v3/animal_sound_prank_and_ringtones/animal_sound_prank_and_ringtones_child_category_list?parent_id=1";

  List<AllAnimals> _getPetAnimalCategoryData = [];

  List<AllAnimals> get getPetAnimalCategoryData => _getPetAnimalCategoryData;

  Future<void> getPetAnimalCategory() async {
    var response = await dio.get(dynamicUrl);
    try {
      if (response.statusCode == 200 && response.data != null) {}
      {
        final List<dynamic> dataDecode = jsonDecode(response.data);
        _getPetAnimalCategoryData = AllAnimals.getAllAnimals(dataDecode);
        SharedPreferences sh = await SharedPreferences.getInstance();
        await sh.setString('pet_animal_data', response.data);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching pets animal : $e");
      throw Exception("Failed to load pets animal: $e");
    }
  }
}
