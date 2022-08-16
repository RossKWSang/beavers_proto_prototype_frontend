import 'package:flutter/material.dart';
import 'package:beavers_prototype/method/board_api.dart';

class aptAnounced with ChangeNotifier {
  List<dynamic> _aptInfo = [];
  List<dynamic> get aptInfo => _aptInfo;

  void getInfo() async {
    _aptInfo = await getApts();
    notifyListeners();
  }
}
