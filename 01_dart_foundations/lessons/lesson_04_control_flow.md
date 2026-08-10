# Lesson 04 — Control Flow

## Overview

Programs don't simply execute instructions without making decisions. Real applications constantly need to evaluate conditions and choose what should happen next.

Examples:

* Is the user authenticated?
* Is the account active?
* Is there enough money for a withdrawal?
* Has the user paid for a premium subscription?
* Should the application show an error or the requested content?

Control flow gives us the tools to express these decisions.

---

## 1. Conditions

A condition is a question whose result determines what the program should do next.

For example:

```dart
accountBalance >= amount
```

Dart evaluates the condition and produces either:

```dart
true
```

or:

```dart
false
```

We can then use that result to choose a path.

### Real-world example

A school might ask:

> Has this student paid their school fees?

If yes, allow the student into the examination hall.

If no, deny access.

Programming expresses the same decision through a condition.

---

## 2. `if`

`if` allows a program to execute code when a condition is true.

```dart
if (accountBalance >= amount) {
  print("Withdrawal allowed");
}
```

The code inside `{}` only runs when the condition evaluates to `true`.

Think of `if` as:

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

This creates two possible paths:

```text
Condition
   ↓
 ┌─┴─┐
Yes  No
 ↓    ↓
Do   Else
```

---

## 4. `else if`

Sometimes there are more than two possible paths.

```dart
if (score >= 70) {
  print("Excellent");
} else if (score >= 50) {
  print("Pass");
} else {
  print("Fail");
}
```

The program checks the conditions from top to bottom.

Once one condition is true, its branch executes and the remaining branches are skipped.

---

## 5. Logical Operators

Real applications often need to evaluate multiple conditions.

### `&&` — AND

Both conditions must be true.

```dart
if (isActive && accountBalance >= amount) {
  print("Withdrawal allowed");
}
```

Read it as:

> The account must be active AND the balance must be sufficient.

### `||` — OR

At least one condition must be true.

```dart
if (isAdmin || isManager) {
  print("Access granted");
}
```

### `!` — NOT

Reverses a boolean value.

```dart
if (!isActive) {
  print("Account is inactive");
}
```

If `isActive` is `true`, `!isActive` is `false`.

If `isActive` is `false`, `!isActive` is `true`.

---

## 6. `switch`

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

### `if` vs `switch`

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

## 7. Enums

An enum represents a fixed set of related values.

```dart
enum AccountTier {
  basic,
  premium,
  business,
  corporate,
}
```

We can then create a variable using that enum:

```dart
AccountTier accountTier = AccountTier.premium;
```

This is more expressive and safer than using a raw number:

```dart
int accountTier = 2;
```

`AccountTier.premium` communicates its meaning immediately, while `2` requires another developer to know what the number represents.

Enums also prevent arbitrary values from being assigned to the variable.

---

## 8. Enums and `switch`

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

## 9. Mutually Exclusive Branches

Branches can represent mutually exclusive states.

For example:

```dart
if (isActive) {
  print("Active");
} else {
  print("Inactive");
}
```

An account cannot be both active and inactive at the same time.

Multiple branches can also allow us to deduce information from previous failed conditions.

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

Therefore, the remaining logical possibility is that the account is active but the balance is insufficient.

This type of reasoning becomes particularly useful when handling UI and application states in Flutter.

---

## 10. Real-World Application

Consider a bank withdrawal.

A withdrawal should only happen when:

1. The account is active.
2. The amount is greater than zero.
3. The account has enough money.

```dart
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

Notice that the business rules are represented directly in the control flow.

The code isn't merely using Dart syntax. It is modelling a real-world decision process.

---

## Key Takeaways

* `if` executes code when a condition is true.
* `else` provides an alternative path.
* `else if` allows multiple possible paths.
* `&&` means AND.
* `||` means OR.
* `!` means NOT.
* `switch` matches a value against known cases.
* `enum` represents a fixed set of related values.
* Exhaustiveness means handling every possible value of a type.
* Good control flow reflects the application's real business rules.
* The order of conditions can make business logic easier to understand.

## Engineering Principle

Don't learn control flow as isolated syntax.

Think about the real-world decision first:

> What are the possible states, what conditions determine them, and what should the application do in each case?

Then express that decision using the appropriate Dart control-flow construct.
