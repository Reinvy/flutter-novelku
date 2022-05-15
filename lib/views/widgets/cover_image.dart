import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Image.network(
        'https://picsum.photos/id/43/200/300',
        width: double.infinity,
        height: 240,
        fit: BoxFit.cover,
      ),
    );
  }
}
