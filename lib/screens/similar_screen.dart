import 'package:flutter/material.dart';
import 'package:shoppingapp/models/randomProductModel.dart';

class SimilarScreen extends StatefulWidget {
  final Product product;

  const SimilarScreen({super.key, required this.product});

  @override
  State<SimilarScreen> createState() => _SimilarScreenState();
}

class _SimilarScreenState extends State<SimilarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.brand,
          style:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: false,
      ),
    );
  }
}
