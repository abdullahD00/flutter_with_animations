import 'package:animations/tween/viewmodel/tween_viewmodel.dart';
import 'package:flutter/material.dart';

class TweensView extends StatefulWidget {
  const TweensView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TweensViewState createState() => _TweensViewState();
}

class _TweensViewState extends TweensViewModel {
  @override
  Widget build(BuildContext context) {
    final widget = ListView.separated(
      itemCount: curves.entries.length,
      separatorBuilder: (_, __) => const SizedBox(height: 15, width: 15),
      itemBuilder: (context, index) {
        final curve = curves.entries.elementAt(index);
        return Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: animationController!,
                builder: (context, child) {
                  final position =
                      getCurvedTween(animationController!, curve.value);
                  return SlideTransition(
                    position: position,
                    child: child,
                  );
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: Color.fromARGB(
                    255,
                    160 + 20 * (index % 3),
                    180 + 30 * (index % 2),
                    170 + 20 * (index % 5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: CustomPaint(
                painter: CurvePainter(curve.value),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  curve.key,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ],
        );
      },
    );

    return ClipRect(
      child: widget,
    );
  }
}

class CurvePainter extends CustomPainter {
  CurvePainter(this.curve);

  final Curve curve;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    for (var i = 0; i < size.width; i++) {
      path.lineTo(i.toDouble(), curve.transform(i / size.width) * size.height);
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white12
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
