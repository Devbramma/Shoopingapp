import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/randomProductModel.dart';

class WhishlistScreen extends StatefulWidget {
  const WhishlistScreen({super.key});

  @override
  State<WhishlistScreen> createState() => _WhishlistScreenState();
}

class _WhishlistScreenState extends State<WhishlistScreen> {
  // late  List<Product> _cartItemList = [];

  Future<List<Product>> getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('add_to_liked');



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
                    Image.network('https://img.freepik.com/premium-vector/heart-with-plus-positive-sign-wishlist-charity-element_598264-338.jpg'),
                    Text(
                      'Whislist is Empty !',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
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
                          Icons.favorite,
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
          }
          else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<void> removeFromCart(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('add_to_liked');

    cartItems ??= [];

    if (cartItems.isEmpty) {
      return;
    }

    cartItems.removeAt(index);

    await prefs.setStringList('add_to_liked', cartItems);
  }
}