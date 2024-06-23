import 'package:flutter/material.dart';

class SelectedIcon extends StatelessWidget {
  const SelectedIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }
}
