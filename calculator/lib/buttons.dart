import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color col;
  final VoidCallback onPress;
  const MyButton(
      {super.key,
      required this.title,
      required this.col,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(color: col, shape: BoxShape.circle),
          child: Center(
              child: Text(
            title,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          )),
        ),
      ),
    );
  }
}
