# Challenge 08: Classes, Objects & Models

## Goal

Build a `Product` model that demonstrates:

- Classes and objects
- Constructors
- Getters and setters
- Encapsulation
- Immutable fields
- `copyWith()`
- `fromJson()`
- `toJson()`

## Tasks

### Task 1: Create the Product class

Create a `Product` class with:

- `name`
- `price`
- `category`

Make the appropriate fields `final`.

### Task 2: Create the constructor

Create a constructor using required named parameters.

### Task 3: Add encapsulation

Create a private `_price` field.

Add:

- A getter for `price`

The price should be immutable.

### Task 4: Create `isAffordable`

Create a getter called `isAffordable`.

It should return `true` when the price is below `500000`.

### Task 5: Create `copyWith()`

Create a `copyWith()` method that creates a new `Product` while allowing selected values to change.

For example:

    final updatedProduct = product.copyWith(
      price: 450000,
    );

The original product should remain unchanged.

### Task 6: Create `fromJson()`

Create a named constructor:

    Product.fromJson(...)

It should accept:

    Map<String, dynamic>

and use the map to create a `Product`.

Remember that numeric values may arrive as either `int` or `double`.

### Task 7: Create `toJson()`

Create:

    Map<String, dynamic> toJson()

It should convert the product into a map containing:

- `name`
- `price`
- `category`

### Task 8: Test the model

Create a product and:

1. Print its details.
2. Test `isAffordable`.
3. Create an updated product using `copyWith()`.
4. Confirm the original product remains unchanged.
5. Create a product using `fromJson()`.
6. Convert a product back to a map using `toJson()`.

## Expected Concepts

    Class
      ↓
    Object

    Private field
      ↓
    Getter / Setter

    final fields
      ↓
    Immutable object

    copyWith()
      ↓
    New modified object

    fromJson()
      ↓
    Map → Model

    toJson()
      ↓
    Model → Map