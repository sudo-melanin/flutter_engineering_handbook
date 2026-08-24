class Product {
  final String name;
  final double _price;
  final String category;

  Product({
    required this.name,
    required double price,
    required this.category,
  }) : _price = price;

  double get price => _price;

  bool get isAffordable => _price < 500000;

  Product copyWith({
    String? name,
    double? price,
    String? category,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? _price,
      category: category ?? this.category,
    );
  }

  Product.fromJson(Map<String, dynamic> json)
      : name = json["name"] as String,
        _price = (json["price"] as num).toDouble(),
        category = json["category"] as String;

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": _price,
      "category": category,
    };
  }
}

void main() {
  final product = Product(
    name: "Laptop",
    price: 500000,
    category: "Electronics",
  );

  print("Original product:");
  print("Name: ${product.name}");
  print("Price: ${product.price}");
  print("Category: ${product.category}");
  print("Affordable: ${product.isAffordable}");

  final updatedProduct = product.copyWith(
    price: 450000,
  );

  print("\nUpdated product:");
  print("Name: ${updatedProduct.name}");
  print("Price: ${updatedProduct.price}");
  print("Category: ${updatedProduct.category}");
  print("Affordable: ${updatedProduct.isAffordable}");

  final data = {
    "name": "Phone",
    "price": 300000,
    "category": "Electronics",
  };

  final productFromJson = Product.fromJson(data);

  print("\nFrom JSON:");
  print("Name: ${productFromJson.name}");
  print("Price: ${productFromJson.price}");
  print("Category: ${productFromJson.category}");

  final jsonData = productFromJson.toJson();

  print("\nTo JSON:");
  print(jsonData);
}