import 'dart:developer';

import 'package:geojith/models/home.dart';

import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class HomeInterface{
  static Future<List<Home>> fetchHome() async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.GET,
          route: "posts",
          body: {},
          queries: {});
      return Home.convertToList(response);
    } catch (err) {
      log(err.toString());
      return [];
    }
  }
}