String? userName;
String? userEmail;
String? userPhone;

List<String?> notifications = [
  "Welcome to the app",
  null,
  "You have a new message",
  null,
];


String getDisplayName() {
  return userName ?? "Guest";
}


int getEmailLength() {
  return userEmail?.length ?? 0;
}


void setDefaultPhone() {
  userPhone ??= "Not provided";
}


void displayPhone() {
  if (userPhone != null) {
    print(userPhone);
  } else {
    print("Phone number not available");
  }
}


String findNotification(String? notification) {
  return notification ?? "No notification";
}


void displayNotifications() {
  for (String? notification in notifications) {
    if (notification == null) {
      continue;
    }

    print(notification);
  }
}


void getUserSummary() {
  print("Name: ${userName ?? "User Name"}");
  print("Email: ${userEmail ?? "Email"}");
  print("Phone: ${userPhone ?? "Phone"}");
}


String getSafeUsername(String? username) {
  return username ?? "Anonymous";
}


void main() {
  print(getDisplayName());

  print("Email length: ${getEmailLength()}");

  setDefaultPhone();

  displayPhone();

  print(findNotification(null));

  displayNotifications();

  getUserSummary();

  print("Safe username: ${getSafeUsername(null)}");
}