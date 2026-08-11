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


main() {
  songs.add("New Song");
  songs.remove("Song Four");
  print(songs);

  final genre = genres.toSet();
  print(genre);

  print(song["title"]);
  print(song["artist"]);
  print(song["duration"]);

  final filteredList = transactions.where((transaction) => transaction > 0);
  print(filteredList);

  final withdrawals = transactions.where(
    (transaction) => transaction < 0).map(
      (transaction) => transaction.abs()
    ).toList();
  print(withdrawals);

  final isPremium = true;

  final visibleFeatures = [
    "Profile",
    "Settings",
    if(isPremium) "Premium Dashboard"
  ];
  print(visibleFeatures);

  final prices = [1000, 2000, 3000];

  final bonusPrices = [
    for(final price in prices) price * 1.1
  ];
  print(bonusPrices);

  
}