import 'package:flutter/material.dart';
import 'dart:math' as math;

class ShootingStare extends StatefulWidget {
  const ShootingStare({Key? key}) : super(key: key);

  @override
  State<ShootingStare> createState() => _ShootingStareState();
}

class _ShootingStareState extends State<ShootingStare>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 100,
      width: 50,
      child: CustomPaint(
        painter: ShootingStarPaint(
          animation: _animation,
        ),
      ),
    );
  }
}

class ShootingStarPaint extends CustomPainter {
  final Animation animation;

  ShootingStarPaint({required this.animation}) : super(repaint: animation);
  @override
  void paint(Canvas canvas, Size size) {
    final bx = size.width / 2;
    final by = size.height;

    final starPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    final starPath = Path();

    // draw the star with 5 points and the animation in the tail ,
    // Calculate the points of the star
    List<Map> starPoints = calcStarPoints(bx, by, 5, 10, 20);

    final x1 = starPoints[0]['x'];
    final y1 = starPoints[0]['y'];

    starPath.moveTo(x1, y1);

    // Draw the star with the calculated points
    for (int i = 0; i < starPoints.length; i++) {
      final x1 = starPoints[i]['x'];
      final y1 = starPoints[i]['y'];

      starPath.lineTo(x1, y1);
    }

    starPath.close();
    canvas.drawPath(starPath, starPaint);

    //todo : animation in the tail
    final tailPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [
          Colors.blue.withOpacity(0.6),
          Colors.white,
          Colors.blue.withOpacity(0.6)
        ],
        stops: [0.0, animation.value, 1.0],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter, // Vertical gradient
      ).createShader(Rect.fromPoints(
        Offset(size.width / 2.5, 0),
        Offset(size.width / 4, size.height - 8),
      ));

    final tailPath = Path();

    final p2 = Offset(size.width / 2.5, 0);
    final p3 = Offset(2 * size.width / 3, 0);

    final p1 = Offset(size.width / 4, size.height - 8);
    final p4 = Offset(size.width * 3 / 4, size.height - 8);

    tailPath.moveTo(p1.dx, p1.dy);
    tailPath.lineTo(p2.dx, p2.dy);
    tailPath.lineTo(p3.dx, p3.dy);
    tailPath.lineTo(p4.dx, p4.dy);
    tailPath.close();
    canvas.drawPath(tailPath, tailPaint);
  }

  // use this function to calculate the points of the star
  List<Map> calcStarPoints(
      centerX, centerY, innerCirclePoints, innerRadius, outerRadius) {
    final angle = ((math.pi) / innerCirclePoints);
    var angleOffsetToCenterStar = 0;

    var totalPoints = innerCirclePoints * 2;
    List<Map> points = [];
    for (int i = 0; i < totalPoints; i++) {
      bool isEvenIndex = i % 2 == 0;
      var r = isEvenIndex ? outerRadius : innerRadius;

      var currY =
          centerY + math.cos(i * angle + angleOffsetToCenterStar - 0.6) * r;
      var currX =
          centerX + math.sin(i * angle + angleOffsetToCenterStar - 0.6) * r;
      points.add({'x': currX, 'y': currY});
    }
    return points;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
