import 'package:flutter/foundation.dart';
import '../models/hymn.dart';

class HymnProvider extends ChangeNotifier {
  final List<Hymn> _hymns = _generateSampleHymns();
  final Set<String> _favoriteIds = {};
  final List<String> _recentlyViewed = [];

  List<Hymn> get allHymns => _hymns;
  List<Hymn> get favoriteHymns {
    return _hymns.where((hymn) => _favoriteIds.contains(hymn.id)).toList();
  }

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
    // Reordering logic can be implemented here if needed
    notifyListeners();
  }

  List<Hymn> getFilteredHymns({String? searchQuery, String? theme}) {
    var filtered = _hymns;

    // Filter by search query
    if (searchQuery != null && searchQuery.isNotEmpty) {
      filtered = filtered.where((hymn) {
        final query = searchQuery.toLowerCase();
        return hymn.number.toString().contains(query) ||
            hymn.title.toLowerCase().contains(query);
      }).toList();
    }

    // Filter by theme
    if (theme != null && theme.isNotEmpty) {
      filtered = filtered.where((hymn) => hymn.theme == theme).toList();
    }

    return filtered;
  }

  void addToRecentlyViewed(String hymnId) {
    _recentlyViewed.remove(hymnId);
    _recentlyViewed.insert(0, hymnId);
    if (_recentlyViewed.length > 20) {
      _recentlyViewed.removeLast();
    }
    notifyListeners();
  }

  List<Hymn> get recentlyViewedHymns {
    return _recentlyViewed
        .map((id) => _hymns.firstWhere((hymn) => hymn.id == id))
        .toList();
  }

  static List<Hymn> _generateSampleHymns() {
    return [
      Hymn(
        id: '1',
        number: 1,
        title: 'Holy, Holy, Holy',
        theme: 'Worship',
        lyrics: '''Holy, holy, holy! Lord God Almighty!
Early in the morning our song shall rise to Thee;
Holy, holy, holy, merciful and mighty!
God in three Persons, blessed Trinity!

Holy, holy, holy! All the saints adore Thee,
Casting down their golden crowns around the glassy sea;
Cherubim and seraphim falling down before Thee,
Which wert, and art, and evermore shalt be.

Holy, holy, holy! Though the darkness hide Thee,
Though the eye of sinful man Thy glory may not see;
Only Thou art holy; there is none beside Thee,
Perfect in power, in love, and purity.

Holy, holy, holy! Lord God Almighty!
All Thy works shall praise Thy Name, in earth, and sky, and sea;
Holy, holy, holy; merciful and mighty!
God in three Persons, blessed Trinity!''',
      ),
      Hymn(
        id: '2',
        number: 2,
        title: 'Amazing Grace',
        theme: 'Hope',
        lyrics: '''Amazing grace! How sweet the sound
That saved a wretch like me!
I once was lost, but now am found;
Was blind, but now I see.

'Twas grace that taught my heart to fear,
And grace my fears relieved;
How precious did that grace appear
The hour I first believed.

Through many dangers, toils and snares,
I have already come;
'Tis grace hath brought me safe thus far,
And grace will lead me home.

When we've been there ten thousand years,
Bright shining as the sun,
We've no less days to sing God's praise
Than when we'd first begun.''',
      ),
      Hymn(
        id: '3',
        number: 3,
        title: 'Great Is Thy Faithfulness',
        theme: 'Faith',
        lyrics: '''Great is Thy faithfulness, O God my Father;
There is no shadow of turning with Thee;
Thou changest not, Thy compassions, they fail not;
As Thou hast been, Thou forever will be.

Great is Thy faithfulness!
Great is Thy faithfulness!
Morning by morning new mercies I see.
All I have needed Thy hand hath provided;
Great is Thy faithfulness, Lord, unto me!

Summer and winter and springtime and harvest,
Sun, moon and stars in their courses above
Join with all nature in manifold witness
To Thy great faithfulness, mercy and love.

Pardon for sin and a peace that endureth
Thine own dear presence to cheer and to guide;
Strength for today and bright hope for tomorrow,
Blessings all mine, with ten thousand beside!''',
      ),
      Hymn(
        id: '4',
        number: 4,
        title: 'How Great Thou Art',
        theme: 'Worship',
        lyrics: '''O Lord my God, when I in awesome wonder
Consider all the worlds Thy hands have made,
I see the stars, I hear the rolling thunder,
Thy power throughout the universe displayed.

Then sings my soul, my Savior God, to Thee:
How great Thou art, how great Thou art!
Then sings my soul, my Savior God, to Thee:
How great Thou art, how great Thou art!

When through the woods and forest glades I wander
And hear the birds sing sweetly in the trees,
When I look down from lofty mountain grandeur
And hear the brook and feel the gentle breeze.

And when I think that God, His Son not sparing,
Sent Him to die, I scarce can take it in,
That on the cross, my burden gladly bearing,
He bled and died to take away my sin.''',
      ),
      Hymn(
        id: '5',
        number: 5,
        title: 'What a Friend We Have in Jesus',
        theme: 'Love',
        lyrics: '''What a friend we have in Jesus,
All our sins and griefs to bear!
What a privilege to carry
Everything to God in prayer!
O what peace we often forfeit,
O what needless pain we bear,
All because we do not carry
Everything to God in prayer.

Have we trials and temptations?
Is there trouble anywhere?
We should never be discouraged;
Take it to the Lord in prayer.
Can we find a friend so faithful
Who will all our sorrows share?
Jesus knows our every weakness;
Take it to the Lord in prayer.

Are we weak and heavy laden,
Cumbered with a load of care?
Precious Savior, still our refuge,
Take it to the Lord in prayer.
Do your friends despise, forsake you?
Take it to the Lord in prayer!
In His arms He'll take and shield you;
You will find a solace there.''',
      ),
      Hymn(
        id: '6',
        number: 6,
        title: 'All Hail the Power of Jesus\' Name',
        theme: 'Christ',
        lyrics: '''All hail the power of Jesus' name!
Let angels prostrate fall;
Bring forth the royal diadem,
And crown Him Lord of all.

Ye chosen seed of Israel's race,
Ye ransomed from the fall,
Hail Him who saves you by His grace,
And crown Him Lord of all.

Let every kindred, every tribe
On this terrestrial ball
To Him all majesty ascribe,
And crown Him Lord of all.

O that with yonder sacred throng
We at His feet may fall!
We'll join the everlasting song,
And crown Him Lord of all.''',
      ),
      Hymn(
        id: '7',
        number: 7,
        title: 'Blessed Assurance',
        theme: 'Faith',
        lyrics: '''Blessed assurance, Jesus is mine!
O what a foretaste of glory divine!
Heir of salvation, purchase of God,
Born of His Spirit, washed in His blood.

This is my story, this is my song,
Praising my Savior all the day long;
This is my story, this is my song,
Praising my Savior all the day long.

Perfect submission, perfect delight,
Visions of rapture now burst on my sight;
Angels descending bring from above
Echoes of mercy, whispers of love.

Perfect submission, all is at rest
I in my Savior am happy and blest,
Watching and waiting, looking above,
Filled with His goodness, lost in His love.''',
      ),
      Hymn(
        id: '8',
        number: 8,
        title: 'Christ the Lord Is Risen Today',
        theme: 'Christ',
        lyrics: '''Christ the Lord is risen today, Alleluia!
Sons of men and angels say, Alleluia!
Raise your joys and triumphs high, Alleluia!
Sing, ye heavens, and earth, reply, Alleluia!

Love's redeeming work is done, Alleluia!
Fought the fight, the battle won, Alleluia!
Death in vain forbids His rise, Alleluia!
Christ hath opened paradise, Alleluia!

Lives again our glorious King, Alleluia!
Where, O death, is now thy sting? Alleluia!
Once He died our souls to save, Alleluia!
Where thy victory, O grave? Alleluia!

Soar we now where Christ hath led, Alleluia!
Following our exalted Head, Alleluia!
Made like Him, like Him we rise, Alleluia!
Ours the cross, the grave, the skies, Alleluia!''',
      ),
    ];
  }
}
