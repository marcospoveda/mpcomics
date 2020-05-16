import 'package:br/view/new_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.account_circle, size: 100.0, color: Colors.amber),
            Divider(),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline, color: Colors.amber),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Usuário'
              ),
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline, color: Colors.amber),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Senha'
              ),
              obscureText: true,
            ),
            Divider(),
            Container(
              height: 50,
              child: RaisedButton(
                color: Colors.redAccent[700],
                child: Text('Continuar', style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () {}
              ),
            ),
            Divider(),
            Container(
              height: 50,
              child: RaisedButton(
                  color: Colors.amber,
                  child: Text('Criar conta', style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewUserPage())
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
