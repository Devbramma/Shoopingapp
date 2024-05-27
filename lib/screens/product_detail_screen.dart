import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/screens/Categories_icon.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/grocery_screen.dart';
import '../models/randomProductModel.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final List<Product>? filteredProducts;

  const ProductDetailScreen(
      {super.key, required this.product, this.filteredProducts});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _addedToCart = false;

  Future<void> addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('add_to_cart');

    cartItems ??= [];

    cartItems.add(json.encode(widget.product.toJson()));

    await prefs.setStringList('add_to_cart', cartItems);

    setState(() {
      _addedToCart = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: ImageSlideshow(
                    indicatorBackgroundColor: Colors.white,
                    indicatorColor: Colors.redAccent,
                    height: 300,
                    autoPlayInterval: 3000,
                    indicatorRadius: 4,
                    isLoop: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.network(widget.product.image),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.network(widget.product.image2),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.network(widget.product.image3),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.network(widget.product.image4),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.product.brand,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              const SizedBox(height: 10.0),
              Text(
                widget.product.title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Special Price',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                '₹${widget.product.price}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.product.gender,
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              const SizedBox(height: 8.0),
              Text(widget.product.size.join(", ")),
              const SizedBox(height: 8.0),
              const Text(
                "Description:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.product.description,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18.0),
              Row(
                children: [
                  Card(
                    child: TextButton(
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: const Text(
                        'Available Offers',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Card(
                    child: TextButton(
                      onPressed: () {
                        scratchDialog(context);
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: const Text(
                        'Coupons',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await addToCart();
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.orange,
                              content: Center(
                                child: Column(
                                  children: [
                                    const Text(
                                      'Product added to cart!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                      ),
                                      child: const Text(
                                        'Go To Cart',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const CartScreen()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _addedToCart ? Colors.green : Colors.orange,
                      ),
                      child: Text(
                        _addedToCart ? 'Product Added' : 'Add to Cart',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3BujfUSNxyBdrNZ6l229V_HqC0EGmqV_1vA&usqp=CAU"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Featured on Flipkart',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Center(
                            child: Text(
                              'View All',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const GroceryOfferSlider(),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS02DJlJLkYiNZ-VGuLU_5aAzoZNpoKfcBxYw&usqp=CAU"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Similar Products',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Center(
                            child: Text(
                              'View All',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 180,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.network(
                                widget.filteredProducts?[index].image ??
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                                fit: BoxFit.fill,
                                height: 100,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                widget.filteredProducts?[index].brand ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Row(
                              //   mainAxisAlignment:
                              //   MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              // "₹${widget.filteredProducts?[index].price ?? ""}",
                              //       style: const TextStyle(
                              //         color: Colors.green,
                              //         fontSize: 15,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.filteredProducts?.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: allOffers.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allOffers[index].title,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          allOffers[index].description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

final List<Offer> allOffers = [
  Offer(
    title:
        'Bank Offer: Flat ₹3,000 Off on HDFC Bank Credit Card EMI Trxns on orders priced between ₹40,000 to ₹49,999.',
    description: 'T&C',
  ),
  Offer(
    title:
        'Buy this product & get ₹500 Off on your next Voltas Beko Refrigerator purchase.',
    description: 'T&C',
  ),
  Offer(
    title:
        'Bank Offer: Flat ₹4,000 Off on HDFC Bank Credit Card EMI Trxns on orders of ₹50,000 and above.',
    description: 'T&C',
  ),
  Offer(
      title:
          'Extra ₹500 Off on Bikes & Scooters on purchase of ₹30,000 or more',
      description: 'T&C'),
  Offer(
      title:
          'Sign-up for Flipkart Pay Later & get free Times Prime Benefits worth ₹10,000',
      description: 'T&C'),
  Offer(
      title:
          'Partner OfferApply & get ₹10,000 Times Prime benefits + ₹1,000 Gift Card* with Flipkart Axis Bank Credit Card',
      description: 'T&C'),
  Offer(
      title: 'Bank Offer5% Cashback on Flipkart Axis Bank Card',
      description: 'T&C'),
  Offer(
      title:
          'Buy this product & get ₹500 Off on your next LG Refrigerator purchase',
      description: 'T&C'),
];

class Offer {
  final String title;
  final String description;

  Offer({required this.title, required this.description});
}
