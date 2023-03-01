import 'package:flutter/material.dart';

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget(
    this.imageHeight, {
    super.key,
  });

  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      color: Colors.amber,
      alignment: Alignment.center,
      child: const Text(
        'Not found',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
