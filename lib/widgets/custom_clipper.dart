import 'dart:math';

import 'package:flutter/material.dart';

enum ClipType { bottom, semiCircle, halfCircle, multiple }

class MyCustomClipper extends CustomClipper<Path> {
  final ClipType clipType;

  MyCustomClipper({required this.clipType});

  @override
  Path getClip(Size size) {
    final path = Path();
    switch (clipType) {
      case ClipType.bottom:
        createBottom(size, path);
        break;
      case ClipType.semiCircle:
        createSemiCircle(size, path);
        break;
      case ClipType.halfCircle:
        createHalfCircle(size, path);
        break;
      case ClipType.multiple:
        createMultiple(size, path);
        break;
    }
    path.close();
    return path;
  }

  void createSemiCircle(Size size, Path path) {
    path.lineTo(size.width / 1.40, 0);

    final firstControlPoint = Offset(size.width / 1.30, size.height / 2.5);
    final firstEndPoint = Offset(size.width / 1.85, size.height / 1.85);

    final secondControlPoint = Offset(size.width / 4, size.height / 1.45);
    final secondEndPoint = Offset(0, size.height / 1.75);

    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(0, size.height / 1.75);
  }

  void createBottom(Size size, Path path) {
    path.lineTo(0, size.height / 1.19);
    final secondControlPoint = Offset(size.width / 2, size.height);
    final secondEndPoint = Offset(size.width, size.height / 1.19);

    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
  }

  void createHalfCircle(Size size, Path path) {
    path.lineTo(size.width / 2, 0);
    final firstControlPoint = Offset(size.width / 1.10, size.height / 2);
    final firstEndPoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(0, size.height);
  }

  void createMultiple(Size size, Path path) {
    path.lineTo(0, size.height);

    double curXPos = 0.0;
    double curYPos = size.height;
    final rnd = Random();

    final increment = size.width / 40;
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - rnd.nextInt(50) : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
