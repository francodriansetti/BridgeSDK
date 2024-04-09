import 'package:flutter/material.dart';
import 'package:bridgesdk/bridgesdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WebView Example'),
        ),
        body: Center(
          child: Bridgesdk().buildWebView(),
        ),
      ),
    );
  }
}
