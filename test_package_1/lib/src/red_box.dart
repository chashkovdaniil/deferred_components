import 'package:flutter/material.dart';

class RedBox extends StatelessWidget {
  const RedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 100,
      height: 100,
      child: Text('Red box'),
    );
  }
}
