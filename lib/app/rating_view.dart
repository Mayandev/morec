import 'package:flutter/widgets.dart';
import 'dart:math' as Math;

const double kMaxRate = 5.0;
const int kNumberOfStarts = 5;
const double kSpacing = 3.0;
const double kSize = 50.0;

class StaticRatingBar extends StatelessWidget {
  /// number of stars
  final int count;

  /// init rate
  final double rate;

  /// size of the starts
  final double size;

  final Color colorLight;

  final Color colorDark;

  StaticRatingBar({
    double rate,
    Color colorLight,
    Color colorDark,
    int count,
    this.size: kSize,
  })  : rate = rate ?? kMaxRate,
        count = count ?? kNumberOfStarts,
        colorDark = colorDark ?? new Color(0xffd5d5d5),
        colorLight = colorLight ?? new Color(0xffFF962E);

  Widget buildStar() {
    return new SizedBox(
        width: size * count,
        height: size,
        child: new CustomPaint(
          painter: new _PainterStars(
              size: this.size / 2,
              color: colorLight,
              style: PaintingStyle.fill,
              strokeWidth: 0.0),
        ));
  }

  Widget buildHollowStar() {
    return new SizedBox(
        width: size * count,
        height: size,
        child: new CustomPaint(
          painter: new _PainterStars(
              size: this.size / 2,
              color: colorDark,
              style: PaintingStyle.fill,
              strokeWidth: 0.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        buildHollowStar(),
        new ClipRect(
          clipper: new _RatingBarClipper(width: rate * size),
          child: buildStar(),
        )
      ],
    );
  }
}

class _RatingBarClipper extends CustomClipper<Rect> {
  final double width;

  _RatingBarClipper({this.width}) : assert(width != null);

  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0.0, 0.0, width, size.height);
  }

  @override
  bool shouldReclip(_RatingBarClipper oldClipper) {
    return width != oldClipper.width;
  }
}



class _PainterStars extends CustomPainter {
  final double size;
  final Color color;
  final PaintingStyle style;
  final double strokeWidth;

  _PainterStars({this.size, this.color, this.strokeWidth, this.style});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (Math.pi * degree / 180);
  }

  Path createStarPath(double radius, Path path) {
    double radian = degree2Radian(36); // 36为五角星的角度
    double radiusIn = (radius * Math.sin(radian / 2) / Math.cos(radian)) *
        1.1; // 中间五边形的半径,太正不是很好看，扩大一点点

    path.moveTo((radius * Math.cos(radian / 2)), 0.0); // 此点为多边形的起点
    path.lineTo((radius * Math.cos(radian / 2) + radiusIn * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) * 2),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo(
        (radius * Math.cos(radian / 2) + radiusIn * Math.cos(radian / 2)),
        (radius + radiusIn * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radius * Math.sin(radian)),
        (radius + radius * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2)), (radius + radiusIn));
    path.lineTo((radius * Math.cos(radian / 2) - radius * Math.sin(radian)),
        (radius + radius * Math.cos(radian)));
    path.lineTo(
        (radius * Math.cos(radian / 2) - radiusIn * Math.cos(radian / 2)),
        (radius + radiusIn * Math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) - radiusIn * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));

    path.lineTo((radius * Math.cos(radian / 2)), 0.0);
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    //   paint.color = Colors.redAccent;
    paint.strokeWidth = strokeWidth;
    paint.color = color;
    paint.style = style;

    Path path = new Path();

    double offset = strokeWidth > 0 ? strokeWidth + 2 : 0.0;

    path = createStarPath(this.size - offset, path);
    path = path.shift(new Offset(this.size * 2, 0.0));
    path = createStarPath(this.size - offset, path);
    path = path.shift(new Offset(this.size * 2, 0.0));
    path = createStarPath(this.size - offset, path);
    path = path.shift(new Offset(this.size * 2, 0.0));
    path = createStarPath(this.size - offset, path);
    path = path.shift(new Offset(this.size * 2, 0.0));
    path = createStarPath(this.size - offset, path);

    if (offset > 0) {
      path = path.shift(new Offset(offset, offset));
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_PainterStars oldDelegate) {
    return oldDelegate.size != this.size;
  }
}