import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedMusicalNotes extends StatefulWidget {
  const AnimatedMusicalNotes({super.key});

  @override
  State<AnimatedMusicalNotes> createState() => _AnimatedMusicalNotesState();
}

class _AnimatedMusicalNotesState extends State<AnimatedMusicalNotes>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  final int noteCount = 8;
  late List<Offset> _positions;
  late List<IconData> _noteIcons;

  @override
  void initState() {
    super.initState();
    _controllers = [];
    _animations = [];
    _positions = [];
    _noteIcons = [];

    final random = Random();
    final icons = [
      Icons.music_note,
      Icons.music_note_outlined,
    ];

    for (int i = 0; i < noteCount; i++) {
      // Random positions
      _positions.add(
        Offset(
          random.nextDouble(),
          random.nextDouble(),
        ),
      );

      // Random icons
      _noteIcons.add(icons[random.nextInt(icons.length)]);

      // Create animation controller with random duration
      final controller = AnimationController(
        duration: Duration(
          milliseconds: 3000 + random.nextInt(3000),
        ),
        vsync: this,
      );

      final animation = Tween<double>(
        begin: 0.2,
        end: 0.6,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );

      _controllers.add(controller);
      _animations.add(animation);

      controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: List.generate(noteCount, (index) {
            return AnimatedBuilder(
              animation: _animations[index],
              builder: (context, child) {
                return Positioned(
                  left: _positions[index].dx * constraints.maxWidth,
                  top: _positions[index].dy * constraints.maxHeight,
                  child: Opacity(
                    opacity: _animations[index].value,
                    child: Icon(
                      _noteIcons[index],
                      size: 40,
                      color: const Color(0xFFDAA520).withOpacity(0.15),
                    ),
                  ),
                );
              },
            );
          }),
        );
      },
    );
  }
}
