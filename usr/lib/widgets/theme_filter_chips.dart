import 'package:flutter/material.dart';

class ThemeFilterChips extends StatelessWidget {
  final String? selectedTheme;
  final Function(String) onThemeSelected;

  const ThemeFilterChips({
    super.key,
    required this.selectedTheme,
    required this.onThemeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final themes = ['Worship', 'Hope', 'Faith', 'Love', 'Christ'];

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: themes.length,
        itemBuilder: (context, index) {
          final theme = themes[index];
          final isSelected = selectedTheme == theme;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilterChip(
              label: Text(
                theme,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF8B6914),
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                onThemeSelected(theme);
              },
              backgroundColor: const Color(0xFFDAA520).withOpacity(0.1),
              selectedColor: const Color(0xFFDAA520),
              checkmarkColor: Colors.white,
              elevation: isSelected ? 4 : 0,
              shadowColor: isSelected
                  ? const Color(0xFFDAA520).withOpacity(0.3)
                  : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        },
      ),
    );
  }
}
