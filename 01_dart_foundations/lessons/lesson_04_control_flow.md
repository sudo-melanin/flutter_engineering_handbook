# Lesson 04 — Control Flow

## Overview

Programs don't simply execute instructions from top to bottom without making decisions. Real applications constantly need to decide:

* Is the user authenticated?
* Is the account active?
* Is there enough money for a withdrawal?
* Should this feature be available to the user?
* Should we continue processing?
* Should we stop?
* Should we process every item in a collection?

**Control flow** gives us the tools to make these decisions and control repetition.

The two major ideas we will learn are:

```text
Control Flow
    │
    ├── Decisions
    │     ├── if
    │     ├── else
    │     ├── else if
    │     ├── logical operators
    │     ├── switch
    │     └── enums
    │
    └── Repetition
          ├── for
          ├── for-in
          ├── while
          ├── do-while
          ├── break
          └── continue
```

---

# Part 1 — Decisions

## 1. Conditions

A condition is a question whose result determines what the program should do next.

For example:

```dart
accountBalance >= amount
```

Dart evaluates this expression and produces either:

```dart
true
```

or:

```dart
false
```

We can use that result to choose a path.

### Real-world example

A school might ask:

> Has this student paid their school fees?

If yes, allow the student into the examination hall.

If no, deny access.

Programming expresses the same decision through conditions.

---

## 2. `if`

`if` executes a block of code when a condition is true.

```dart
if (accountBalance >= amount) {
  print("Withdrawal allowed");
}
```

Think:

> If this condition is true, do this.

---

## 3. `else`

`else` provides an alternative when the `if` condition is false.

```dart
if (accountBalance >= amount) {
  print("Withdrawal allowed");
} else {
  print("Insufficient funds");
}
```

There are now two possible paths:

```text
Condition
   │
 ┌─┴─┐
Yes  No
 │    │
Do   Else
```

---

## 4. `else if`

Sometimes an application needs more than two possible paths.

```dart
if (score >= 70) {
  print("Excellent");
} else if (score >= 50) {
  print("Pass");
} else {
  print("Fail");
}
```

Dart checks the conditions from top to bottom.

Once a matching branch is found, its code executes and the remaining branches are skipped.

---

# Part 2 — Logical Operators

Real applications often need to evaluate multiple conditions.

## `&&` — AND

Both conditions must be true.

```dart
if (isActive && accountBalance >= amount) {
  print("Withdrawal allowed");
}
```

Read it as:

> The account must be active AND the balance must be sufficient.

---

## `||` — OR

At least one condition must be true.

```dart
if (isAdmin || isManager) {
  print("Access granted");
}
```

---

## `!` — NOT

Reverses a boolean value.

```dart
if (!isActive) {
  print("Account is inactive");
}
```

If `isActive` is `true`, `!isActive` is `false`.

If `isActive` is `false`, `!isActive` is `true`.

---

# Part 3 — `switch`

`switch` is useful when comparing one value against several known possibilities.

For example:

```dart
switch (accountTier) {
  case 1:
    print("Basic Account");

  case 2:
    print("Premium Account");

  case 3:
    print("Business Account");

  case 4:
    print("Corporate Account");

  default:
    print("Unknown Account Tier");
}
```

The mental model is:

> Which case does this value match?

---

## `if` vs `switch`

Use `if` when evaluating conditions, ranges, or relationships:

```dart
if (accountBalance >= 1000000) {
  print("High balance");
}
```

Use `switch` when matching a value against known cases:

```dart
switch (accountTier) {
  case 1:
    print("Basic");
  case 2:
    print("Premium");
}
```

---

# Part 4 — Enums

An enum represents a fixed set of related values.

```dart
enum AccountTier {
  basic,
  premium,
  business,
  corporate,
}
```

We can create a variable using that enum:

```dart
AccountTier accountTier = AccountTier.premium;
```

This is more expressive and safer than using a raw number:

```dart
int accountTier = 2;
```

`AccountTier.premium` communicates its meaning immediately.

---

## Enums and `switch`

Enums work particularly well with `switch`.

```dart
switch (accountTier) {
  case AccountTier.basic:
    print("Basic Account");

  case AccountTier.premium:
    print("Premium Account");

  case AccountTier.business:
    print("Business Account");

  case AccountTier.corporate:
    print("Corporate Account");
}
```

Every possible enum value has been handled.

This is called **exhaustive handling**.

Exhaustiveness means that every possible value of the type has been considered.

---

# Part 5 — Mutually Exclusive Branches

Branches can represent mutually exclusive states.

```dart
if (isActive) {
  print("Active");
} else {
  print("Inactive");
}
```

An account cannot be both active and inactive at the same time.

Previous conditions can also eliminate possibilities from later branches.

```dart
if (isActive && accountBalance >= amount) {
  print("Withdrawal successful");
} else if (!isActive) {
  print("Account is inactive");
} else {
  print("Insufficient funds");
}
```

If the program reaches the final `else`, the previous conditions have already ruled out the other possibilities.

This type of reasoning becomes particularly useful when handling Flutter UI and application states.

---

# Part 6 — Repetition

Decisions allow a program to choose between paths.

Loops allow a program to **repeat an action**.

Imagine a Spotify playlist containing thousands of songs.

We don't want to write:

```dart
print(song1);
print(song2);
print(song3);
```

for every song.

We want to say:

> For every song, perform this action.

That's the problem loops solve.

---

# Part 7 — `for`

A `for` loop is useful when we can define an iteration pattern.

