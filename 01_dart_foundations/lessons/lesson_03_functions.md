# Lesson 03 — Functions

## Learning Objectives

By the end of this lesson, you should be able to:

- Explain what a function is.
- Explain why functions exist.
- Create and call functions.
- Understand parameters.
- Understand return values.
- Explain how Flutter uses functions.

---

## Prerequisites

Before starting this lesson, you should understand:

- Variables
- Data types
- Basic Dart syntax

---

## Theory

Variables allow a program to remember information.

However, remembering information alone is not enough.

Applications also need to perform actions.

For example, a banking application should be able to:

- Deposit money
- Withdraw money
- Check account balance
- Transfer funds

These actions are represented using **functions**.

A function is a reusable block of code that performs a specific task.

---

## Why Functions Exist

Imagine a bank with one cashier.

Every customer asks to deposit money.

Without a process, the cashier would have to figure everything out from scratch every time.

Instead, the bank creates a standard procedure.

Whenever a customer wants to deposit money, the cashier follows the same steps.

Functions work the same way.

They allow us to define a process once and reuse it whenever needed.

---

## Parameters

Sometimes a function needs additional information before it can perform its task.

For example:

A deposit function needs to know **how much money** should be deposited.

That information is passed into the function as a parameter.

---

## Return Values

Some functions don't just perform an action.

They also produce a result.

For example:

A function that calculates interest returns the calculated amount.

Functions that return values allow other parts of the application to use those results.

---

## Flutter Engineering

Functions are everywhere in Flutter.

```dart
runApp(MyApp());
```

```dart
build(BuildContext context)
```

```dart
onPressed: () {}
```

Even Riverpod depends heavily on functions.

```dart
int build() {
  return 0;
}
```

Understanding functions is essential for understanding Flutter.

---

## Key Takeaways

- Variables represent data.
- Functions represent behaviour.
- Functions reduce code duplication.
- Functions improve code organization.
- Functions can receive data through parameters.
- Functions can return values.

---

## Knowledge Check

1. Why do functions exist?
2. What problem do functions solve?
3. What is a parameter?
4. What is a return value?
5. Why are functions important in Flutter?

---

## Reflection

Variables tell us **what** an application knows.

Functions tell us **what** an application can do.

Software is built from data and behaviour working together.