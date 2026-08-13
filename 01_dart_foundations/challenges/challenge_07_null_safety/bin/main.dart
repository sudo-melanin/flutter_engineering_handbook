String? userName;
String? userEmail;
String? userPhone;

List<String?> notifications = [
  "Welcome to the app",
  null,
  "You have a new message",
  null,
];


// Task 1:
// Create a function called getDisplayName().
// It should return the user's name if it exists.
// If the name is null, return "Guest".
// Use the ?? operator.

// Task 2:

// Create a function called getEmailLength().
// It should return the length of the user's email.
// If the email is null, return 0.
// Use ?. and ??.


// Task 3:

// Create a function called setDefaultPhone().
// If userPhone is null, assign "Not provided" to it.
// Use ??=.


// Task 4:

// Create a function called displayPhone().
// If userPhone contains a value, print the phone number.
// If it is null, print "Phone number not available".
// Use an if statement to check for null.


// Task 5:

// Create a function called findNotification().
// It should accept a nullable String.
// Return the notification if it exists.
// If the value is null, return "No notification".


// Task 6:

// Create a function called displayNotifications().
// Iterate through the notifications list.
// For each notification:
// - Print the notification if it is not null.
// - Ignore null values.
// Do not use !.


// Task 7:

// Create a function called getUserSummary().
// It should display:
// - User name
// - Email
// - Phone
//
// Use null-aware operators to provide sensible fallback values.


// Task 8 — Final Challenge:

// Create a function called getSafeUsername().
//
// It should:
// - Accept a nullable username.
// - Return the username when it exists.
// - Return "Anonymous" when it is null.
// - Return a non-nullable String.
//
// Do not use !.


void main() {
  // Test your functions here.

}