import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import '../models/randomProductModel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // late  List<Product> _cartItemList = [];

  Future<List<Product>> getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('add_to_cart');


    if (cartItems != null) {
      return cartItems.map((jsonString) {
        return Product.fromJson(json.decode(jsonString));
      }).toList();
    } else {
      return [];
    }
  }

  @override
  void initState() {
    getCartItems().then((value) {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          height: 50.0,
          width: 130.0,
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: getCartItems(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.isEmpty ?? true) {
              return  Center(
                child: Column(
                  children: [
                    Image.network('https://img.freepik.com/premium-vector/shopping-cart-with-cross-mark-wireless-paymant-icon-shopping-bag-failure-paymant-sign-online-shopping-vector_662353-912.jpg'),
                    const SizedBox(height: 10,),
                    const Text(
                      'Cart is Empty !',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    const SizedBox(height: 20,),
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
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Colors.white,
                      leading: Image.network(
                        snapshot.data?[index].image ?? '',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        snapshot.data?[index].title ?? "",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price: ₹${snapshot.data?[index].price}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          removeFromCart(index).then((value) {
                            getCartItems().then((value) {
                              setState(() {});
                            });
                          });
                        },
                        icon: Icon(
                          Icons.delete_rounded,
                          color: Colors.red.shade300,
                        ),
                      ),

                      onTap: () {

                      },
                    );
                  });
            }
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<void> removeFromCart(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('add_to_cart');

    cartItems ??= [];

    if (cartItems.isEmpty) {
      return;
    }

    cartItems.removeAt(index);

    await prefs.setStringList('add_to_cart', cartItems);
  }
}
