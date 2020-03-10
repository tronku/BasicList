import 'package:flut_first/src/widgets/ImageList.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'models/ImageModel.dart';
import 'package:http/http.dart' show get;

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}


class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchData() async {
    counter++;
    var response = 
    await get('https://jsonplaceholder.typicode.com/photos/$counter');
    
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text('My first app'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchData,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}