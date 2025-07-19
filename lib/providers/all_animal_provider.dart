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

  Future<void> getAllAni() async {
    try {
      var response = await dio.get(dynamicUrl);
      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> dataDecode = jsonDecode(response.data);
        _allAni = AllAnimals.getAllAnimals(dataDecode);
        SharedPreferences sh = await SharedPreferences.getInstance();
        await sh.setString('AllAni', response.data);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching All animal : $e");
    }
  }
}
