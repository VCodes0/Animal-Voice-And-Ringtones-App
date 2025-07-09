import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/all_animals_model.dart';

class InsectsProvider extends ChangeNotifier {
  final dio = Dio();
  String dynamicUrl =
      "https://appy.trycatchtech.com/v3/animal_sound_prank_and_ringtones/animal_sound_prank_and_ringtones_child_category_list?parent_id=8";

  List<AllAnimals> _getInsectsCategoryData = [];

  List<AllAnimals> get getInsectsCategoryData => _getInsectsCategoryData;

  Future<void> getInsectsCategory() async {
    var response = await dio.get(dynamicUrl);
    try {
      if (response.statusCode == 200 && response.data != null) {}
      {
        final List<dynamic> dataDecode = jsonDecode(response.data);
        _getInsectsCategoryData = AllAnimals.getAllAnimals(dataDecode);
        SharedPreferences sh = await SharedPreferences.getInstance();
        await sh.setString('insects_data', response.data);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching pets animal : $e");
      throw Exception("Failed to load pets animal: $e");
    }
  }
}
