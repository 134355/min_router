import 'package:flutter/material.dart';

class MinNavigatorObserver extends NavigatorObserver {
  MinNavigatorObserver._();

  static MinNavigatorObserver _instance;
  static MinNavigatorObserver get instance {
    if (_instance == null) {
      _instance = MinNavigatorObserver._();
    }

    return _instance;
  }

  factory MinNavigatorObserver() => instance;
}
