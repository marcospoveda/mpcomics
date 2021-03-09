import 'package:br/properties/constants.dart';
import 'package:br/view/comic_details_page.dart';
import 'package:flutter/material.dart';
import '../infrastructure/comics_repository.dart';

class ComicsPage extends StatefulWidget {
  @override
  _ComicsPageState createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  int _offset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HQs'),
        backgroundColor: kDefaultAppBarColor,
      ),
      body:  Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                  future: ComicsRepository().getComics(_offset),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(kDefaultAppBarColor),
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
  }
}
