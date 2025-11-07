            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              
              // Logo and Title
              ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo container with elegant styling
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFDAA520).withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.menu_book_rounded,
                          size: 60,
                          color: const Color(0xFFDAA520), // Goldenrod
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    // App Title
                    const Text(
                      'Tchokwe',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF8B6914),
                        letterSpacing: 3,
                        height: 1.2,
                      ),
                    ),
                    const Text(
                      'Adventist Hymnal',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF8B6914),
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(flex: 1),
              
              // Enter Button
              ScaleTransition(
                scale: _scaleAnimation,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hymn-list');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDAA520),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                    shadowColor: const Color(0xFFDAA520).withOpacity(0.5),
                  ),
                  child: const Text(
                    'Enter Hymnal',
                    style: TextStyle(
                      fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              
              const Spacer(flex: 1),
              
              // Subtle tagline
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Faith • Culture • Technology',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF8B6914).withOpacity(0.6),
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],