# Lesson 05 — Collections

Collections allow us to store and work with groups of related values.

In real applications, we rarely work with one item at a time. A music app has playlists, a bank has transactions, and an application has lists of users.

## List

A `List` is an ordered collection.

```dart
final songs = [
  "Enemy of the Pen",
  "Can of Worms",
  "Song Three",
];
```

Lists use zero-based indexing:

```dart
print(songs[0]);
```

Common operations:

```dart
songs.add("Song Four");
songs.remove("Song Four");
songs.removeAt(0);
songs.length;
songs.contains("Song Three");
```

Use a `List` when order and individual occurrences matter.

---

## Set

A `Set` stores unique values.

```dart
final genres = {
  "Hip Hop",
  "Afrobeats",
  "R&B",
};
```

Duplicates are automatically removed.

A `List` can be converted to a `Set`:

```dart
final uniqueGenres = genresList.toSet();
```

Use a `Set` when uniqueness matters.

---

## Map

A `Map` stores key-value pairs.

```dart
final song = {
  "title": "Enemy of the Pen",
  "artist": "Aimz",
  "duration": 3.5,
};
```

Values are accessed through their keys:

```dart
print(song["artist"]);
```

Use a `Map` when values need to be associated with named keys.

---

## `where()`

`where()` filters an existing collection.

```dart
final deposits = transactions
    .where((transaction) => transaction > 0)
    .toList();
```

Think:

> "Which items should remain?"

`where()` returns an `Iterable`. Use `.toList()` when a `List` is required.

---

## `map()`

`map()` transforms each item.

```dart
final doubled = numbers
    .map((number) => number * 2)
    .toList();
```

Think:

> "What should each item become?"

---

## Chaining

Collection operations can be combined:

```dart
final withdrawals = transactions
    .where((transaction) => transaction < 0)
    .map((transaction) => transaction.abs())
    .toList();
```

The flow is:

```text
Collection
    ↓
where → filter
    ↓
map → transform
    ↓
toList → List
```

---

## `reduce()` and `fold()`

`reduce()` combines a collection into one value:

```dart
final total = numbers.reduce(
  (sum, number) => sum + number,
);
```

`fold()` provides an initial value:

```dart
final total = numbers.fold(
  0,
  (sum, number) => sum + number,
);
```

`fold()` is safer when the collection may be empty.

---

## Collection `if`

An item can be conditionally added:

```dart
final features = [
  "Profile",
  "Settings",
  if (isPremium) "Premium Dashboard",
];
```

---

## Collection `for`

A collection can be built using a loop:

```dart
final doubled = [
  for (final number in numbers)
    number * 2,
];
```

This is especially useful when constructing lists of Flutter widgets.

---

## Mental Model

```text
List
→ ordered collection

Set
→ unique values

Map
→ key-value relationships

where()
→ filter

map()
→ transform

reduce()
→ combine into one value

fold()
→ combine with an initial value

collection if
→ conditionally add

collection for
→ generate collection items
```
