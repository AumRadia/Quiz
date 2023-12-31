import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final VoidCallback? answerTap;

  Answer({
    required this.answerText,
    required this.answerColor,
    required this.answerTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          answerText,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
