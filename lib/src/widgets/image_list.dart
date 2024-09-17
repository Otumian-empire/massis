import "package:flutter/material.dart";
import "package:massis/src/model/image_model.dart";

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  const ImageList(this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.network(image.url),
          ),
          Text(image.title)
        ],
      ),
    );
  }
}
