import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFDAA520),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Appearance Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Appearance',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8B6914),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      subtitle: const Text('Switch between light and dark theme'),
                      value: themeProvider.isDarkMode,
                      activeColor: const Color(0xFFDAA520),
                      secondary: Icon(
                        themeProvider.isDarkMode
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        color: const Color(0xFFDAA520),
                      ),
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.text_fields,
                        color: Color(0xFFDAA520),
                      ),
                      title: const Text('Font Size'),
                      subtitle: Text('Current: ${themeProvider.defaultFontSize.toStringAsFixed(0)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            color: const Color(0xFFDAA520),
                            onPressed: () {
                              if (themeProvider.defaultFontSize > 12) {
                                themeProvider.setDefaultFontSize(
                                    themeProvider.defaultFontSize - 2);
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            color: const Color(0xFFDAA520),
                            onPressed: () {
                              if (themeProvider.defaultFontSize < 24) {
                                themeProvider.setDefaultFontSize(
                                    themeProvider.defaultFontSize + 2);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // About Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8B6914),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.info_outline,
                        color: Color(0xFFDAA520),
                      ),
                      title: const Text('App Version'),
                      subtitle: const Text('1.0.0'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.help_outline,
                        color: Color(0xFFDAA520),
                      ),
                      title: const Text('Help & Support'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.privacy_tip_outlined,
                        color: Color(0xFFDAA520),
                      ),
                      title: const Text('Privacy Policy'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.add_circle_outline,
                        color: Color(0xFFDAA520),
                      ),
                      title: const Text('Add New Hymn'),
                      subtitle: const Text('Create and add custom hymns'),
                      onTap: () {
                        Navigator.pushNamed(context, '/add-hymn');
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
