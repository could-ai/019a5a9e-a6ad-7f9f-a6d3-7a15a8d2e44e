import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/hymn.dart';
import '../providers/hymn_provider.dart';
import '../providers/theme_provider.dart';

class HymnReadingScreen extends StatefulWidget {
  final Hymn hymn;

  const HymnReadingScreen({super.key, required this.hymn});

  @override
  State<HymnReadingScreen> createState() => _HymnReadingScreenState();
}

class _HymnReadingScreenState extends State<HymnReadingScreen> {
  double _fontSize = 16.0;
  bool _isReading = false;

  @override
  Widget build(BuildContext context) {
    final hymnProvider = Provider.of<HymnProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isFavorite = hymnProvider.isFavorite(widget.hymn.id);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFDAA520),
        title: Text(
          'Hymn ${widget.hymn.number}',
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              hymnProvider.toggleFavorite(widget.hymn.id);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDarkMode
                ? [Colors.grey[900]!, Colors.grey[850]!]
                : [const Color(0xFFFFF9E6), const Color(0xFFFFF4D6)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hymn Title
              Text(
                widget.hymn.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF8B6914),
                  letterSpacing: 1,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 8),

              // Theme Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFDAA520).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.hymn.theme,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8B6914),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Hymn Lyrics
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[800] : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  widget.hymn.lyrics,
                  style: TextStyle(
                    fontSize: _fontSize,
                    height: 1.8,
                    letterSpacing: 0.3,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[850] : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Font Size Controls
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.text_decrease),
                      color: const Color(0xFFDAA520),
                      onPressed: () {
                        setState(() {
                          if (_fontSize > 12) _fontSize -= 2;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.text_increase),
                      color: const Color(0xFFDAA520),
                      onPressed: () {
                        setState(() {
                          if (_fontSize < 28) _fontSize += 2;
                        });
                      },
                    ),
                  ],
                ),

                // Dark Mode Toggle
                IconButton(
                  icon: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  ),
                  color: const Color(0xFFDAA520),
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                ),

                // Text-to-Speech
                IconButton(
                  icon: Icon(
                    _isReading
                        ? Icons.stop_circle_outlined
                        : Icons.play_circle_outline,
                  ),
                  color: const Color(0xFFDAA520),
                  onPressed: () {
                    setState(() {
                      _isReading = !_isReading;
                    });
                    // TODO: Implement text-to-speech
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            _isReading ? 'Reading started' : 'Reading stopped'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),

                // Share Button
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  color: const Color(0xFFDAA520),
                  onPressed: () {
                    Share.share(
                      'Hymn ${widget.hymn.number}: ${widget.hymn.title}\n\n${widget.hymn.lyrics}\n\nShared from Tchokwe Adventist Hymnal',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
