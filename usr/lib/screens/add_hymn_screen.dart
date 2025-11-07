import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/hymn_provider.dart';
import '../models/hymn.dart';

class AddHymnScreen extends StatefulWidget {
  const AddHymnScreen({super.key});

  @override
  State<AddHymnScreen> createState() => _AddHymnScreenState();
}

class _AddHymnScreenState extends State<AddHymnScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _titleController = TextEditingController();
  final _lyricsController = TextEditingController();
  final _themeController = TextEditingController();
  String _selectedTheme = 'Worship';

  final List<String> _themes = ['Worship', 'Hope', 'Faith', 'Love', 'Christ'];

  @override
  void dispose() {
    _numberController.dispose();
    _titleController.dispose();
    _lyricsController.dispose();
    _themeController.dispose();
    super.dispose();
  }

  void _saveHymn() {
    if (_formKey.currentState!.validate()) {
      final hymnProvider = Provider.of<HymnProvider>(context, listen: false);
      final hymn = Hymn(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        number: int.parse(_numberController.text),
        title: _titleController.text,
        lyrics: _lyricsController.text,
        theme: _selectedTheme,
      );
      hymnProvider.addHymn(hymn);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hymn added successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFDAA520),
        title: const Text(
          'Add New Hymn',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _saveHymn,
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFFF9E6),
              const Color(0xFFFFF4D6),
            ],
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                // Hymn Number
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFDAA520).withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _numberController,
                    decoration: InputDecoration(
                      labelText: 'Hymn Number',
                      labelStyle: TextStyle(
                        color: const Color(0xFF8B6914).withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(
                        Icons.tag,
                        color: const Color(0xFFDAA520),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a hymn number';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Hymn Title
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFDAA520).withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Hymn Title',
                      labelStyle: TextStyle(
                        color: const Color(0xFF8B6914).withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(
                        Icons.music_note,
                        color: const Color(0xFFDAA520),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a hymn title';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Theme Selection
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFDAA520).withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedTheme,
                    decoration: InputDecoration(
                      labelText: 'Theme',
                      labelStyle: TextStyle(
                        color: const Color(0xFF8B6914).withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(
                        Icons.category,
                        color: const Color(0xFFDAA520),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                    items: _themes.map((theme) {
                      return DropdownMenuItem(
                        value: theme,
                        child: Text(theme),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedTheme = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Hymn Lyrics
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFDAA520).withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _lyricsController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      labelText: 'Hymn Lyrics',
                      labelStyle: TextStyle(
                        color: const Color(0xFF8B6914).withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                      ),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter hymn lyrics';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
