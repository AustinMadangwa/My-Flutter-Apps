import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconLine extends BoxPainter{
  final double iconSize;
  final bool firstData;
  final bool lastData;
  final Paint paintLine;
  IconLine({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
  }): this.iconSize = iconSize,
        this.firstData = firstData,
        this.lastData = lastData,
        paintLine = Paint()
          ..color = Colors.red
          ..strokeCap = StrokeCap.round
          ..strokeWidth = lineWidth
          ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final leftOffset = Offset(ScreenUtil().setWidth((iconSize/2)+ 24),ScreenUtil().setWidth(offset.dy));
    final double iconSpace = iconSize/ 1.5;
    final Offset top = configuration.size.topLeft(Offset(ScreenUtil().setWidth(leftOffset.dx),ScreenUtil().setWidth(0.0)));
    final Offset centerTop = configuration.size.centerLeft(Offset(ScreenUtil().setWidth(leftOffset.dx),ScreenUtil().setWidth(leftOffset.dy-iconSpace)));
    final Offset end = configuration.size.bottomLeft(Offset(ScreenUtil().setWidth(leftOffset.dx),ScreenUtil().setWidth(leftOffset.dy * 2)));
    final Offset centerBottom = configuration.size.centerLeft(Offset(ScreenUtil().setWidth(leftOffset.dx),ScreenUtil().setWidth(leftOffset.dy + iconSpace)));
    if(!firstData) canvas.drawLine(top, centerTop, paintLine);
    if(!lastData) canvas.drawLine(centerBottom, end, paintLine);
  }
}

class CustomIconDecoration extends Decoration{
  final double iconSize;
  final double lineWidth;
  final bool firstData;
  final bool lastData;
  CustomIconDecoration({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
  }): this.iconSize = iconSize,
        this.lineWidth = lineWidth,
        this.firstData = firstData,
        this.lastData = lastData;
  @override
  BoxPainter createBoxPainter([onChanged]) {
    return IconLine(
        iconSize: iconSize,
        lineWidth: lineWidth,
        firstData: firstData,
        lastData: lastData
    );
  }
}


