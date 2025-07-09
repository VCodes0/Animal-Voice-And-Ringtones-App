import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _BuildUI());
  }
}

class _BuildUI extends StatefulWidget {
  const _BuildUI();

  @override
  State<_BuildUI> createState() => _BuildUIState();
}

class _BuildUIState extends State<_BuildUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
