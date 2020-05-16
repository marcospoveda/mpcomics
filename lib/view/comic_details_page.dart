import 'package:flutter/material.dart';

class ComicDetailsPage extends StatefulWidget {

  final Map _comic;

  ComicDetailsPage(this._comic);

  @override
  _ComicDetailsPageState createState() => _ComicDetailsPageState();
}

class _ComicDetailsPageState extends State<ComicDetailsPage> {
  List<String> _creators;



  @override
  Widget build(BuildContext context) {
    String description = widget._comic['description'];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget._comic['title']),
        backgroundColor: Colors.redAccent[700],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(widget._comic['images'][0]['path'] + '.jpg', height: 300,),
                  Expanded(
                      child: Column(
                        children: <Widget>[
                          Text('Creators', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20.0),),
//                          Text(widget._comic['creators']['items'][0]['name'], style: TextStyle(color: Colors.amber),),
//                          Text(widget._comic['creators']['items'][1]['name'], style: TextStyle(color: Colors.amber)),
                          Text('Katherine Brown', style: TextStyle(color: Colors.amber),),
                          Text('Scot Eaton', style: TextStyle(color: Colors.amber),),
                          Text('Wil Quintana', style: TextStyle(color: Colors.amber),),
                          Text('Wayne Faucher', style: TextStyle(color: Colors.amber),),
                          Text('Ralph Macchio', style: TextStyle(color: Colors.amber),),
                          Divider(),
                          Text('On Sale Date', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20.0),),
//                          Text(widget._comic['dates'][0]['date'], style: TextStyle(color: Colors.amber, ),),
                          Text('Capitain Marvel', style: TextStyle(color: Colors.amber),),
                          Divider(),
                          Text('Characters', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20.0)),
                          Text('Hulk', style: TextStyle(color: Colors.amber),),
                          Text('Iron Man', style: TextStyle(color: Colors.amber),),
                          Text('Capitain Marvel', style: TextStyle(color: Colors.amber),),
                          Text('Black Panther', style: TextStyle(color: Colors.amber),)
                        ],
                      ),
                  )
                ],
              ),
              Divider(),
              Text(description == null ? 'Descrição não disponível :(' : description, style: TextStyle(fontSize: 20.0, color: Colors.white),),
//              Text(description, style: TextStyle(fontSize: 20.0, color: Colors.white),),
              Divider(),
            ],
          ),
      ),
    );
  }

  Widget _builderCreators() {
    return Text('teste');
  }
}
