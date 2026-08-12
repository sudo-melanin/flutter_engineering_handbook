# Challenge 06 — Functions II

## Objective

Build a small account utility that demonstrates different function parameter styles, return values, and the ternary operator.

## Tasks

### Task 1 — Return Value

Create `calculateBalance()`.

It should:

- Accept `balance` and `amount` as positional parameters.
- Return the remaining balance.

### Task 2 — Required Named Parameters

Create `calculateTransfer()`.

It should:

- Accept `balance` as a required named parameter.
- Accept `amount` as a required named parameter.
- Return the balance after the transfer.

### Task 3 — Optional Named Parameter

Create `calculateTransferWithFee()`.

It should:

- Accept `balance` as a required named parameter.
- Accept `amount` as a required named parameter.
- Accept an optional named `fee`.
- Give `fee` a default value of `100`.
- Return the balance after the transfer and fee.

### Task 4 — Optional Positional Parameter

Create `displayAccount()`.

It should:

- Accept `accountName` as a required positional parameter.
- Accept `tier` as an optional positional parameter.
- Use `AccountTier.basic` as the default tier.
- Display the account name and tier.

### Task 5 — Ternary

Create `getAccountStatus()`.

It should:

- Accept a `double balance`.
- Return `"Active"` when the balance is greater than zero.
- Return `"Empty"` when the balance is zero or below.
- Use a ternary expression.

### Task 6 — Final Challenge

Create `calculateFinalBalance()`.

It should use:

- `balance` as a required named parameter.
- `withdrawal` as a required named parameter.
- `fee` as an optional named parameter with a default value of `100`.

Rules:

- If the withdrawal plus fee exceeds the balance, return the original balance.
- Otherwise, return the balance after the withdrawal and fee.

## Run

From this directory:

```bash
dart run
```

Attempt the challenge before checking the solution.