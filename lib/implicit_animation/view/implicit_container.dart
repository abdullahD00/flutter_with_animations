import 'package:animations/implicit_animation/viewmodel/implicit_container_viewmodel.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends ImplicitAnimationsViewModel {
  @override
  Widget build(BuildContext context) {
    final text = 'Size: ${sizes[index]}, Radius: ${radius[index]}, '
        'Elevation: ${elevations[index]}';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(text),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Container()),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OverflowBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = (index + 1) % colors.length;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: AnimatedPhysicalModel(
                        duration: kThemeAnimationDuration,
                        shape: BoxShape.rectangle,
                        elevation: elevations[index],
                        color: Colors.blue[100]!,
                        shadowColor: colors[index],
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text(anmatdPhysclMdl),
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    width: sizes[index],
                    height: sizes[index],
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius[index]),
                      color: colors[index],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: radius[index],
                        ),
                      ],
                      border: Border.all(
                        color: bColors[index]!,
                        width: index * 10.0,
                      ),
                    ),
                    duration: kThemeAnimationDuration,
                    curve: Curves.easeInOut,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = (index + 1) % colors.length;
                        });
                      },
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: kThemeAnimationDuration,
                          style: TextStyle(fontSize: tSizes[index]),
                          child: Text(
                            anmatdCntanr,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: opacity[index],
                    duration: kThemeAnimationDuration,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = (index + 1) % colors.length;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text('AnimatedOpacity ${opacity[index]}'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: kThemeAnimationDuration,
                    alignment: alignment,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          randomFunction();
                        });
                      },
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 24)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('AnimatedAlign $alignment'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
