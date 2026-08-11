# Solution 04 — Control Flow

## Overview

This solution implements the banking scenario from **Challenge 04 — Control Flow**.

The purpose of the challenge was to apply Dart control-flow concepts to a realistic application scenario rather than learning the syntax in isolation.

The implementation demonstrates:

* Enums
* `switch`
* `if`
* `else if`
* `else`
* Comparison operators
* Logical conditions
* `for`
* `for-in`
* `continue`
* `break`
* Collections
* Functions
* Business-rule validation

---

# 1. Account Status

We begin by defining the possible states of an account.

```dart
enum AccountStatus {
  active,
  suspended,
  closed,
}
```

An enum is appropriate because the account has a **fixed set of possible states**.

Instead of doing this:

```dart
int status = 1;
```

we can write:

```dart
AccountStatus status = AccountStatus.active;
```

The second version communicates meaning immediately.

A new developer can understand what `AccountStatus.active` represents without having to remember what the number `1` means.

---

# 2. Using `switch` With the Enum

The account status is handled with a `switch`:

```dart
void checkAccountStatus() {
  switch (status) {
    case AccountStatus.active:
      print("Your account is active");

    case AccountStatus.suspended:
      print("Your account is suspended, transactions restricted");

    case AccountStatus.closed:
      print("Account is closed, kindly contact support");
  }
}
```

The `switch` asks:

> Which account status are we currently dealing with?

Each enum value has its own branch.

Because all possible values of `AccountStatus` are handled, the switch is exhaustive.

This is preferable to maintaining a `default` branch that could hide an unhandled state.

---

# 3. Withdrawal Business Rules

The withdrawal function contains several business rules:

```dart
void withdraw(double amount) {
  if (status != AccountStatus.active) {
    print(
      "Withdrawal is restricted on your account, please contact Support",
    );
  } else if (amount <= 0) {
    print("Invalid amount, enter a valid withdrawal amount");
  } else if (amount > accountBalance) {
    print("Insufficient Balance, fund account to continue");
  } else {
    accountBalance -= amount;
    print("Withdrawal of $amount successful");
  }
}
```

The conditions are evaluated from top to bottom.

## Rule 1 — Account must be active

```dart
if (status != AccountStatus.active)
```

If the account is suspended or closed, the withdrawal is rejected.

There is no need to check the balance first because the account isn't allowed to transact in the first place.

---

## Rule 2 — Amount must be valid

```dart
else if (amount <= 0)
```

A withdrawal of zero or a negative amount doesn't make sense.

Therefore, the request is rejected.

---

## Rule 3 — Sufficient balance

```dart
else if (amount > accountBalance)
```

The requested amount must not be greater than the available balance.

Notice the use of `>` rather than `>=`.

If:

```text
Account balance = ₦50,000
Withdrawal      = ₦50,000
```

then:

```text
50,000 > 50,000
```

is false.

Therefore, the withdrawal is allowed.

This is an example of handling a **boundary condition** correctly.

---

## Rule 4 — Successful withdrawal

If none of the previous conditions are true, the request is valid.

```dart
else {
  accountBalance -= amount;
  print("Withdrawal of $amount successful");
}
```

The final `else` effectively means:

> The account is active, the amount is valid, and sufficient funds are available.

This is an example of reasoning about **mutually exclusive branches**.

---

# 4. Displaying Transactions

Our transaction history is represented by a list:

```dart
List<double> transactions = [
  50000,
  -25000,
  100000,
  -15000,
  30000,
];
```

We use positive values for deposits and negative values for withdrawals.

To display every transaction:

```dart
void displayTransactions() {
  for (final transaction in transactions) {
    print("Transaction amount: $transaction");
  }
}
```

This uses a `for-in` loop.

The loop can be read as:

> For every transaction in the transactions collection, print the transaction.

We don't need the index, so `for-in` communicates our intent better than an indexed `for` loop.

---

# 5. Using `continue` to Skip Withdrawals

We only want to display deposits.

A negative transaction represents a withdrawal.

```dart
void displayDeposits() {
  for (final transaction in transactions) {
    if (transaction < 0) {
      continue;
    }

    print("Deposit: $transaction");
  }
}
```

When the transaction is negative:

```dart
if (transaction < 0) {
  continue;
}
```

`continue` skips the rest of the current iteration.

The loop does **not** stop.

For our transactions:

```text
50000
-25000
100000
-15000
30000
```

the negative values are skipped.

The result is:

```text
Deposit: 50000
Deposit: 100000
Deposit: 30000
```

The important distinction is:

```text
continue
    ↓
skip current item
    ↓
process next item
```

---

# 6. Using `break` to Stop Searching

Now we want to find the first transaction greater than ₦50,000.

```dart
void findLargeTransaction() {
  for (final transaction in transactions) {
    if (transaction > 50000) {
      print("Large transaction: $transaction");
      break;
    }
  }
}
```

The loop checks each transaction.

```text
₦50,000   → not greater than ₦50,000
-₦25,000  → not greater
₦100,000  → greater
```

Once ₦100,000 is found, `break` immediately exits the loop.

Why?

Because our requirement is to find the **first** matching transaction.

Continuing to search would be unnecessary.

The distinction between the two statements is therefore:

