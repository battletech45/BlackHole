import 'package:flutter/material.dart';

class CircleTransitionClipper extends CustomClipper<Path> {
  CircleTransitionClipper({
    required this.center,
    required this.radius,
  });

  final Offset center;
  final double radius;

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(
        Rect.fromCircle(center: center, radius: radius),
      );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
