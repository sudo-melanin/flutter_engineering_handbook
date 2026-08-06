# Lesson 02 — Variables & Types

## Learning Objectives

By the end of this lesson, you should be able to:

- Explain what a variable is.
- Explain why variables exist.
- Identify common Dart data types.
- Understand how Flutter uses variables.
- Explain why state management depends on variables.

---

## Prerequisites

Before starting this lesson, you should understand:

- What Dart is.
- The difference between Dart and Flutter.
- Why Flutter uses Dart.

---

## Theory

Imagine you own a warehouse.

Inside the warehouse are thousands of shelves, each storing different items.

Instead of remembering where every item is physically located, each shelf has a label.

For example:

- Shelf A1 → Rice
- Shelf A2 → Beans
- Shelf B1 → Cooking Oil

Those labels make it easy to find and update information.

A computer works in a similar way.

Every value is stored somewhere in memory, but programmers don't work directly with memory addresses. Instead, we give values meaningful names called **variables**.

A variable is a human-friendly name for a location in memory.

---

## Common Dart Data Types

Dart provides different data types for different kinds of information.

| Type | Purpose | Example |
|------|---------|---------|
| String | Text | `"Amos"` |
| int | Whole numbers | `25` |
| double | Decimal numbers | `99.95` |
| bool | True or False | `true` |
| List | Collection of values | `["Apple", "Orange"]` |
| Map | Key-value data | `{"name": "Amos"}` |

Choosing the correct data type helps make your code more accurate and easier to understand.

---

## Real-World Analogy

Imagine you're building a banking application.

The application needs to remember:

- Customer name
- Account number
- Balance
- Account status

Each of these pieces of information is stored in its own variable.

Without variables, the application would have no reliable way to remember or update customer information.

---

## Flutter Engineering

Variables are everywhere in Flutter.

```dart
Text(title)
```

Here, `title` is a variable that stores the text displayed on the screen.

Riverpod also relies on variables.

When you write:

```dart
state++;
```

`state` is simply a variable whose value is being updated.

State management is fundamentally the management of changing variables over time.

---

## Key Takeaways

- Variables allow programs to remember information.
- Variables provide meaningful names for data stored in memory.
- Different data types exist for different kinds of information.
- Flutter widgets use variables to display data.
- Riverpod manages changing variables (state).

---

## Knowledge Check

1. What problem do variables solve?
2. Why don't programmers work directly with memory addresses?
3. What's the difference between declaring a variable and assigning a value?
4. Why are meaningful variable names important?

---

## Reflection

Variables are often introduced as one of the easiest programming concepts.

In reality, they solve one of computing's biggest challenges: remembering information.

Almost everything you build in Flutter will depend on variables in one way or another.