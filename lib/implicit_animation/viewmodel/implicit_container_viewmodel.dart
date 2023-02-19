import 'package:animations/implicit_animation/view/implicit_container.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

abstract class ImplicitAnimationsViewModel extends State<ImplicitAnimations> {
  Alignment alignment = Alignment.center;
  String anmatdPhysclMdl = "AnimatedPhysicalModel";
  String anmatdCntanr = "AnimatedContainer";
  int index = 0;
  final colors = [Colors.green, Colors.deepPurple, Colors.red];
  final bColors = [Colors.transparent, Colors.purple, Colors.green[800]];
  final sizes = [150.0, 195.0, 300.0];
  final tSizes = [12.0, 16.0, 20.0];
  final radius = [0.0, 16.0, 90.0];
  final elevations = [0.0, 16.0, 32.0];
  final opacity = [1.0, 0.3, 0.01];

  void randomFunction() {
    final random1 = (math.Random().nextDouble() - 0.5);
    final random2 = (math.Random().nextDouble() - 0.5);
    alignment = Alignment(random1, random2);
  }

  void setIndex() {
    index = (index + 1) % colors.length;
  }
}
