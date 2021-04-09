import 'package:flutter/material.dart';

class CustomShapeClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, size.height / 1.0);
    var firstControlPoint = new Offset(size.width / 4, size.height / 2.20);    ///for control curve(roundness)
    var firstEndPoint = new Offset(size.width / 2, size.height / 1 - 80);
    var secondControlPoint =
    new Offset(size.width - (size.width / 6), size.height / 0.90 - 80);       ///for control curve(roundness)
    var secondEndPoint = new Offset(size.width, size.height / 2 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper)
  {
    return true;
  }
}