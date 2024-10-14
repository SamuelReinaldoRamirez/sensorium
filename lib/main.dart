import 'package:flutter/material.dart';

void main() {
  runApp(const LeSensoriumApp());
}

class LeSensoriumApp extends StatelessWidget {
  const LeSensoriumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Sensorium',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Sensorium'),
      ),
      body: const Center(
        child: Text(
          'Bienvenue dans Le Sensorium',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
