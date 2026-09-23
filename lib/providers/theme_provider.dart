import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeType _themeType = ThemeType.normal;

  ThemeType get themeType => _themeType;
  ThemeData get themeData => AppThemes.getTheme(_themeType);

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString('theme') ?? 'normal';
    _themeType = ThemeType.values.firstWhere(
      (e) => e.toString().split('.').last == themeName,
      orElse: () => ThemeType.normal,
    );
    notifyListeners();
  }

  Future<void> setTheme(ThemeType theme) async {
    _themeType = theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme.toString().split('.').last);
    notifyListeners();
  }
}