import 'package:animations/tween/service/tween_service.dart';
import 'package:animations/tween/view/tween_view.dart';
import 'package:flutter/material.dart';

abstract class TweensViewModel extends State<TweensView>
    with TickerProviderStateMixin
    implements TweensService {
  AnimationController? animationController;

  final curves = <String, Curve>{
    'Curves.linear': Curves.linear,
    'Curves.bounceIn': Curves.bounceIn,
    'Curves.decelerate': Curves.decelerate,
    'Curves.ease': Curves.ease,
    'Curves.easeInOut': Curves.easeInOut,
    'Curves.easeOutBack': Curves.easeOutBack,
    'Curves.easeOutExpo': Curves.easeOutExpo,
    'Curves.easeOutSine': Curves.easeOutSine,
    'Curves.easeInOutExpo': Curves.easeInOutExpo,
    'Curves.easeInOutCubicEmphasized': Curves.easeInOutCubicEmphasized,
    'Curves.elasticIn': Curves.elasticIn,
    'Curves.fastLinearToSlowEaseIn': Curves.fastLinearToSlowEaseIn,
    'Curves.slowMiddle': Curves.slowMiddle,
  };

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..forward()
      ..repeat();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Animation<Offset> getTween(AnimationController controller) {
    return Tween<Offset>(
      begin: const Offset(-2.0, 0.0),
      end: const Offset(2.0, 0.0),
    ).animate(controller);
  }

  @override
  Animation<Offset> getCurvedTween(
      AnimationController controller, Curve curve) {
    return Tween<Offset>(
      begin: const Offset(-2.0, 0.0),
      end: const Offset(2.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: curve,
      ),
    );
  }
}
