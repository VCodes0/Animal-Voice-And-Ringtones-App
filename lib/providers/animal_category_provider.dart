import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'dart:convert';
import '../model/animals_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimalCategoryProvider extends ChangeNotifier {
  final dio = Dio();

  final url =
      "https://appy.trycatchtech.com/v3/animal_sound_prank_and_ringtones/animal_sound_prank_and_ringtones_parent_category_list";
  List<AnimalCategory> _getAnimalCategoryData = [];

  List<AnimalCategory> get getAnimalCategoryData => _getAnimalCategoryData;

  Future<void> getCategoryAnimalData() async {
    var response = await dio.get(url);
    try {
      if (response.statusCode == 200 && response.data != null) {}
      {
        final List<dynamic> dataDecode = jsonDecode(response.data);
        _getAnimalCategoryData = AnimalCategory.getAnimalCategory(dataDecode);
        final sh = await SharedPreferences.getInstance();
        await sh.setString('animal_category_data', response.data);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching animal categories: $e");
      throw Exception("Failed to load animal categories: $e");
    }
  }
}
