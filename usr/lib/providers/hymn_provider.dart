  void addHymn(Hymn hymn) {
    _hymns.add(hymn);
    _hymns.sort((a, b) => a.number.compareTo(b.number));
    notifyListeners();
  }