import 'dart:convert';
import 'dart:developer';

import 'package:animal_app/model/all_animals_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllAnimalProvider extends ChangeNotifier {
  final dio = Dio();
  final dynamicUrl =
      "https://appy.trycatchtech.com/v3/animal_sound_prank_and_ringtones/animal_sound_prank_and_ringtones_all_data";
  List<AllAnimals> _allAni = [];
  List<AllAnimals> get allAni => _allAni;

  Future<void> loadFromCache() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    final cachedData = sh.getString('AllAni');
    if (cachedData != null) {
      final List<dynamic> dataDecode = jsonDecode(cachedData);
      _allAni = AllAnimals.getAllAnimals(dataDecode);
      notifyListeners();
    }
  }

  Future<void> getAllAni() async {
    await loadFromCache(); // Load cached data first
    try {
      var response = await dio.get(dynamicUrl);
      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> dataDecode = jsonDecode(response.data);
        _allAni = AllAnimals.getAllAnimals(dataDecode);
        // Save to SharedPreferences
        SharedPreferences sh = await SharedPreferences.getInstance();
        await sh.setString('AllAni', response.data);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching All animal : $e");
      // If network fails, you still have cached data
    }
  }
}
