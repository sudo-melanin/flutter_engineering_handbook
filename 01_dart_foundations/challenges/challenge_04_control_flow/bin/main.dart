enum AccountStatus {
  active,
  suspended,
  closed,
}

AccountStatus status = AccountStatus.active;
double accountBalance = 50000000;

void checkAccountStatus() {
  switch (status) {
    case AccountStatus.active:
      print("Account is active. Transactions are allowed");

    case AccountStatus.suspended:
      print(
        "Account is suspended. Transactions are temporarily restricted",
      );

    case AccountStatus.closed:
      print("Account is closed. Please contact support");
  }
}

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

void main() {
  checkAccountStatus();

  withdraw(10000);

  print("Remaining balance: ₦$accountBalance");
}