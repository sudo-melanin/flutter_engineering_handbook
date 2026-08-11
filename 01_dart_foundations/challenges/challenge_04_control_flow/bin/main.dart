enum AccountStatus { active, suspended, closed }

AccountStatus status = AccountStatus.active;
double accountBalance = 50000000;

List<double> transactions = [50000, -25000, 100000, -15000, 30000];

void checkAccountStatus() {
  // Task 1: Use switch to display the account status.
}

void withdraw(double amount) {
  // Task 2: Validate account status, amount and balance.
}

void displayTransactions() {
  // Task 3: Use a for-in loop to display every transaction.
}

void displayDeposits() {
  // Task 4: Use continue to skip withdrawals.
}

void findLargeTransaction() {
  // Task 5: Find the first transaction greater than 50,000.
  // Use break after finding it.
}

void displayTransactionSummary() {
  // Task 6: Use a loop to calculate the total value
  // of all transactions.
}

void main() {
  checkAccountStatus();

  withdraw(10000);

  displayTransactions();

  displayDeposits();

  findLargeTransaction();

  displayTransactionSummary();
}
