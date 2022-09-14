import 'package:clean_architecture_course/core/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// Core Module --> Put on it things that [Apply Features You Have]
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts App',
      theme: lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: Center(
          child: Container(
            child: const Text(
              'Hello World',
            ),
          ),
        ),
      ),
    );
  }
}
