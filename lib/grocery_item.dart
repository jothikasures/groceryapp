import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;
  final Color color;
  final void Function()? onPressed;
  final TextEditingController quantityController;
  final void Function(String)? onQuantityChanged;

  const GroceryItemTile({
    Key? key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.onPressed,
    required this.quantityController,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              imageUrl,
              height: 77,
            ),
            MaterialButton(
              onPressed: onPressed,
              color: color,
              child: Text(
                '\$${price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
