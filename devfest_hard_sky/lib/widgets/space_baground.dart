import 'package:flutter/material.dart';

class SpaceBackGround extends StatefulWidget {
  const SpaceBackGround({super.key});

  @override
  State<SpaceBackGround> createState() => _SpaceBackGroundState();
}

class _SpaceBackGroundState extends State<SpaceBackGround>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Adjust the duration as needed
    );

    // Create a curved animation for a more interesting movement
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    // Repeating the animation
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1d3b79),
      // child: CustomPaint(
      //   painter: SpacePainter(_animation),
      // ),
    );
  }
}

class SpacePainter extends CustomPainter {
  final Animation<double> animation;

  SpacePainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
