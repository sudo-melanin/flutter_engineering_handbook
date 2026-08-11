String songName = "Enemy of the Pen";
String artistName = "Aimz";
String albumName = "Can of Worms";
int releaseYear = 2026;
double durationInMinutes = 3.5;
bool isCensored = true;

String accountName = "Amos Emmanuel";
String accountNumber = "0123456789";
int accountTier = 2;
bool isActive = true;
double accountBalance = 290000000.8;

void playSong() {
  print("Now playing $songName");
}

void pauseSong() {
  print("Song is paused");
}

void likeSong(String songName) {
  print("You liked $songName");
}

void deposit(double amount) {
  if (amount > 0) {
    accountBalance += amount;
    print("Successfully deposited $amount");
  } else {
    print("Deposit amount must be greater than 0");
  }
}

void withdraw(double amount) {
  if (amount > accountBalance) {
    print("Insufficient balance");
  } else if (amount <= 0) {
    print("Withdrawal amount must be greater than 0");
  } else {
    accountBalance -= amount;
    print("Successfully withdrew $amount");
  }
}

void main() {
  playSong();
  pauseSong();
  likeSong(songName);

  deposit(50000);
  withdraw(25000);

  print("Current balance: $accountBalance");
}
