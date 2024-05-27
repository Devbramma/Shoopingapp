import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/accessories_screen.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/models/randomProductModel.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';
import 'package:shoppingapp/resources/product_list_json.dart';

class topoffers extends StatelessWidget {
  ProductList? productList;

  topoffers({super.key});

  void initState() {
    fetchProducts();

  }

  Future<ProductList> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().topoffersJsonData);
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
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const AccessoriesOfferSlider(),

              const SizedBox(height: 8),
              Column(
                children: [
                  Image.network(
                    "https://bestmediainfo.com/uploads/2022/10/1666929229.Denver-celebrates-the-triumphs-of-men.jpg",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    "https://blog.myntra.com/wp-content/uploads/2021/03/Taavi_forays_into_Personal_Care_Range_02.jpg",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://exchange4media.gumlet.io/news-photo/107426-image261.jpg?w=400&dpr=2.6"),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://cdn.shopify.com/s/files/1/1188/2592/files/T_C_BannerT_C_Banner_Desktop_1600x300_742adfb2-79f0-45b2-b94f-35a1aa8c463d.jpg?v=1621003961"),
                  const SizedBox(
                    height: 10,
                  ),


                ],
              ),
              const SizedBox(height: 12,),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/bed/q/u/r/-original-imagpprfybspfbnh.jpeg?q=70",
                      offer: "Free Delivery",
                      title: "American Xpresso",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/wardrobe-closet/h/1/f/-original-imaggr65pxdfhbxa.jpeg?q=70",
                      offer: "Min 20% Off",
                      title: "Tom&Darein",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/tv-entertainment-unit/e/u/8/39-200-particle-board-95-etvfwwen0063p-flipkart-perfect-homes-original-imaghjqkvbdgrjwy.jpeg?q=70",
                      offer: "Assure Product",
                      title: " Webster Wood",

                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/bean-bag/u/f/z/xxxl-beanbag-royal-blue-3xl-swiner-original-imagngtnuhxh6xgq.jpeg?q=70",
                      title: "ARTEMIST",
                      offer: "Min.70% Off",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/office-study-chair/p/2/8/1-pp-polypropylene-58-shdelta-1001-savya-home-100-original-imagjuf3kfdefxg9.jpeg?q=70",
                      title: "SAVYA",
                      offer: "Scrab & Get",
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
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3qnLq9zU1kaufmudDYBXXmrkt_XIEmKXBlA&usqp=CAU"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Rated',
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
                                      // Use the toggleable heart icon here
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
            ],
          ),
        )
      ),
    );
  }
}
