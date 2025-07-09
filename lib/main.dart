import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animal Voice And Ringtone App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
