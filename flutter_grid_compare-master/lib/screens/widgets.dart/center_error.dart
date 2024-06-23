import 'package:flutter/material.dart';

class CenterError extends StatelessWidget {
  const CenterError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Center Error'),
      ),
    );
  }
}