```dart
for (int i = 1; i <= 5; i++) {
  print(i);
}
```

There are three important components:

```text
for (
    initialization;
    condition;
    update
)
```

### Initialization

```dart
int i = 1;
```

Establishes the starting value.

### Condition

```dart
i <= 5
```

Determines whether the loop should continue.

### Update

```dart
i++
```

Changes the value after each iteration.

The execution cycle is:

```text
Initialize
    ↓
Check condition
    ↓
Execute body
    ↓
Update
    ↓
Check condition again
    ↓
Repeat
```

---

# Part 8 — `for-in`

`for-in` is useful when we want to process each item in a collection.

```dart
List<String> songs = [
  "Enemy of the Pen",
  "Can of Worms",
  "Song Three",
  "Song Four",
];

for (final song in songs) {
  print("Now playing $song");
}
```

Read this as:

> For each song in songs, print the song.

The variable `song` represents the current item.

Unlike an indexed `for` loop, we don't need to manually manage an index.

Compare:

```dart
for (int i = 0; i < songs.length; i++) {
  print(songs[i]);
}
```

with:

```dart
for (final song in songs) {
  print(song);
}
```

Use `for-in` when you primarily care about the items.

Use an indexed `for` when the position or index matters.

---

# Part 9 — `while`

A `while` loop repeats code while a condition remains true.

```dart
int balance = 1000;

while (balance > 0) {
  print("Current balance: $balance");
  balance -= 250;
}
```

The loop keeps running while:

```dart
balance > 0
```

is true.

Unlike a `for` loop, the initialization and update are managed separately.

```dart
int balance = 1000;

while (balance > 0) {
  // body

  balance -= 250;
}
```

### Infinite loops

A `while` loop can become infinite if nothing changes the condition.

```dart
int balance = 1000;

while (balance > 0) {
  print(balance);
}
```

`balance` never changes, so the condition remains true forever.

Always understand how a `while` loop can eventually reach a false condition.

---

# Part 10 — `do-while`

A `do-while` loop executes its body **at least once** before checking the condition.

```dart
int attempts = 0;

do {
  print("Enter your PIN");
  attempts++;
} while (attempts < 3);
```

The difference is the order of operations.

### `while`

```text
CHECK
  ↓
DO
  ↓
CHECK
```

### `do-while`

```text
DO
  ↓
CHECK
  ↓
DO
```

This makes `do-while` useful when an action must happen at least once.

---

# Part 11 — `break`

`break` immediately exits the loop.

```dart
for (final song in songs) {
  if (song == "Enemy of the Pen") {
    print("Song found!");
    break;
  }
}
```

Once the song is found, there is no reason to continue searching.

Think:

> I'm done. Exit the loop.

---

# Part 12 — `continue`

`continue` skips the current iteration and moves to the next iteration.

```dart
for (int i = 1; i <= 10; i++) {
  if (i % 2 == 0) {
    continue;
  }

  print(i);
}
```

Output:

```text
1
3
5
7
9
```

The even numbers are skipped.

Think:

> Skip this one, but keep processing the rest.

---

# `break` vs `continue`

```text
break
  ↓
STOP THE LOOP

continue
  ↓
SKIP CURRENT ITERATION
  ↓
CONTINUE LOOP
```

---

# Part 13 — Real-World Banking Example

Control flow becomes more useful when we combine the concepts.

```dart
enum AccountStatus {
  active,
  suspended,
  closed,
}

AccountStatus status = AccountStatus.active;
double accountBalance = 50000000;

void withdraw(double amount) {
  if (status != AccountStatus.active) {
    print("Inactive account. Withdrawal is restricted.");
  } else if (amount <= 0) {
    print("Invalid amount. Enter a valid amount.");
  } else if (accountBalance < amount) {
    print("Insufficient balance.");
  } else {
    print("Withdrawal successful.");
    accountBalance -= amount;
  }
}
```

The function models real business rules:

1. Is the account allowed to transact?
2. Is the requested amount valid?
3. Can the account afford it?
4. Perform the withdrawal.

---

# Engineering Principles

## 1. Translate business rules into logic

Before writing code, understand the real-world decision.

Ask:

> What are the possible states?

> What conditions determine each state?

> What should happen in each state?

Then choose the appropriate control-flow construct.

---

## 2. Prefer readable conditions

Code should communicate the business rule clearly.

```dart
if (status != AccountStatus.active) {
  print("Withdrawal restricted");
}
```

is easier to understand than hiding the same rule inside unnecessarily complicated logic.

---

## 3. Choose the right loop

Use:

### `for`

When you have a clear iteration pattern or counter.

### `for-in`

When you want to process each item in a collection.

### `while`

When repetition primarily depends on a condition.

### `do-while`

When the operation must happen at least once.

---

## 4. Avoid unnecessary repetition

Loops exist for the same fundamental reason functions do:

> Don't repeat yourself.

Instead of manually writing the same operation many times, define the rule once and let the program repeat it.

---

# Key Takeaways

* `if` executes code when a condition is true.
* `else` provides an alternative path.
* `else if` handles additional conditions.
* `&&` means AND.
* `||` means OR.
* `!` means NOT.
* `switch` matches a value against known cases.
* `enum` represents a fixed set of related values.
* Exhaustiveness means considering every possible value of a type.
* `for` provides controlled repetition.
* `for-in` iterates through collection items.
* `while` repeats while a condition is true.
* `do-while` executes at least once before checking its condition.
* `break` exits a loop.
* `continue` skips the current iteration.
* Good control flow reflects real-world business rules.
