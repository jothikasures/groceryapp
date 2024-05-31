import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/cart_model.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import 'grocery_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        ),
        backgroundColor: Colors.white,
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Good morning",
                style: GoogleFonts.notoSerif(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Let's order something fresh for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 4,
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items For You...",
                style: GoogleFonts.notoSerif(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.all(12),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      final groceryItem = value.shopItems[index];
                      return GroceryItemTile(
                        name: groceryItem.name,
                        price: groceryItem.price.toStringAsFixed(2),
                        imageUrl: groceryItem.imageUrl,
                        color: groceryItem.color,
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false).addToCart(groceryItem);
                        },
                        onQuantityChanged: (quantity) {
                          // handle quantity change if needed
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryItemTile extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final Color color;
  final VoidCallback onPressed;
  final Function(String) onQuantityChanged;

  const GroceryItemTile({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.onPressed,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: color,
        child: Column(
          children: [
            Image.network(imageUrl),
            Text(name),
            Text('\$' + price),
            // Add any additional UI elements you need here
          ],
        ),
      ),
    );
  }
}
