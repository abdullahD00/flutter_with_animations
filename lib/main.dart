import 'package:animations/custom_controller/custom_controller.dart';
import 'package:animations/implicit_animation/implicit_loader/view/implicit_animations.dart';
import 'package:animations/implicit_animation/implicit_loader/view/implicit_loader_view.dart';
import 'package:animations/implicit_animation/view/implicit_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImplicitAnimations(),
    );
  }
}
