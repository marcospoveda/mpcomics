import 'package:br/properties/constants.dart';
import 'package:flutter/material.dart';

class NewUserPage extends StatefulWidget {
  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDefaultAppBarColor,
        title: Text('Novo Usuário'),
      ),
      body:
      SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            builderTextField(
              'Nome', 
              Icon(
                Icons.text_fields,
                color: kIconsPrimaryColor
              ), 
              false
            ),
            SizedBox(height: kDefaultSpaceSize),
            builderTextFieldNumber(
              'Celular', 
              Icon(
                Icons.phone_android, 
                color: kIconsPrimaryColor
              )
            ),
            SizedBox(height: kDefaultSpaceSize),
            builderTextField(
              'E-mail', 
              Icon(
                Icons.alternate_email, 
                color: kIconsPrimaryColor
              ), 
              false
            ),
            SizedBox(height: kDefaultSpaceSize),
            builderTextField(
              'Usuário', 
              Icon(
                Icons.account_circle, 
                color: kIconsPrimaryColor
              ), 
              false
            ),
            SizedBox(height: kDefaultSpaceSize),
            builderTextField(
              'Senha', 
              Icon(
                Icons.lock_outline, 
                color: kIconsPrimaryColor
              ), 
              true
            ),
            SizedBox(height: kDefaultSpaceSize),
            builderTextField(
              'Confirmar Senha', 
              Icon(
                Icons.lock_outline, 
                color: kIconsPrimaryColor
              ), 
              true
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
                    'Finalizar Cadastro', 
                    style: TextStyle(
                      color: kButtonTextColor, 
                      fontSize: 20
                    )
                  ),
                ),          
              ),
              onTap: (){},
            ),
          ],
        ),
      )
    );
  }
}

Widget builderTextField(String hint, Icon prefixIcon, bool passwd) {
  return TextField(
    obscureText: passwd,
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8)
      )
    ),
  );
}

Widget builderTextFieldNumber(String hint, Icon prefixIcon) {
  return TextField(
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8)
      )
    ),
    keyboardType: TextInputType.numberWithOptions(),
  );
}
