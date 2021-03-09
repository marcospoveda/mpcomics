import 'package:br/properties/constants.dart';
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
      appBar: AppBar(
        backgroundColor: kDefaultAppBarColor,
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.account_circle, size: 100.0, color: kIconsPrimaryColor),
            SizedBox(height: kDefaultSpaceSize),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline, color: kIconsPrimaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Usuário'
              ),
            ),
            SizedBox(height: kDefaultSpaceSize),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline, color: kIconsPrimaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Senha'
              ),
              obscureText: true,
            ),
            SizedBox(height: kDefaultSpaceSize),
            GestureDetector(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: kButtonPrimaryColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text(
                    'Entrar', 
                    style: TextStyle(
                      color: kButtonTextColor, 
                      fontSize: 20
                    )
                  ),
                ),          
              ),
              onTap: (){},
            ),
            SizedBox(height: kDefaultSpaceSize),
            GestureDetector(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: kButtonSecudaryColor,
                  border: Border.all(
                    color: kBorderSecundaryButtonColor
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text(
                    'Criar Conta', 
                    style: TextStyle(
                      color: kButtonTextColor, 
                      fontSize: 20
                    )
                  ),
                ),          
              ),
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => NewUserPage())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
