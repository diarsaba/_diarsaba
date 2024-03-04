import 'dart:ui';


import 'package:diarsaba/diarsaba.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    


    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
      debugShowCheckedModeBanner: false,
      home: const Diarsaba()
    );
  }
}
