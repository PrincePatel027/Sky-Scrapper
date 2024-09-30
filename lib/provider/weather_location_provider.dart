import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherLocationProvider extends ChangeNotifier {
  List<String> recentList = [];

  WeatherLocationProvider() {
    loadData();
  }

  void addLocation(String location) {
    if (!recentList.contains(location)) {
      recentList.add(location);
      saveData();
      notifyListeners();
    }
  }

  void removeLocation(String location) {
    recentList.remove(location);
    saveData();
    notifyListeners();
  }

  void clearLocations() {
    recentList.clear();
    saveData();
    notifyListeners();
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("DATA", jsonEncode(recentList));
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("DATA");
    if (data != null) {
      recentList = List<String>.from(jsonDecode(data));
      notifyListeners();
    }
  }
}
