import 'package:flutter/material.dart';

class MainTitleText extends Text {
  final String data;

  MainTitleText({required this.data})
      : super(
          data,
          style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        );
}
