import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/hymn_list_screen.dart';
import 'screens/hymn_reading_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/settings_screen.dart';
import 'providers/theme_provider.dart';
import 'providers/hymn_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => HymnProvider()),
      ],
      child: const TchokweHymnalApp(),
    ),
  );
}

class TchokweHymnalApp extends StatelessWidget {
  const TchokweHymnalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Tchokwe Adventist Hymnal',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/hymn-list': (context) => const HymnListScreen(),
            '/favorites': (context) => const FavoritesScreen(),
            '/settings': (context) => const SettingsScreen(),
          },
        );
      },
    );
  }
}
