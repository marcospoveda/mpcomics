import 'package:br/properties/constants.dart';
import 'package:br/view/character_page.dart';
import 'package:br/view/comics_page.dart';
import 'package:br/view/login_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: Container(
        color: kDefaultAppBarColor,
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
                  Padding(padding: EdgeInsets.only(right: kDefaultSpaceSize)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Usuário deslogado', style: TextStyle(color: kIconsPrimaryColor, fontSize: 20.0)),
                      SizedBox(height: 10),
                      GestureDetector(
                        child: Text(
                          'Entre ou cadastre-se >', 
                          style: TextStyle(
                            color: kIconsPrimaryColor, 
                            fontSize: 16.0
                          )
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginPage())
                          );
                        }
                      )
                    ],
                  ),
                ],
              )
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            ListTile(
              leading: Icon(Icons.home, color: kIconsPrimaryColor, size: 30.0),
              title: Text('Início', style: TextStyle(color: kIconsPrimaryColor, fontSize: 20.0)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: kIconsPrimaryColor, size: 30.0),
              title: Text('Favoritos', style: TextStyle(color: kIconsPrimaryColor, fontSize: 20.0)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.import_contacts, size: 30.0, color: kIconsPrimaryColor),
              title: Text('HQs', style: TextStyle(fontSize: 20.0, color: kIconsPrimaryColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ComicsPage())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.ondemand_video, color: kIconsPrimaryColor, size: 30.0),
              title: Text('Séries', style: TextStyle(color: kIconsPrimaryColor, fontSize: 20.0)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.face, size: 30.0, color: kIconsPrimaryColor),
              title: Text('Personagens', style: TextStyle(fontSize: 20.0, color: kIconsPrimaryColor)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CharacterPage())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, size: 30.0, color: kIconsPrimaryColor),
              title: Text('Configurações', style: TextStyle(color: kIconsPrimaryColor, fontSize: 20.0)),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}