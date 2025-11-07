import 'package:flutter/material.dart';
import '../models/hymn.dart';

class HymnProvider extends ChangeNotifier {
  final List<Hymn> _hymns = [
    Hymn(
      id: '1',
      number: 1,
      title: 'Santo, Santo, Santo',
      lyrics: 'Santo, Santo, Santo! Senhor Deus Todo-Poderoso!\nDe manhã cedo cantaremos Teu louvor\nSanto, Santo, Santo! Misericordioso e Poderoso\nDeus em três pessoas, bendita Trindade!',
      theme: 'Worship',
    ),
    Hymn(
      id: '2',
      number: 2,
      title: 'Graça Maravilhosa',
      lyrics: 'Graça maravilhosa de nosso amante Deus\nGraça que excede nossos pecados e culpa\nAí onde abundou o pecado\nSuperabundou a graça de Deus',
      theme: 'Hope',
    ),
    Hymn(
      id: '3',
      number: 3,
      title: 'Quão Firme Alicerce',
      lyrics: 'Quão firme alicerce, ó santos do Senhor\nEstá em Sua excelsa Palavra de amor!\nQue mais Ele pode do que já vos tem dito\nA vós que buscais em Jesus o auxílio?',
      theme: 'Faith',
    ),
    Hymn(
      id: '4',
      number: 4,
      title: 'Oh! Que Amigo é Cristo',
      lyrics: 'Oh! Que amigo é Cristo!\nPois nossos pecados levou\nE nos manda que levemos\nOs cuidados ao Senhor\nFalta ao coração paz e gozo?\nÉ porque não vamos a Jesus\nTudo quanto nos perturba\nLevemos a Ele na cruz',
      theme: 'Love',
    ),
    Hymn(
      id: '5',
      number: 5,
      title: 'Vencendo Vem Jesus',
      lyrics: 'Vencendo vem Jesus, Anunciando paz\nEis os porta-estandartes, Os sinais da cruz trazem\nCoros triunfantes, Hinos entoai\nGlória e honra daí ao Rei dos reis',
      theme: 'Christ',
    ),
  ];

  final Set<String> _favoriteIds = {};

  List<Hymn> get hymns => _hymns;
  List<Hymn> get favoriteHymns =>
      _hymns.where((hymn) => _favoriteIds.contains(hymn.id)).toList();

  bool isFavorite(String hymnId) => _favoriteIds.contains(hymnId);

  void toggleFavorite(String hymnId) {
    if (_favoriteIds.contains(hymnId)) {
      _favoriteIds.remove(hymnId);
    } else {
      _favoriteIds.add(hymnId);
    }
    notifyListeners();
  }

  void reorderFavorites(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final favorites = favoriteHymns;
    final hymn = favorites.removeAt(oldIndex);
    favorites.insert(newIndex, hymn);
    notifyListeners();
  }

  List<Hymn> getFilteredHymns({String? searchQuery, String? theme}) {
    var filteredHymns = _hymns;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      filteredHymns = filteredHymns.where((hymn) {
        return hymn.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            hymn.number.toString().contains(searchQuery);
      }).toList();
    }

    if (theme != null) {
      filteredHymns =
          filteredHymns.where((hymn) => hymn.theme == theme).toList();
    }

    return filteredHymns;
  }

  void addHymn(Hymn hymn) {
    _hymns.add(hymn);
    _hymns.sort((a, b) => a.number.compareTo(b.number));
    notifyListeners();
  }
}
