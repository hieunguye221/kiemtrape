import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/theme_preferences.dart';

part 'theme_viewmodel.g.dart';

@riverpod
class AppBarColorViewModel extends _$AppBarColorViewModel {
  @override
  Future<Color> build() async {
    return await ThemePreferences.getAppBarColor();
  }

  Future<void> setColor(Color color) async {
    state = AsyncValue.data(color);
    await ThemePreferences.saveAppBarColor(color);
  }
}
