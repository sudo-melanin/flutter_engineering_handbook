# Challenge 03 — Functions

## Objective

Use Dart functions to model reusable actions in a simple banking and music application.

The goal of this challenge is to understand why functions exist, how they reduce duplication, and how parameters allow the same function to work with different values.

---

## Part 1 — Music Application

Create functions that represent common actions in a music application.

### 1. Play a song

Create:

```dart
void playSong() {
  // implementation
}
```

It should display:

```text
Now playing song
```

### 2. Pause a song

Create:

```dart
void pauseSong() {
  // implementation
}
```

It should display:

```text
Song is paused
```

### 3. Like a song

Create:

```dart
void likeSong(String songName) {
  // implementation
}
```

The function should accept the song name as a parameter and display a message indicating that the song was liked.

For example:

```text
You liked Enemy of the Pen
```

---

## Part 2 — Banking Application

Create a variable representing the account balance:

```dart
double accountBalance = 290000000.8;
```

### 1. Deposit

Create:

```dart
void deposit(double amount) {
  // implementation
}
```

The function should:

* Accept the deposit amount as a parameter.
* Only accept amounts greater than zero.
* Add the valid amount to the account balance.
* Display an appropriate message for successful and invalid deposits.

Example:

```text
Successfully deposited 50000
```

For an invalid amount:

```text
Deposit amount must be greater than 0
```

---

### 2. Withdrawal

Create:

```dart
void withdraw(double amount) {
  // implementation
}
```

The function should:

* Accept the withdrawal amount as a parameter.
* Check whether sufficient funds are available.
* Subtract the amount from the balance when valid.
* Display an appropriate message when funds are insufficient.

Example:

```text
Successfully withdrew 50000
```

For insufficient funds:

```text
Insufficient balance
```

---

## Part 3 — Function Calls

Call each function from `main()`.

Your program should demonstrate that the same function can be called multiple times with different arguments.

For example:

```dart
void main() {
  playSong();
  pauseSong();

  likeSong("Enemy of the Pen");
  likeSong("Another Song");

  deposit(50000);
  deposit(100000);

  withdraw(25000);
}
```

The exact values and song names are up to you.

---

## Concepts Practised

This challenge should demonstrate your understanding of:

* Function declarations
* Function calls
* Parameters
* Arguments
* Return type `void`
* String interpolation
* Reusability
* Code duplication
* Basic validation inside functions
* Modifying variables from functions

---

## Reflection

After completing the challenge, answer the following:

### 1. Why do functions exist?

Explain the problem functions solve in software development.

### 2. Why are functions often described as actions or verbs?

Give an example.

### 3. What is the difference between a function declaration and a function call?

Explain using one of your functions.

### 4. Why is this:

```dart
void withdraw(double amount)
```

more reusable than creating separate functions for every possible withdrawal amount?

### 5. What is the difference between a parameter and an argument?

Use one of your functions as an example.

---

## Engineering Goal

The objective isn't simply to make the program work.

The goal is to recognise repeated behaviour and turn that behaviour into reusable functions.

A good function should have a clear responsibility and should be reusable with different inputs where appropriate.

> **Don't Repeat Yourself (DRY)** is one of the fundamental reasons we use functions.
