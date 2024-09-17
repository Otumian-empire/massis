import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" show get;
import "package:massis/src/model/image_model.dart";
import "package:massis/src/widgets/image_list.dart";

class App extends StatefulWidget {
  const App({super.key});

  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    var response = await get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos/${counter + 1}"),
    );

    print(response.body);

    var imageModel = ImageModel.fromJson(
      json.decode(response.body),
    );

    setState(() {
      images.add(imageModel);
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ImageList(images),
        ),
        appBar: AppBar(
          title: const Text("Let's see images"),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: fetchImage,
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
      ),
    );
  }
}
