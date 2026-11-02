import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const String _keyAppBarColor = 'app_bar_color';

  // Default color matches screenshot (Slate grey #2C3E50)
  static const int defaultColorValue = 0xFF2C3E50;

  static Future<Color> getAppBarColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt(_keyAppBarColor) ?? defaultColorValue;
    return Color(colorValue);
  }

  static Future<void> saveAppBarColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyAppBarColor, color.toARGB32());
  }
}
