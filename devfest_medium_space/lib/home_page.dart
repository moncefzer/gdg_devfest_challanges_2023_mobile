import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'constants/assets.dart';

class ShaderHomePage extends StatefulWidget {
  const ShaderHomePage({super.key});

  @override
  State<ShaderHomePage> createState() => _ShaderHomePageState();
}

class _ShaderHomePageState extends State<ShaderHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late Timer timer;
  double delta = 0;
  FragmentShader? shader;
  FragmentShader? shader2;

  void loadMyShader() async {
    var program = await FragmentProgram.fromAsset(Assets.shadersSpace);
    shader = program.fragmentShader();
    // setState(() {});

    program = await FragmentProgram.fromAsset(Assets.shadersAnotherspace);
    shader2 = program.fragmentShader();
    setState(() {});

    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        delta += 1 / 60;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadMyShader();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (shader == null || shader2 == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: MyPainter(
                shader: shader!,
                time: delta,
                shader2: shader2!,
              ),
            ),
          ),
          // custome painter for logo
          Positioned(
            child: SizedBox(
              width: 75,
              height: 30,
              child: CustomPaint(
                painter: LogoPainter(animation: _animation),
              ),
            ),
          ),
        ],
      );
    }
  }
}

class MyPainter extends CustomPainter {
  MyPainter({required this.shader, required this.time, required this.shader2});

  final FragmentShader shader;
  final FragmentShader shader2;

  final double time;

  @override
  void paint(Canvas canvas, Size size) {
    // Pass the mouse position to the shader.
    final paint = Paint();
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    // shader.setFloat(3, mousePosition.dx);
    // shader.setFloat(4, mousePosition.dy);
    paint.shader = shader;
    canvas.drawRect(Offset.zero & size, paint);

    // render an other shader
    // final paint2 = Paint();
    // shader2.setFloat(0, size.width);
    // shader2.setFloat(1, size.height);
    // shader2.setFloat(2, time);
    // paint.shader = shader2;
    // canvas.drawRect(Offset.zero & size, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class LogoPainter extends CustomPainter {
  LogoPainter({required this.animation}) : super(repaint: animation);

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final isYellowVisible = animation.value > 0.05;
    final isGreenVisible = animation.value > 0.25;
    final isRedVisible = animation.value > 0.5;
    final isBleuVisible = animation.value > 0.75;

    final yellowPainter = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final delta = size.width / 7;

    final py1 = Offset(size.width / 2 + delta, size.height);
    final py2 = Offset(size.width, size.height / 2);

    if (isYellowVisible) canvas.drawLine(py1, py2, yellowPainter);

    final greenPainter = Paint()
      ..color = Colors.green
      ..strokeWidth = 11
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    final pg1 = Offset(size.width, size.height / 2);
    final pg2 = Offset(size.width / 2 + delta, 0);

    if (isGreenVisible) canvas.drawLine(pg1, pg2, greenPainter);

    final redPainter = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    final pr1 = Offset(size.width / 2 - delta, 0);
    final pr2 = Offset(0, size.height / 2);

    if (isRedVisible) canvas.drawLine(pr1, pr2, redPainter);

    final bluePainter = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    final pb1 = Offset(0, size.height / 2);
    final pb2 = Offset(size.width / 2 - delta, size.height);

    if (isBleuVisible) canvas.drawLine(pb1, pb2, bluePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
