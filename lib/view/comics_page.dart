import 'dart:convert';

import 'package:br/view/comic_details_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComicsPage extends StatefulWidget {
  @override
  _ComicsPageState createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  int _offset = 0;

  final _key = 'aa10f1df5781f06027a5d298c1886593';
  final _hash = 'fe496d81fde0adcdfea311d8f625ba2c';

  Future<Map> _getComics() async {
    http.Response response;

    response = await http.get(
        'https://gateway.marvel.com:443/v1/public/comics?ts=1&apikey=$_key&hasDigitalIssue=true&offset=$_offset&hash=$_hash');

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HQs'),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.black,
      body:  Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                  future: _getComics(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent[700]),
                          strokeWidth: 5.0,
                        ),
                      );
                      default:
                        if (snapshot.hasError)
                          return Container();
                        else
                          return _createComicsList(context, snapshot);
                    }
                  }),
            ),
          ],
        ),
    );
  }

  Widget _createComicsList(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.5
        ),
        itemCount: snapshot.data['data']['results'].length + 1,
        itemBuilder: (context, index) {
        if(index < snapshot.data['data']['results'].length) {
          return GestureDetector(
            child: Column(
              children: <Widget>[
                Image.network(
                  snapshot.data['data']['results'][index]['images'][0]['path'] +
                      '.jpg',
                  fit: BoxFit.fitWidth,
                ),
                Divider(),
                Text(snapshot.data['data']['results'][index]['title'],
                  style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold, fontSize: 15.0),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ComicDetailsPage(snapshot.data['data']['results'][index]))
              );
            },
          );
        } else {
          return Container(
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 70.0,),
                  Text("Próxima Página",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),)
                ],
              ),
              onTap: (){
                setState(() {
                  _offset += 1;
                });
              },
            ),
          );
        }
      }
    );
//    return Center(
//      child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Text(snapshot.data['data']['results'][0]['title'],
//              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
//            ),
//            Image.network(snapshot.data['data']['results'][0]['images'][0]['path'] + '.jpg',
//              height: 300.0,
//              alignment: Alignment.center,
//              fit: BoxFit.fitHeight,
//            ),
//            Divider(),
//            Text(snapshot.data['data']['results'][0]['description'],
//              style: TextStyle(fontSize: 20.0),
//            ),
//          ],
//        ),
//    );
//    return GridView.builder(
//        padding: EdgeInsets.all(10.0),
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 2,
//            crossAxisSpacing: 10.0,
//            mainAxisSpacing: 10.0,
//        ),
//        itemCount: 4,
//        itemBuilder: (context, index) {
//          return GestureDetector(
//            child: Image.network(
//              snapshot.data['data']['results'][index]['images'][0]['path'] +
//                  '.jpg',
//              fit: BoxFit.fitHeight,
//            ),
//            onTap: () {},
//          );
//        });
  }
}
