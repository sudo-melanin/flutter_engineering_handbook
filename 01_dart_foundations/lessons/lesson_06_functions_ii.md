# Lesson 06 — Functions II

This lesson builds on functions by introducing return values and different parameter styles.

## Learning Objectives

By the end of this lesson, you should be able to:

- Return values from functions.
- Use positional parameters.
- Use named parameters.
- Use required parameters.
- Use optional positional parameters.
- Use optional named parameters.
- Use default parameter values.
- Use the ternary operator.

## 1. Return Values

A `void` function performs an action without returning a value.

```dart
void deposit(double amount) {
  accountBalance += amount;
}
```

A function can also return a value:

```dart
double calculateBalance(double balance, double amount) {
  return balance - amount;
}
```

The `return` statement sends the result back to the caller and exits the function.

```dart
final balance = calculateBalance(500000, 100000);

print(balance);
```

## 2. Positional Parameters

Positional parameters are matched according to their position.

```dart
void transfer(String account, double amount) {
  // ...
}
```

The arguments are supplied in the same order:

```dart
transfer("1234567890", 50000);
```

Here:

- `"1234567890"` → `account`
- `50000` → `amount`

## 3. Named Parameters

Named parameters are identified by their names rather than their positions.

```dart
void transfer({
  required String account,
  required double amount,
}) {
  // ...
}
```

They are called using their parameter names:

```dart
transfer(
  account: "1234567890",
  amount: 50000,
);
```

Named parameters improve readability when a function has several arguments.

## 4. Required Parameters

The `required` keyword means the caller must provide the argument.

```dart
void createUser({
  required String name,
}) {
  print(name);
}
```

This is valid:

```dart
createUser(name: "Amos");
```

This is not:

```dart
createUser();
```

## 5. Optional Positional Parameters

Square brackets create optional positional parameters.

```dart
void greetUser(String name, [String? title]) {
  print("Hello $name");
}
```

Both calls are valid:

```dart
greetUser("Amos");

greetUser("Amos", "Engineer");
```

An optional positional parameter can also have a default value:

```dart
void greetUser(
  String name, [
  String title = "User",
]) {
  print("Hello $title $name");
}
```

## 6. Optional Named Parameters

Named parameters are optional when they are not marked `required`.

```dart
void createAccount({
  required String name,
  String role = "user",
}) {
  print("$name is a $role");
}
```

The caller can provide the optional parameter:

```dart
createAccount(
  name: "Amos",
  role: "admin",
);
```

Or allow the default value:

```dart
createAccount(
  name: "Amos",
);
```

## 7. Ternary Operator

The ternary operator is a shorthand for simple `if/else` decisions.

Instead of:

```dart
String status;

if (balance > 0) {
  status = "Active";
} else {
  status = "Empty";
}
```

You can write:

```dart
final status = balance > 0 ? "Active" : "Empty";
```

The structure is:

```text
condition ? valueIfTrue : valueIfFalse
```

Ternary expressions are best suited to simple decisions. Use normal `if/else` when the logic becomes more complex.

## Mental Model

```text
Parameters
→ information a function receives

Function body
→ what the function does

return
→ result sent back to the caller

required
→ argument must be provided

[ ]
→ optional positional parameter

{ }
→ named parameters

? :
→ simple conditional expression
```

## Key Takeaway

Functions become more flexible when you understand:

1. What information they receive.
2. Which arguments are required.
3. Which arguments are optional.
4. What values they return.
5. How simple decisions can be expressed concisely.