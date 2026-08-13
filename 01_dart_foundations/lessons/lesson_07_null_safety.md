# Lesson 07: Null Safety

## Learning Objectives

By the end of this lesson, you should understand:

- Nullable and non-nullable types
- `?`
- `?.`
- `??`
- `??=`
- `!`
- Null checks
- Type promotion
- Nullable collections
- Nullable function parameters and return values

---

## 1. Nullable and Non-nullable Types

A normal type cannot contain `null`.

```dart
String name = "Amos";
```

A nullable type can contain either a value or `null`.

```dart
String? name = null;
```

Think of it as:

- `String` → must contain a String
- `String?` → can contain a String or `null`

---

## 2. Null-aware Access: `?.`

Use `?.` when accessing a property or method on a value that may be null.

```dart
String? name = "Amos";

final length = name?.length;
```

If `name` is null, the expression produces `null` instead of throwing an error.

---

## 3. Null-coalescing Operator: `??`

`??` chooses a fallback value when the left side is null.

```dart
String? name;

final displayName = name ?? "Guest";
```

If `name` is null, `displayName` becomes `"Guest"`.

Important:

`??` chooses a value. It does not modify the original variable.

---

## 4. Null-aware Assignment: `??=`

`??=` assigns a value only when the variable is null.

```dart
String? name;

name ??= "Guest";
```

Now `name` contains `"Guest"`.

If `name` already contains a value, nothing changes.

Remember:

- `??` → choose a value
- `??=` → assign a value if null

---

## 5. Null Assertion: `!`

The `!` operator tells Dart that you guarantee a nullable value is not null.

```dart
String? name = "Amos";

print(name!.length);
```

If the value is actually null, the program can fail at runtime.

Use `!` carefully.

---

## 6. Null Checks

You can explicitly check whether a value is null.

```dart
String? name = "Amos";

if (name != null) {
  print(name.length);
}
```

Dart understands that `name` is non-null inside the block.

This is called type promotion.

---

## 7. Nullable Collections

The list itself can exist while its items are nullable.

```dart
List<String?> names = [
  "Amos",
  null,
  "John",
];
```

A nullable list is different:

```dart
List<String>? names;
```

The difference:

- `List<String>` → list exists, items cannot be null
- `List<String?>` → list exists, items may be null
- `List<String>?` → list itself may be null, items cannot be null

---

## 8. Nullable Function Parameters

A function parameter can accept null.

```dart
void greet(String? name) {
  print(name ?? "Guest");
}
```

Both are valid:

```dart
greet("Amos");
greet(null);
```

---

## 9. Nullable Return Values

A function can return a nullable value.

```dart
String? findUsername() {
  return null;
}
```

The caller must account for the possibility of null.

---

## 10. Combining Null-aware Operators

These operators can be combined.

```dart
final displayName = user?.name ?? "Guest";
```

Read it as:

> Try to get the user's name. If the user or name is null, use `"Guest"`.

---

## Null Safety and Functions

A function that returns a value gives the caller something to use.

```dart
double calculateBalance(double balance, double withdrawal) {
  return balance - withdrawal;
}
```

The caller can assign the result:

```dart
final balance = calculateBalance(500000, 100000);
```

Or use it directly:

```dart
if (calculateBalance(500000, 100000) > 0) {
  print("Balance available");
}
```

A `void` function performs an action without returning a value.

```dart
void updateBalance(double amount) {
  accountBalance += amount;
}
```

The function's purpose is to perform the operation, not provide a result.

---

## Key Takeaways

```text
?    → allows null

?.   → safely access a nullable value

??   → choose a fallback value

??=  → assign a fallback value if null

!    → assert that a value is not null

if (value != null)
     → check and allow Dart to promote the value
```

Null safety helps Dart identify possible null errors before they become runtime problems.