// ============================================
// BANK ACCOUNT DATA
// ============================================

String accountName = "Amos Emmanuel";
String accountNumber = "0123456789";
double accountBalance = 290000000.80;
int accountTier = 2;
bool isActive = true;

// ============================================
// BANK ACCOUNT BEHAVIOURS
// ============================================

void welcomeCustomer() {
  print("Welcome back, $accountName!");
}

void checkBalance() {
  print("Your current balance is ₦$accountBalance");
}

void deposit(double amount) {
  accountBalance += amount;
  print("Successfully deposited ₦$amount");
}

void withdraw(double amount) {
  accountBalance -= amount;
  print("Successfully withdrew ₦$amount");
}

void main() {
  print("=================================");
  print(" SIMPLE BANKING SYSTEM");
  print("=================================\n");

  welcomeCustomer();

  checkBalance();

  print("");

  deposit(50000);

  checkBalance();

  print("");

  withdraw(10000);

  checkBalance();
}