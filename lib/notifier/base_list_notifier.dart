


import 'dart:collection';

import 'package:flutter/material.dart';

class BaseListNotifier extends ChangeNotifier {
  bool _loaded = false;
  List<dynamic> _list = [];
  
  UnmodifiableListView<dynamic> get list {
    return UnmodifiableListView(_list);
  }

  bool get loaded {
    return _loaded;
  }

  set loaded(bool loaded) {
    _loaded = loaded;
    notifyListeners();
  } 

  set list(List<dynamic> list) {
    _list = list;
    _loaded = true;
    notifyListeners();
  }
}