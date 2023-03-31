import 'package:flutter/material.dart';

class DashDivider extends StatelessWidget {
  final double dashWidth;
  final double dashGap;
  final double thickness;
  final Color color;

  const DashDivider(
      {super.key,
      required this.dashWidth,
      required this.dashGap,
      required this.thickness,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedLinePainter(dashWidth, dashGap, thickness, color),
      child: SizedBox(
        width: double.infinity,
        height: thickness,
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashGap;
  final double strokeWidth;
  final Color strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashGap;
    }
  }

  _DashedLinePainter(
    this.dashWidth,
    this.dashGap,
    this.strokeWidth,
    this.strokeColor,
  );

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
