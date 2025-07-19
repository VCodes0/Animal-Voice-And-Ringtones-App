import 'dart:convert';
import 'dart:developer';

import 'package:animal_app/model/music_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicProvider extends ChangeNotifier {
  final dio = Dio();
  final url =
      "https://appy.trycatchtech.com/v3/animal_sound_prank_and_ringtones/animal_sound_prank_and_ringtones_all_data";
  List<AllPosts> _musicData = [];
  List<AllPosts> get musicData => _musicData;

  Future<void> getAnimalMusicData() async {
    try {
      var response = await dio.get(url);
      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> dataDecode = jsonDecode(response.data);
        _musicData = AllPosts.getMusicModel(dataDecode);
        SharedPreferences sh = await SharedPreferences.getInstance();
        await sh.setString('music_data', response.data);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching pets animal : $e");
    }
  }
}
