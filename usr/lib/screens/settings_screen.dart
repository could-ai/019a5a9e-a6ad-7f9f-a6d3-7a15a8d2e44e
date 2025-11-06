import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'English';
  double _defaultFontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

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
      body: ListView(
        children: [
          // Theme Section
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'APPEARANCE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFDAA520),
                letterSpacing: 1.5,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: SwitchListTile(
              title: const Text(
                'Dark Mode',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: const Text(
                'Switch between light and dark themes',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              value: themeProvider.isDarkMode,
              activeColor: const Color(0xFFDAA520),
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
              secondary: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: const Color(0xFFDAA520),
              ),
            ),
          ),

          // Font Size Section
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'TYPOGRAPHY',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFDAA520),
                letterSpacing: 1.5,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Default Font Size',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${_defaultFontSize.toInt()}',
                        style: const TextStyle(
                          color: Color(0xFFDAA520),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Slider(
                    value: _defaultFontSize,
                    min: 12.0,
                    max: 28.0,
                    divisions: 8,
                    activeColor: const Color(0xFFDAA520),
                    label: _defaultFontSize.toInt().toString(),
                    onChanged: (value) {
                      setState(() {
                        _defaultFontSize = value;
                      });
                      themeProvider.setDefaultFontSize(value);
                    },
                  ),
                  Text(
                    'Preview: The Lord is my shepherd',
                    style: TextStyle(
                      fontSize: _defaultFontSize,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Language Section
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'LANGUAGE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFDAA520),
                letterSpacing: 1.5,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                RadioListTile<String>(
                  title: const Text('English'),
                  value: 'English',
                  groupValue: _selectedLanguage,
                  activeColor: const Color(0xFFDAA520),
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Português'),
                  value: 'Portuguese',
                  groupValue: _selectedLanguage,
                  activeColor: const Color(0xFFDAA520),
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Tchokwe'),
                  value: 'Tchokwe',
                  groupValue: _selectedLanguage,
                  activeColor: const Color(0xFFDAA520),
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
              ],
            ),
          ),

          // About Section
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              'ABOUT',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFDAA520),
                letterSpacing: 1.5,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
