import 'package:flutter/material.dart';
import 'grocery_item.dart';
import 'package:image/image.dart' as image; // Assuming you need it for image processing
import 'package:groceryapp/cart_model.dart';

class CartModel extends ChangeNotifier {
  final List<GroceryItem> _shopItems = <GroceryItem>[
    GroceryItem(
      name: "Avocado",
      price: 7.00,
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR12oTJG-iH0i8JgrcPWWuHVIFsWkt2noP6Yg&s",
      color: Colors.lightGreen,
    ),
    GroceryItem(
      name: "Banana",
      price: 3.00, // Consider using double for prices
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2m_4tuUyrKhS3TZ453UhuQcKS8E0zYhqLJg&s",
      color: Colors.yellow,
    ),
    GroceryItem(
        name: "Chicken",
        price: 15.00,
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM2eiiEu6xHzkCoIRPPRPyKiyoTjz0PgIBHg&s",
        color: Colors.brown.shade300),
    GroceryItem(name: "Water",
        price: 1.00,
        imageUrl: "	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnCyg8rJlz6VvUiVdp1GL9ZmrHaRDlXHexoQ&s",
        color: Colors.lightBlue),




    // ... other items
  ];

  final List<GroceryItem> _cartItems = [];

  List<GroceryItem> get shopItems => List.unmodifiable(_shopItems);
  List<GroceryItem> get cartItems => List.unmodifiable(_cartItems);

  void addToCart(GroceryItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(GroceryItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += item.price;
    }
    return totalPrice.toStringAsFixed(2);
  }

  removeItemFromCart(GroceryItem shopItem) {}
}

class GroceryItem {
  final String name;
  final double price;// Assuming price is per unit
  final String imageUrl;
  final Color color;

  const GroceryItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.color,
  });

  double calculateTotalPrice(double quantity) {
    return price * quantity; // Assuming price is per unit
  }
}

