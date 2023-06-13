import 'package:flutter/material.dart';
class TimerBuilder extends StatefulWidget {
  final Duration duration;
  final void Function() onEnd;
  final Text Function(BuildContext context, Duration remaining) builder;

  TimerBuilder({
    required this.duration,
    required this.builder,
    this.onEnd = _defaultOnEnd,
  });

  static void _defaultOnEnd() {}

  @override
  _TimerBuilderState createState() => _TimerBuilderState();
}

class _TimerBuilderState extends State<TimerBuilder>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onEnd();
        }
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final remaining =
            widget.duration * (1 - _controller.value);
        return widget.builder(context, remaining);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
