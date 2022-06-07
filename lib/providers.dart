import 'package:flutter/material.dart';
import 'package:geojith/provider/home.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderTree {
  List<SingleChildWidget> get(BuildContext context) {
    return [
      ChangeNotifierProvider.value(value: HomeProvider()),
    ];
  }
}
