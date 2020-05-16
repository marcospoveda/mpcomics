import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'view/home_page.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primaryColor: Colors.blue
    )
  ));
}
