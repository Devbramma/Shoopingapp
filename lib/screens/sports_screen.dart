import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shoppingapp/models/randomProductModel.dart';
import 'package:shoppingapp/resources/product_list_json.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';

class SportsScreen extends StatelessWidget {
  ProductList? productList;

  SportsScreen({super.key});



  void initState() {
    fetchProducts();
  }

  Future<ProductList> fetchProducts() async {
    await Future.delayed( const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().sportsJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        //leading: Icon(Icons.arrow_back,color: Colors.white,),
        actions: [
          const Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const SportsOfferSlider(),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFEfMKX29qH328bAs-l3OWplULd0NWxsmh8Q&usqp=CAU"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular Brands',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: Colors.white),
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
              const SizedBox(height: 8,),
              Container(
                child: Column(
                  children: [
                    Image.network(
                      "https://i.ytimg.com/vi/9Cj1tMxKM7s/maxresdefault.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      "https://rukminim1.flixcart.com/fk-p-ads/850/400/dp-doc/1685349827918-cli8lrtxqfgkm0x6wwr3mcrfk-Vesco%20Super%20Girl%20Pink%20-%204.jpg?q=90",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                        "https://data1.ibtimes.co.in/en/full/695925/flipkart-big-freedom-sale-2018.png?w=1199&h=400&l=50&t=40"),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      "https://pbs.twimg.com/ad_img/1133997622593589248/d98waLus?format=png&name=900x900",
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFEfMKX29qH328bAs-l3OWplULd0NWxsmh8Q&usqp=CAU"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Products For You',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: Colors.white),
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
              const SizedBox(height: 8,),
              FutureBuilder<ProductList>(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: snapshot.data!.products.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data!.products[index];
                        return GestureDetector(
                          onTap: () {
                            List<Product> filteredProducts = snapshot
                                .data!.products
                                .where((element) =>
                            element.number == product.number)
                                .map((e) => e)
                                .toList();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailScreen(
                                      product: product,
                                      filteredProducts: filteredProducts,
                                    ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Image.network(
                                    product.image,
                                    fit: BoxFit.fill,
                                    height: 130,
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(
                                    product.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Price:₹${product.price}',
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FavoriteHeartIcon(
                                        size: 20,
                                        product: product,
                                      ),
                                      SizedBox(height: 10,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(height: 8,),

            ],
          ),
        ),
      ),
    );
  }
}


class SportsOfferSlider extends StatelessWidget {
  const SportsOfferSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.0,
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
            child: Image.network(
                "https://pbs.twimg.com/media/EghpA5_U4AE7vEI.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://rukminim2.flixcart.com/fk-p-ads/850/400/dp-doc/1687953137032-cljfnps3s2idz0x54agsufcya-Vesco%20Flipkart%20Banner%203%20%283%29.jpg?q=90"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://pbs.twimg.com/ext_tw_video_thumb/1301210335932747776/pu/img/cOPynNdfA0mbkkcJ.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://pbs.twimg.com/media/CXyHksWUQAAxJrb.jpg"),
          ),
        ],
      ),
    );
  }
}
