import 'package:br/components/custom_drawer.dart';
import 'package:br/properties/constants.dart';
import 'package:br/view/comics_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: kDefaultAppBarColor,
        title: Text('HQ Brasil'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {}
          )
        ],
      ),
      body: Container(),
    );
  }
}