import 'dart:convert';
import 'dart:developer';

import 'package:animal_app/model/animal_detail_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimalDetailProvider extends ChangeNotifier {
  final Dio dio = Dio();
  late String _id;
  String get dynamicUrl =>
      "https://appy.trycatchtech.com/v3/animal_sound_prank_and_ringtones/animal_sound_prank_and_ringtones_post_list?category_id=$_id";

  List<AnimalDetailModel> _allAni = [];
  List<AnimalDetailModel> get allAni => _allAni;

  void setCategoryId(String id) {
    _id = id;
  }

  Future<void> getAllAnimalDetails() async {
    try {
      final response = await dio.get(dynamicUrl);
      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> dataDecode = response.data is String
            ? jsonDecode(response.data)
            : response.data;
        _allAni = AnimalDetailModel.sendAnimalDetails(dataDecode);
        SharedPreferences sh = await SharedPreferences.getInstance();
        await sh.setString('AllAni', jsonEncode(dataDecode));

        notifyListeners();
      }
    } catch (e) {
      log("Error fetching All animals: $e");
    }
  }
}
