# Lesson 08: Classes, Objects & Models

## What You'll Learn

- Classes and objects
- Constructors
- Named constructors
- Methods
- Getters and setters
- Private fields
- Encapsulation
- Immutable models
- `copyWith()`
- `fromJson()`
- `toJson()`

## 1. Classes and Objects

A class is a blueprint for creating objects.

    class Player {
      String name;
      int age;

      Player(this.name, this.age);
    }

Create an object:

    final player = Player("Amos", 28);

The class defines what the object contains, while the object is an actual instance created from that class.

## 2. Constructors

Constructors initialise objects.

    class User {
      String name;
      String email;

      User({
        required this.name,
        required this.email,
      });
    }

Create an object:

    final user = User(
      name: "Amos",
      email: "amos@example.com",
    );

## 3. Named Constructors

A class can have alternative ways of creating objects.

    class User {
      String name;
      String role;

      User({
        required this.name,
        required this.role,
      });

      User.guest()
          : name = "Guest",
            role = "guest";
    }

Now we have two ways to create a `User`:

    final user = User(
      name: "Amos",
      role: "user",
    );

    final guest = User.guest();

## 4. Methods

Methods perform actions.

    class BankAccount {
      double balance;

      BankAccount(this.balance);

      void deposit(double amount) {
        balance += amount;
      }
    }

Call the method:

    account.deposit(5000);

A method can return a value or return nothing using `void`.

## 5. Getters

A getter provides controlled access to a value.

    class BankAccount {
      double _balance;

      BankAccount(this._balance);

      double get balance => _balance;
    }

A getter is accessed like a property:

    print(account.balance);

It does not need parentheses.

## 6. Setters

A setter controls how a property is changed.

    class BankAccount {
      double _balance;

      BankAccount(this._balance);

      set balance(double amount) {
        if (amount >= 0) {
          _balance = amount;
        }
      }
    }

Now:

    account.balance = 750000;

The setter can validate the value before changing the internal field.

## 7. Encapsulation

An underscore makes a field private to the Dart library.

    class BankAccount {
      double _balance;

      BankAccount(this._balance);

      double get balance => _balance;
    }

The `_balance` field should not be accessed directly from outside the library.

Instead, the getter provides the public interface:

    print(account.balance);

This allows the class to control how its internal data is accessed or changed.

## 8. Immutable Models

A `final` field cannot be reassigned after the object has been created.

    class User {
      final String name;
      final String email;

      User({
        required this.name,
        required this.email,
      });
    }

This is not allowed:

    user.name = "John";

The class itself is the blueprint. `final` simply makes the individual object's field immutable after construction.

## 9. `copyWith()`

`copyWith()` creates a new object while allowing selected values to change.

    class User {
      final String name;
      final String email;

      User({
        required this.name,
        required this.email,
      });

      User copyWith({
        String? name,
        String? email,
      }) {
        return User(
          name: name ?? this.name,
          email: email ?? this.email,
        );
      }
    }

Example:

    final updatedUser = user.copyWith(
      name: "John",
    );

The original object remains unchanged.

The nullable parameters in `copyWith()` represent optional replacement values.

    name ?? this.name

means:

- Use the new `name` if one was provided.
- Otherwise, keep the existing name.

## 10. `fromJson()`

`fromJson()` is commonly implemented as a named constructor that creates a model from a map.

    class Product {
      final String name;
      final double price;
      final String category;

      Product({
        required this.name,
        required this.price,
        required this.category,
      });

      Product.fromJson(Map<String, dynamic> json)
          : name = json["name"] as String,
            price = (json["price"] as num).toDouble(),
            category = json["category"] as String;
    }

Example:

    final data = {
      "name": "Laptop",
      "price": 500000,
      "category": "Electronics",
    };

    final product = Product.fromJson(data);

The flow is:

    Map<String, dynamic>
            ↓
        fromJson()
            ↓
         Product

## 11. `toJson()`

`toJson()` performs the reverse conversion.

    Map<String, dynamic> toJson() {
      return {
        "name": name,
        "price": price,
        "category": category,
      };
    }

Example:

    final data = product.toJson();

The flow is:

    Product
       ↓
    toJson()
       ↓
    Map<String, dynamic>

## 12. `as` vs Conversion

When reading JSON data, remember that `as` does not convert a value.

This:

    json["price"] as double

checks that the value is already a `double`.

If the API gives us an integer such as:

    500000

then `as double` will not convert it.

A safer approach for numeric values is:

    (json["price"] as num).toDouble()

`num` covers both `int` and `double`.

## 13. `jsonDecode()` and `jsonEncode()`

`jsonDecode()` converts a JSON string into Dart data.

    final data = jsonDecode(response.body);

After decoding, we can pass the resulting map to `fromJson()`:

    final product = Product.fromJson(data);

The complete flow is:

    JSON string
         ↓
    jsonDecode()
         ↓
    Map<String, dynamic>
         ↓
    fromJson()
         ↓
    Product

The reverse flow is:

    Product
       ↓
    toJson()
       ↓
    Map<String, dynamic>
       ↓
    jsonEncode()
       ↓
    JSON string

`fromJson()` and `toJson()` are model conversion methods.

`jsonDecode()` and `jsonEncode()` handle conversion between JSON strings and Dart data structures.

## Key Takeaways

- A class is a blueprint for objects.
- An object is an instance of a class.
- Constructors build objects.
- Named constructors provide alternative construction paths.
- Methods perform actions.
- Getters provide property-like access.
- Setters control how properties are changed.
- Private fields help with encapsulation.
- `final` fields support immutable models.
- `copyWith()` creates a modified copy without changing the original.
- `fromJson()` converts a map into a model.
- `toJson()` converts a model into a map.
- `jsonDecode()` converts JSON text into Dart data.
- `jsonEncode()` converts Dart data into JSON text.