```text
continue → skip this iteration
break    → terminate the loop
```

---

# 7. Calculating the Transaction Summary

We need to calculate the total value of all transactions.

We start with:

```dart
double total = 0;
```

Then process every transaction:

```dart
void displayTransactionSummary() {
  double total = 0;

  for (final transaction in transactions) {
    total += transaction;
  }

  print("Transaction total: $total");
}
```

The calculation happens sequentially:

```text
Initial total = 0

0 + 50,000     = 50,000
50,000 - 25,000 = 25,000
25,000 + 100,000 = 125,000
125,000 - 15,000 = 110,000
110,000 + 30,000 = 140,000
```

Therefore:

```text
Transaction total = ₦140,000
```

The advantage of using a loop is that we don't need to know how many transactions exist.

If the list grows from five transactions to five hundred, the same logic still works.

---

# 8. Why `for-in` Instead of Indexed `for`?

We could have written:

```dart
for (int i = 0; i < transactions.length; i++) {
  total += transactions[i];
}
```

This is valid.

However, we don't need `i`.

We only care about the transaction itself.

Therefore:

```dart
for (final transaction in transactions) {
  total += transaction;
}
```

is more expressive.

The choice of loop should communicate **why we're iterating**.

---

# 9. The Complete Flow

The `main()` function brings the individual operations together:

```dart
void main() {
  checkAccountStatus();

  withdraw(10000);

  displayTransactions();

  displayDeposits();

  findLargeTransaction();

  displayTransactionSummary();
}
```

Each function has a clear responsibility.

The program flow is:

```text
Check account
      ↓
Attempt withdrawal
      ↓
Display transactions
      ↓
Display deposits
      ↓
Find large transaction
      ↓
Calculate transaction summary
```

This is already better than placing every piece of logic directly inside `main()`.

---

# 10. Control Flow Mental Model

The concepts from this lesson can be grouped into two major categories.

## Decisions

```text
if
else if
else
switch
```

These answer:

> Which path should the program take?

---

## Repetition

```text
for
for-in
while
do-while
```

These answer:

> How many times should this operation happen?

Then we have two loop-control tools:

```text
break
continue
```

which answer:

> Should I stop the loop or skip this iteration?

---

# 11. Why This Matters in Real Applications

These concepts appear everywhere in application development.

### Authentication

```dart
if (isAuthenticated) {
  // show application
} else {
  // show login
}
```

### Premium features

```dart
if (isPremium) {
  // allow feature
} else {
  // restrict feature
}
```

### Processing API results

```dart
for (final item in responseItems) {
  // process item
}
```

### Filtering data

```dart
for (final user in users) {
  if (!user.isActive) {
    continue;
  }

  // process active user
}
```

### Searching

```dart
for (final item in items) {
  if (item.id == targetId) {
    // found
    break;
  }
}
```

The syntax is simple.

The engineering skill comes from knowing **which control-flow structure best represents the problem**.

---

# 12. Important Engineering Lessons

## Business rules should be explicit

Instead of hiding important rules inside complicated expressions, make the decision paths readable.

```dart
if (status != AccountStatus.active) {
  // restricted
} else if (amount <= 0) {
  // invalid amount
} else if (amount > accountBalance) {
  // insufficient funds
} else {
  // success
}
```

A developer reading this can understand the banking rules without needing to execute the program.

---

## Boundary conditions matter

This challenge exposed an important engineering habit.

These two conditions are not equivalent:

```dart
amount >= accountBalance
```

and:

```dart
amount > accountBalance
```

A small operator can change the business behaviour of an application.

Always test the boundaries.

---

## Use the simplest construct that communicates intent

If you only need to process items:

```dart
for (final item in items)
```

is usually clearer than manually managing indexes.

If you need to stop searching:

```dart
break;
```

If you need to skip one item:

```dart
continue;
```

Good code isn't just code that works.

It should also make its intention obvious.

---

# 13. Challenge vs Solution

The repository deliberately keeps two versions.

### Challenge

```text
challenges/solution_04_control_flow/
```

contains the problem and starter code.

The learner is expected to complete the TODOs.

### Solution

```text
solutions/solution_04_control_flow/
```

contains one complete implementation.

The solution is not the only possible correct answer.

Different implementations may also be valid.

The goal is to understand the underlying concepts and engineering decisions.

---

# 14. What We Learned

By completing this challenge, we can now:

* Represent fixed states with enums.
* Use `switch` to handle known states.
* Use `if`, `else if`, and `else` for conditional decisions.
* Combine conditions to represent business rules.
* Iterate through collections with `for-in`.
* Use indexed `for` loops when the index matters.
* Repeat operations with `while` and `do-while`.
* Use `continue` to skip an iteration.
* Use `break` to terminate a loop.
* Think about boundary conditions.
* Translate real-world rules into program logic.

---

# Engineering Principle

> **Control flow is how a program makes decisions, repeats work, and determines what happens next.**

The goal is not to memorise keywords.

The goal is to look at a real-world problem and be able to reason:

> What decisions exist here?

> What states are possible?

> What needs to repeat?

> When should repetition stop?

> What should be skipped?

Once you can answer those questions, the Dart syntax becomes the easy part.
