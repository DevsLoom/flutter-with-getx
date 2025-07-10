import 'package:flutter/material.dart';
import 'dart:math';

typedef FlipCardBuilder = Widget Function(BuildContext context, bool isFront);

class FlipCard extends StatefulWidget {
  final FlipCardBuilder builder;
  final Duration duration;
  final bool flipOnTouch;
  final bool autoFlip;
  final Duration flipDelay;
  final bool infinityFlip;

  const FlipCard({
    super.key,
    required this.builder,
    this.duration = const Duration(milliseconds: 600),
    this.flipOnTouch = true,
    this.autoFlip = false,
    this.flipDelay = const Duration(seconds: 3),
    this.infinityFlip = false,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.autoFlip || widget.infinityFlip) {
      Future.delayed(widget.flipDelay, _autoFlipLoop);
    }
  }

  void _autoFlipLoop() async {
    if (!mounted) return;

    await _triggerFlip();
    if (widget.infinityFlip) {
      Future.delayed(widget.flipDelay, _autoFlipLoop);
    }
  }

  Future<void> _triggerFlip() async {
    if (!_controller.isAnimating) {
      if (_controller.value == 0) {
        await _controller.forward();
      } else {
        await _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.flipOnTouch ? _triggerFlip : null,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * pi;
          final isFront = _animation.value < 0.5;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: isFront
                ? widget.builder(context, true)
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(pi),
                    child: widget.builder(context, false),
                  ),
          );
        },
      ),
    );
  }
}
