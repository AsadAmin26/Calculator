import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Calculator',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
        ),
        body: Calculator(),
      ),
    );
  }
}
