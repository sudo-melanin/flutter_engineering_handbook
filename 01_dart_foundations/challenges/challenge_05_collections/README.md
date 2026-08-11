# Challenge 05 — Collections

## Scenario

You are building a small music library for a streaming application.

The application needs to work with lists, unique values, key-value data, filtering, transformation, and collection control flow.

## Tasks

### 1. List

Using the provided `songs` list:

* Add `"New Song"`.
* Remove `"Song Four"`.
* Print the final list.

### 2. Set

Convert `genres` to a `Set` and print it.

The duplicate genre should appear only once.

### 3. Map

Using the `song` map, print:

* title
* artist
* duration

### 4. Filtering

Using `transactions`, create a list containing only positive transactions.

Use `where()`.

### 5. Transformation

Create a list containing the absolute values of all withdrawals.

Use `where()` and `map()`.

Expected result:

```text
[25000, 15000]
```

### 6. Collection `if`

Create `visibleFeatures` containing:

```text
Profile
Settings
```

Add `"Premium Dashboard"` only when `isPremium` is `true`.

### 7. Collection `for`

Given:

```dart
final prices = [1000, 2000, 3000];
```

Create:

```text
[1100, 2200, 3300]
```

using collection `for`.

### 8. Challenge Question

Given a list of users containing duplicates, create a collection containing only unique users.

Choose the appropriate collection type and explain why.

## Run

```bash
dart run
```

Try the challenge before checking the solution.
