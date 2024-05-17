import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
   Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color.fromARGB(255, 66, 33, 76), 
       child: Text(text,
       style: TextStyle(
          color: Color.fromARGB(255, 249, 247, 249),
    ),
    ),
  );}
}