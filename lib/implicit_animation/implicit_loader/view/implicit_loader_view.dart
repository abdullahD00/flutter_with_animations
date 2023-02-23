import 'package:animations/implicit_animation/implicit_loader/view/implicit_smooth_counter.dart';
import 'package:flutter/material.dart';

class SmoothLoadingIndicator extends ImplicitlyAnimatedWidget {
  // ignore: prefer_const_constructors_in_immutables
  SmoothLoadingIndicator({
    Key? key,
    required this.progress,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.linear,
    this.color = Colors.blue,
    this.backgroundColor = const Color(0xFFBBDEFB),
  }) : super(duration: duration, curve: curve, key: key);

  final double progress;
  final Color color;
  final Color backgroundColor;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _SmoothLoadingIndicatorState();
}

class _SmoothLoadingIndicatorState
    extends AnimatedWidgetBaseState<SmoothLoadingIndicator> {
  Tween<double?>? _progress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularProgressIndicator(
              backgroundColor: widget.backgroundColor,
              color: widget.color,
              value: 5,
              strokeWidth: 15,
            ),
            SmoothCounter(progress: 20),
          ],
        ),
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _progress = visitor(
      _progress,
      (widget.progress).clamp(0.0, 1.0),
      (dynamic value) => Tween<double>(begin: value as double?),
    ) as Tween<double?>?;
  }
}
