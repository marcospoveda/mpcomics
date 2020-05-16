import 'package:br/view/comics_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.black,
      drawer: Drawer(
        elevation: 10.0,
        child: Container(
          color: Colors.redAccent[700],
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: 5.0))
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        child: Text('MP', style: TextStyle(fontSize: 30),),
                        maxRadius: 30.0,
                      ),
                      Padding(padding: EdgeInsets.only(right: 20.0)),
                      Text('Usuário deslogado', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    ],
                  )
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white, size: 30.0),
                title: Text('Início', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.favorite_border, color: Colors.white, size: 30.0),
                title: Text('Favoritos', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.import_contacts, size: 30.0, color: Colors.white,),
                title: Text('HQs', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ComicsPage())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.ondemand_video, color: Colors.white, size: 30.0),
                title: Text('Séries', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.face, size: 30.0, color: Colors.white),
                title: Text('Personagens', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.info_outline, color: Colors.white, size: 30.0),
                title: Text('Novidades', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.person_outline, size: 30.0, color: Colors.white),
                title: Text('Conta', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage())
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, size: 30.0, color: Colors.white),
                title: Text('Configurações', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
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