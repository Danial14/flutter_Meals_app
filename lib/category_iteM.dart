import 'package:flutter/material.dart';

class CategoryIteM extends StatelessWidget{
  final String title;
  final Color color;
  CategoryIteM({required this.title, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title
      ),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7),
            color
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft
        ),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}