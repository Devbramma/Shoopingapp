import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.network(
                'https://www.iconbunny.com/icons/media/catalog/product/1/0/1036.13-cancel-order-icon-iconbunny.jpg'),

            const Text(
              "You have no orders",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),

            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,

              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllCategories()),
                );
              },
              child: const Text(
                'Start Shopping',
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
