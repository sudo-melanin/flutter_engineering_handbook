enum AccountStatus { active, suspended, closed }

AccountStatus status = AccountStatus.active;
double accountBalance = 50000000;

List<double> transactions = [50000, -25000, 100000, -15000, 30000];

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

void withdraw(double amount) {
  if (status != AccountStatus.active) {
    print("Withdrawal is restricted on your account, please contact Support");
  } else if (amount <= 0) {
    print("Invalid amount, enter a valid withdrawal amount");
  } else if (amount > accountBalance) {
    print("Insufficient Balance, fund account to continue");
  } else {
    accountBalance -= amount;
    print("Withdrawal of $amount successful");
  }
}

void displayTransactions() {
  for (final transaction in transactions) {
    print("Transaction amount: $transaction");
  }
}

void displayDeposits() {
  for (final transaction in transactions) {
    if (transaction < 0) {
      continue;
    }

    print("Deposit: $transaction");
  }
}

void findLargeTransaction() {
  for (final transaction in transactions) {
    if (transaction > 50000) {
      print("Large transaction: $transaction");
      break;
    }
  }
}

void displayTransactionSummary() {
  double total = 0;

  for (final transaction in transactions) {
    total += transaction;
  }

  print("Transaction total: $total");
}

void main() {
  checkAccountStatus();

  withdraw(10000);

  displayTransactions();

  displayDeposits();

  findLargeTransaction();

  displayTransactionSummary();
}
