import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WaveClip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: WaveClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFFF0156),
                    Color(0xFFF33F7B),
                  ],
                ),
              ),
              height: 150,
            ),
          ),
        ),

        ClipPath(
          clipper: WaveClipper(),
          child: Container(
              padding: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFEE2E58),
                    Color(0xFFFF0055),
                  ],
                ),
              ),
              height: 130,
              alignment: Alignment.center,
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )),
        ),
      ],
    ));
  }
}


class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height);

    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
