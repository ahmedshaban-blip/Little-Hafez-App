import 'package:flutter/material.dart';

/// Paints the winding S-curve dashed journey path behind stage islands.
class WindingPathPainter extends CustomPainter {
  const WindingPathPainter({
    required this.outerTrackColor,
    required this.innerDashColor,
  });

  final Color outerTrackColor;
  final Color innerDashColor;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width * 0.5, size.height * 0.92)
      ..cubicTo(
        size.width * 0.15,
        size.height * 0.80,
        size.width * 0.15,
        size.height * 0.65,
        size.width * 0.5,
        size.height * 0.56,
      )
      ..cubicTo(
        size.width * 0.85,
        size.height * 0.48,
        size.width * 0.85,
        size.height * 0.32,
        size.width * 0.5,
        size.height * 0.24,
      )
      ..cubicTo(
        size.width * 0.24,
        size.height * 0.17,
        size.width * 0.32,
        size.height * 0.06,
        size.width * 0.5,
        size.height * 0.02,
      );

    final trackPaint = Paint()
      ..color = outerTrackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, trackPaint);

    final dashPaint = Paint()
      ..color = innerDashColor.withValues(alpha: 0.55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      const dashLength = 14.0;
      const gapLength = 16.0;
      while (distance < metric.length) {
        final next = (distance + dashLength).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), dashPaint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant WindingPathPainter oldDelegate) =>
      outerTrackColor != oldDelegate.outerTrackColor ||
      innerDashColor != oldDelegate.innerDashColor;
}
