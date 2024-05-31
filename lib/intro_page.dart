import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 80, right: 80, top: 250, bottom: 40),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_CqCoMQ9aF7HBbLJOPC1wmJ1WCpEuycFv3Q&s',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                "We deliver groceries at your doorstep",
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Fresh!! items Everyday..",
              style: GoogleFonts.notoSerif(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40), // Add some space before the button
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              })),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(80),
                ),
                padding: EdgeInsets.all(26),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.notoSerif(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40), // Add some space after the button
          ],
        ),
      ),
    );
  }
}
