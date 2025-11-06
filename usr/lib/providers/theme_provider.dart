import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  double _defaultFontSize = 16.0;

  bool get isDarkMode => _isDarkMode;
  double get defaultFontSize => _defaultFontSize;

  ThemeData get currentTheme {
    if (_isDarkMode) {
      return ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFDAA520),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 0,
        ),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFDAA520),
          secondary: const Color(0xFFDAA520),
        ),
        cardTheme: CardTheme(
          color: Colors.grey[850],
          elevation: 2,
        ),
      );
    } else {
      return ThemeData.light().copyWith(
        primaryColor: const Color(0xFFDAA520),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFDAA520),
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFDAA520),
          secondary: Color(0xFFDAA520),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 2,
        ),
      );
    }
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setDefaultFontSize(double fontSize) {
    _defaultFontSize = fontSize;
    notifyListeners();
  }
}
