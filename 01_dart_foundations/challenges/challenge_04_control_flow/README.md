# Challenge 04 — Control Flow

## Objective

Build a small banking system that uses Dart control flow to model realistic account and transaction behaviour.

This challenge puts the concepts from **Lesson 04 — Control Flow** into practice.

You will work with:

* Enums
* `switch`
* `if`
* `else if`
* `else`
* Logical conditions
* `for`
* `for-in`
* `continue`
* `break`
* Functions
* Collections

---

## Scenario

You are building a simple banking system.

The system needs to:

1. Identify the account's status.
2. Determine whether a withdrawal is allowed.
3. Display transaction history.
4. Display deposits while skipping withdrawals.
5. Find the first large transaction.
6. Calculate the total value of all transactions.

---

# Part 1 — Account Status

Create an enum:

```dart
enum AccountStatus {
  active,
  suspended,
  closed,
}
```

Create an account status variable.

Then implement:

```dart
void checkAccountStatus() {
  // ...
}
```

Use `switch` to display an appropriate message for each account status.

The possible states are:

* Active
* Suspended
* Closed

---

# Part 2 — Withdrawal

Create an account balance and implement:

```dart
void withdraw(double amount) {
  // ...
}
```

A withdrawal should only succeed when:

1. The account is active.
2. The withdrawal amount is greater than zero.
3. The account has sufficient funds.

Handle each failure condition appropriately.

A withdrawal equal to the entire available balance should be allowed.

---

# Part 3 — Display Transactions

Create a collection containing both deposits and withdrawals.

For example:

```dart
List<double> transactions = [
  50000,
  -25000,
  100000,
  -15000,
  30000,
];
```

Positive values represent deposits.

Negative values represent withdrawals.

Implement:

```dart
void displayTransactions() {
  // ...
}
```

Use a `for-in` loop to display every transaction.

---

# Part 4 — Display Deposits

Implement:

```dart
void displayDeposits() {
  // ...
}
```

Use a loop and `continue` to skip negative transactions.

Only deposits should be displayed.

The important requirement is to demonstrate that `continue` skips the current iteration without stopping the entire loop.

---

# Part 5 — Find a Large Transaction

Implement:

```dart
void findLargeTransaction() {
  // ...
}
```

Search through the transactions and find the **first transaction greater than ₦50,000**.

Once it is found:

1. Display the transaction.
2. Use `break` to stop the loop.

This demonstrates the difference between:

```text
continue → skip the current iteration
break    → stop the loop
```

---

# Part 6 — Transaction Summary

Implement:

```dart
void displayTransactionSummary() {
  // ...
}
```

Use a loop to calculate the total value of all transactions.

Do not manually add the values.

The result should be calculated from the collection.

---

# Required Test Cases

Test your withdrawal function with at least these scenarios.

### Test 1 — Successful withdrawal

```text
Account: Active
Amount: ₦10,000
Expected: Withdrawal succeeds
```

### Test 2 — Entire balance

```text
Account: Active
Amount: Equal to account balance
Expected: Withdrawal succeeds
```

### Test 3 — Insufficient funds

```text
Account: Active
Amount: Greater than account balance
Expected: Withdrawal is rejected
```

### Test 4 — Invalid amount

```text
Account: Active
Amount: ₦0 or negative
Expected: Withdrawal is rejected
```

### Test 5 — Restricted account

```text
Account: Suspended or Closed
Amount: Valid withdrawal amount
Expected: Withdrawal is rejected
```

---

# Reflection

After completing the challenge, answer these questions:

1. What problem does control flow solve?
2. What is the difference between `for` and `for-in`?
3. When would you use `while` instead of `for`?
4. What makes `do-while` different from `while`?
5. What does `break` do?
6. What does `continue` do?
7. Why can a `while` loop become infinite?
8. Why are enums useful when working with `switch`?
9. Why should business rules be represented clearly in control flow?

---

## How to Approach the Challenge

1. Read Lesson 04 first.
2. Read the entire challenge before coding.
3. Implement each function one at a time.
4. Run your code frequently.
5. Test the edge cases.
6. Use `dart format .`.
7. Use `dart analyze`.
8. Review your implementation before comparing it with the solution.

### Important

There can be multiple valid implementations.

The goal is not to reproduce a specific solution.

The goal is to understand how control flow can be used to express real-world application rules clearly and correctly.
