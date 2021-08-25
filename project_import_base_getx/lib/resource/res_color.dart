import 'package:flutter/material.dart';

class ResColors {
  static var primaryColor = HexColor('#0012B6');
  static var primaryTextColor = HexColor('#1E272E');
  static var tabActiveColor = HexColor('#CE863A');
  static var tabInActiveColor = HexColor('#000000');
  static var inputGrayColor = HexColor('#707070');
  static var successColor = HexColor('#28A745');
  static var errorColor = HexColor('#F44336');
  static var backgroundColor = HexColor('#F6F4F5');
  static var colorStartAdvise = HexColor('#08B5AA');
  static var colorTextService = HexColor('#2C3137');
  static var colorTextAllService = HexColor('#08B5AA');
  static var colorButtonNetHub = HexColor('#E5141B');
  static var colorContentService = HexColor('#737377');
  static var bgTeal = HexColor('#23C9BF');
  static var bgGreen = HexColor('#2CA94C');
  static var bgYellow = HexColor('#D9BD2B');
}

// Parse hex to color.
class HexColor extends Color {
  static int _getColorFromHex(hexColor) {
    hexColor ??= '#FFFFFF';
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(value) : super(_getColorFromHex(value));
}
