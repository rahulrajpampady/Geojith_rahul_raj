import 'package:flutter/material.dart';
import 'package:geojith/models/home.dart';

import '../interface/home.dart';

class HomeProvider extends ChangeNotifier {
  List<Home> home = [];
  List<Home> filteredResult = [];

  Future<List<Home>> fetchHome() async {
    home = await HomeInterface.fetchHome();
    filteredResult = home;
    notifyListeners();
    return home;
  }

  onSearch({required String query}) {
    if (query.isEmpty) {
      filteredResult = home;
    } else {
      filteredResult =
          home.where((element) => element.title!.contains(query)).toList();
    }

    notifyListeners();
  }
}
