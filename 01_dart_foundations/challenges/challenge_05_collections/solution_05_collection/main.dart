final songs = [
  "Enemy of the Pen",
  "Can of Worms",
  "Song Three",
  "Song Four",
];

final genres = [
  "Hip Hop",
  "Afrobeats",
  "Hip Hop",
  "R&B",
];

final song = {
  "title": "Enemy of the Pen",
  "artist": "Aimz",
  "duration": 3.5,
  "isPremium": true,
};

final transactions = [
  50000,
  -25000,
  100000,
  -15000,
  30000,
];

void main() {
  // Task 1: List
  songs.add("New Song");
  songs.remove("Song Four");
  print(songs);

  // Task 2: Set
  final uniqueGenres = genres.toSet();
  print(uniqueGenres);

  // Task 3: Map
  print(song["title"]);
  print(song["artist"]);
  print(song["duration"]);

  // Task 4: Filter positive transactions
  final deposits = transactions
      .where((transaction) => transaction > 0)
      .toList();

  print(deposits);

  // Task 5: Filter withdrawals and transform them
  final withdrawals = transactions
      .where((transaction) => transaction < 0)
      .map((transaction) => transaction.abs())
      .toList();

  print(withdrawals);

  // Task 6: Collection if
  final isPremium = true;

  final visibleFeatures = [
    "Profile",
    "Settings",
    if (isPremium) "Premium Dashboard",
  ];

  print(visibleFeatures);

  // Task 7: Collection for
  final prices = [1000, 2000, 3000];

  final bonusPrices = [
    for (final price in prices) price * 1.1,
  ];

  print(bonusPrices);

  // Task 8: Set
  final users = [
    "Amos",
    "John",
    "Amos",
    "Sarah",
    "John",
  ];

  final uniqueUsers = users.toSet();

  print(uniqueUsers);
}
