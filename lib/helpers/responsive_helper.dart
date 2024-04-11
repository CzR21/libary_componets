import 'package:flutter/material.dart';

class ResponsivenessHelper {
  static ResponsivenessHelperData of(BuildContext context) => ResponsivenessHelperData(context: context);
}

class ResponsivenessHelperData {
  late final BuildContext _context;

  ResponsivenessHelperData({required BuildContext context}) {
    _context = context;
  }

  double lineHeightOf(TextStyle textStyle, {bool floor = false}) {
    final lineHeight = textStyle.fontSize! * textStyle.height! * MediaQuery.of(_context).textScaleFactor;
    if (floor) {
      return lineHeight.floorToDouble();
    }
    return lineHeight.ceilToDouble();
  }

  double textWidthOf(String text, { TextStyle? style }) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textScaleFactor: MediaQuery.textScaleFactorOf(_context),
      textDirection: Directionality.of(_context),
    );

    painter.layout();

    return painter.width;
  }
}
