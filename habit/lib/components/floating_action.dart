import 'package:flutter/material.dart';

class MyFloatActionButton extends StatelessWidget {

  final Function()? onpressed;

  const MyFloatActionButton({super.key,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpressed,
      child:Icon(Icons.add),
      );
  }
}