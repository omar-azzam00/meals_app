import 'package:flutter/material.dart';

class Category {
  static int currentId = 0;

  Category(this.title, this.color) : id = 'c$currentId' {
    currentId++;
  }

  final String id;
  final String title;
  final Color color;
}
