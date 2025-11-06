import 'package:flutter/material.dart';
import '../widgets/animated_musical_notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFFF9E6), // Soft light yellow
              const Color(0xFFFFF4D6), // Light golden
              const Color(0xFFFFE5B4), // Warm golden
            ],
          ),
        ),
        child: Stack(
          children: [
            // Animated musical notes background
            const AnimatedMusicalNotes(),
            
            // Main content
            SafeArea(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    
                    // Logo and Title
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Column(
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
                    
                    const Spacer(flex: 2),
                    
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
                    
                    const Spacer(flex: 1),
                    
                    // Subtle tagline
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
