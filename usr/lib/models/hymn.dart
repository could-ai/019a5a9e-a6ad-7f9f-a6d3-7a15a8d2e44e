class Hymn {
  final String id;
  final int number;
  final String title;
  final String lyrics;
  final String theme;

  Hymn({
    required this.id,
    required this.number,
    required this.title,
    required this.lyrics,
    required this.theme,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'title': title,
      'lyrics': lyrics,
      'theme': theme,
    };
  }

  factory Hymn.fromJson(Map<String, dynamic> json) {
    return Hymn(
      id: json['id'],
      number: json['number'],
      title: json['title'],
      lyrics: json['lyrics'],
      theme: json['theme'],
    );
  }
}
