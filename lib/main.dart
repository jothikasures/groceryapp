import 'package:flutter/material.dart';
import 'package:groceryapp/cart_model.dart';
import 'package:groceryapp/intro_page.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(create: (context)=> CartModel(),
       child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Intropage(),
    ),
    );
  }
  }

