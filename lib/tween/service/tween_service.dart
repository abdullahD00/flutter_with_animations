import 'package:flutter/material.dart';

abstract class TweensService {
  Animation<Offset> getTween(AnimationController controller);
  Animation<Offset> getCurvedTween(AnimationController controller, Curve curve);
}
