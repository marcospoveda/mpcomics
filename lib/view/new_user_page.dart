import 'package:flutter/material.dart';

class NewUserPage extends StatefulWidget {
  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  String sexo = 'Sexo';
  var _itemSelecionado = 'Sexo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text('Novo Usuário'),
      ),
      body:
      SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            builderTextField('Nome', Icon(Icons.text_fields,
                color: Colors.amber), false),
            Divider(),
            Row(
              children: <Widget>[
                Flexible(
                    child: builderTextFieldNumber('Telefone', Icon(Icons.phone,
                    color: Colors.amber))
                ),
                Padding(padding: EdgeInsets.only(right: 5.0)),
                Flexible(
                  child: builderTextFieldNumber('Celular', Icon(Icons.phone_android,
                      color: Colors.amber)),
                )
              ],
            ),
            Divider(),
            builderTextField('E-mail', Icon(Icons.alternate_email, color: Colors.amber), false),
            Divider(),
            Row(
              children: <Widget>[
                Flexible(
                  child: builderTextFieldNumber('CPF', Icon(Icons.person_outline, color: Colors.amber)),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: buildDropButton(),
                )
              ],
            ),
            Divider(),
            builderTextField('Usuário', Icon(Icons.account_circle, color: Colors.amber), false),
            Divider(),
            builderTextField('Senha', Icon(Icons.lock_outline, color: Colors.amber), true),
            Divider(),
            Container(
              height: 50.0,
              child: RaisedButton(
                child: Text('Finalizar cadastro', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                color: Colors.redAccent[700],
                onPressed: () {}
              ),
            )
          ],
        ),
      )
    );
  }

  Widget buildDropButton() {
    var _sexos = ['Sexo', 'F', 'M', 'O'];

    return DropdownButton<String>(
      items: _sexos.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String newItem) {
        _dropDownItemSelected(newItem);
        setState(() {
          this._itemSelecionado = newItem;
        });
      },
      value: this._itemSelecionado,
    );
  }

  void _dropDownItemSelected(String novoItem){
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }
}

Widget builderTextField(String hint, Icon prefixIcon, bool passwd) {
  return TextField(
    obscureText: passwd,
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0)
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
            borderRadius: BorderRadius.circular(15.0)
        )
    ),
    keyboardType: TextInputType.numberWithOptions(),
  );
}
