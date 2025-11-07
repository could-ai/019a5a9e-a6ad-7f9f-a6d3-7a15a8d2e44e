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
                    _isReading ? Icons.stop_circle_outlined : Icons.play_circle_outline,
                  ),
                  color: const Color(0xFFDAA520),
                  onPressed: () {
                    setState(() {
                      _isReading = !_isReading;
                    });
                    // TODO: Implement text-to-speech
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(_isReading ? 'Reading started' : 'Reading stopped'),
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