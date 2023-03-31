import 'package:flutter/material.dart';

class GradientLinearProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final double value;
  final Color backgroundColor;
  final Color strokeColor;
  final double strokeWidth;
  final LinearGradient gradient;

  const GradientLinearProgressBar({
    Key? key,
    required this.value,
    required this.gradient,
    this.width = double.infinity,
    this.height = 25,
    this.backgroundColor = Colors.blueGrey,
    this.strokeColor = Colors.transparent,
    this.strokeWidth = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: _GradientLinearProgressPainter(
            value: value,
            backgroundColor: backgroundColor,
            gradient: gradient,
            strokeColor: strokeColor,
            strokeWidth: strokeWidth,
          ),
        ),
      ),
    );
  }
}

class _GradientLinearProgressPainter extends CustomPainter {
  final double value;
  final Color backgroundColor;
  final Color strokeColor;
  final double strokeWidth;
  final LinearGradient gradient;

  final Paint _bgPaint = Paint();
  final Paint _progressPaint = Paint();

  _GradientLinearProgressPainter({
    required this.value,
    required this.gradient,
    required this.backgroundColor,
    required this.strokeColor,
    required this.strokeWidth,
  }) {
    _bgPaint.isAntiAlias = true;
    _bgPaint.strokeCap = StrokeCap.round;
    _bgPaint.strokeWidth = strokeWidth;

    _progressPaint.isAntiAlias = true;
    _progressPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _progressPaint.shader = gradient.createShader(
      Rect.fromLTWH(0, 0, size.width * value, size.height),
    );

    var rrect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      Radius.circular(size.height / 2),
    );

    _bgPaint.color = backgroundColor;
    _bgPaint.style = PaintingStyle.fill;
    canvas.drawRRect(rrect, _bgPaint);

    canvas.drawRRect(
      RRect.fromLTRBR(
        0,
        0,
        size.width * value,
        size.height,
        Radius.circular(size.height / 2),
      ),
      _progressPaint,
    );

    _bgPaint.color = strokeColor;
    _bgPaint.style = PaintingStyle.stroke;
    canvas.drawRRect(rrect, _bgPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
