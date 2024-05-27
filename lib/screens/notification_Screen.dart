import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.network(
                'https://media.istockphoto.com/id/1256869305/vector/congrats-poster-with-open-gift-box-ribbons-and-confetti-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=St3xCt1AzcjwDqyUbnFxqyTIHtooiq5P8MkcnRUBS3c='),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "No Notification yet",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Simply Browse,create a \nwhislist or make a puchase",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
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
                'Continue Shopping',
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
