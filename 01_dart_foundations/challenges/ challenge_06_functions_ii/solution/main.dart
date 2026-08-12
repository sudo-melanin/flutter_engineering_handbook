enum AccountTier {
  basic,
  premium,
  business,
}

double accountBalance = 500000;

double calculateBalance(double balance, double amount) {
  return balance - amount;
}

double calculateTransfer({
  required double balance,
  required double amount,
}) {
  return balance - amount;
}

double calculateTransferWithFee({
  required double balance,
  required double amount,
  double fee = 100,
}) {
  return balance - amount - fee;
}

void displayAccount(
  String accountName,
  [AccountTier tier = AccountTier.basic]
) {
  print("Account: $accountName");

  switch (tier) {
    case AccountTier.basic:
      print("Tier: Basic");

    case AccountTier.premium:
      print("Tier: Premium");

    case AccountTier.business:
      print("Tier: Business");
  }
}

String getAccountStatus(double balance) {
  return balance > 0 ? "Active" : "Empty";
}

double calculateFinalBalance({
  required double balance,
  required double withdrawal,
  double fee = 100,
}) {
  if (withdrawal + fee > balance) {
    return balance;
  }

  return balance - withdrawal - fee;
}

void main() {
  print(calculateBalance(500000, 50000));

  print(
    calculateTransfer(
      balance: 500000,
      amount: 100000,
    ),
  );

  print(
    calculateTransferWithFee(
      balance: 500000,
      amount: 100000,
    ),
  );

  displayAccount("Amos");
  displayAccount("Amos", AccountTier.premium);

  print(getAccountStatus(accountBalance));

  print(
    calculateFinalBalance(
      balance: 500000,
      withdrawal: 100000,
    ),
  );
}