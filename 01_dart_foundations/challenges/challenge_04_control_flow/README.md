# Challenge 04 — Control Flow

## Objective

Build a small banking system that demonstrates Dart control flow using realistic business rules.

The challenge combines:

* Variables
* Functions
* `if`
* `else if`
* `else`
* Logical operators
* `switch`
* Enums

---

## Part 1 — Account Status

Create an enum:

```dart
enum AccountStatus {
  active,
  suspended,
  closed,
}
```

Create an account status variable:

```dart
AccountStatus status = AccountStatus.active;
```

Create:

```dart
void checkAccountStatus() {
  // implementation
}
```

The function should display:

| Status      | Expected output                                                |
| ----------- | -------------------------------------------------------------- |
| `active`    | Account is active. Transactions are allowed.                   |
| `suspended` | Account is suspended. Transactions are temporarily restricted. |
| `closed`    | Account is closed. Please contact support.                     |

Use `switch`.

---

## Part 2 — Withdrawal

Create:

```dart
double accountBalance = 50000000;
```

Then create:

```dart
void withdraw(double amount) {
  // implementation
}
```

A withdrawal should only succeed when:

1. The account is active.
2. The amount is greater than zero.
3. The account has sufficient funds.

Otherwise, display an appropriate message.

---

## Required Test Cases

Test at least these scenarios:

### Test 1 — Successful withdrawal

```text
Status: active
Amount: 10,000
Expected: withdrawal succeeds
```

### Test 2 — Insufficient balance

```text
Status: active
Amount: greater than balance
Expected: insufficient balance
```

### Test 3 — Invalid amount

```text
Status: active
Amount: -5,000
Expected: invalid amount
```

### Test 4 — Restricted account

```text
Status: suspended
Amount: 10,000
Expected: withdrawal is restricted
```

---

## Reflection

After completing the challenge, answer:

1. When is `if/else` more appropriate than `switch`?
2. Why are enums safer than arbitrary integers or strings for fixed states?
3. What does `&&` mean?
4. What does `!` do?
5. What does exhaustive handling mean?
6. Why does the order of conditions matter?

---

## Engineering Goal

The objective isn't simply to make the code compile.

The objective is to translate real-world business rules into clear, maintainable program logic.
