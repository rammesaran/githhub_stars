import 'package:flutter/material.dart';

import 'src/app.dart';

void main() {
  runApp(MyApp());
}

class Editor {
  String _content;

  String get contentType => _content;

  set contentType(String value) => _content = value;
}
