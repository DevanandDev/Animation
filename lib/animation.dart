import 'dart:math';

import 'package:animation_demo/animated_switcher.dart';
import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({super.key});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Color?> _color;
  late Animation<Size?> _size;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    final curved = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.2, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 0.5), weight: 1),
    ]).animate(curved);
    _color = ColorTween(
      begin: const Color.fromARGB(255, 34, 0, 255),
      end: const Color.fromARGB(255, 255, 0, 0),
    ).animate(_controller);
    _size = SizeTween(
      begin: Size(50, 50),
      end: Size(400, 200),
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Hero(
              tag: 'hero-tag',
              child: Transform.scale(
                scale: _animation.value,
                child: Container(
                  height: _size.value!.height,
                  width: _size.value!.width,
                  color: _color.value,
                ),
              ),
            );
          },

        ),
        
      ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>AnimatedSwitch()));
    }),
    );
  }
}
