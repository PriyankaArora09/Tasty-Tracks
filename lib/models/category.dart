import 'package:flutter/material.dart';

class Category {
  Category(
      {required this.id,
      required this.title,
      this.color = Colors.pinkAccent});

  final String id;
  final String title;
  final Color color;
}
