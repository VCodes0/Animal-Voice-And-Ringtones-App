import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/all_animals_model.dart';

class ReptilesAndAmphibiansProvider extends ChangeNotifier {
  final dio = Dio();
  String dynamicUrl =
      "https://appy.trycatchtech.com/v3/animal_sound_prank_and_ringtones/animal_sound_prank_and_ringtones_child_category_list?parent_id=7";

  List<AllAnimals> _getReptilesAmphibiansCategoryData = [];

  List<AllAnimals> get getReptilesAmphibiansCategoryData =>
      _getReptilesAmphibiansCategoryData;

  Future<void> getReptilesAmphibianslCategory() async {
    var response = await dio.get(dynamicUrl);
    try {
      if (response.statusCode == 200 && response.data != null) {}
      {
        final List<dynamic> dataDecode = jsonDecode(response.data);
        _getReptilesAmphibiansCategoryData = AllAnimals.getAllAnimals(
          dataDecode,
        );
        SharedPreferences sh = await SharedPreferences.getInstance();
        await sh.setString('reptiles_amphibians_data', response.data);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching pets animal : $e");
      throw Exception("Failed to load pets animal: $e");
    }
  }
}
