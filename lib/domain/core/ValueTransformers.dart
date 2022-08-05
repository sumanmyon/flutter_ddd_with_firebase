import 'dart:ui';

class ValueTransformers {
  static Color makeColorOpaque(Color color) {
    return color.withOpacity(1);
  }
}
