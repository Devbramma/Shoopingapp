import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shoppingapp/models/randomProductModel.dart';
import 'package:shoppingapp/resources/product_list_json.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';

class PersonalScreen extends StatelessWidget {
  ProductList? productList;

  PersonalScreen({super.key});



  void initState() {
    fetchProducts();
  }

  Future<ProductList> fetchProducts() async {
    await Future.delayed( const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().personalJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
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
              const PersonalOfferSlider(),
              const SizedBox(height: 12,),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://t3.ftcdn.net/jpg/05/12/99/90/360_F_512999040_7qVgUN39ZMif3RZI9PkUwAv6yVpmX4UU.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'GLam With Your Global Brands',
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/sunscreen/c/j/p/100-sun-expert-ultra-matte-sun-fairness-sunscreen-lotion-spf-pa-original-imagzqwndgbn9zrw.jpeg?q=70",
                      offer: "Free Delivery",
                      title: "Sun Cream",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/perfume/i/r/3/100-td-versus-diamond-100-ml-perfume-eau-de-parfum-tom-darin-original-imagm8g2kt7nn9fc.jpeg?q=70",
                      offer: "Min 20% Off",
                      title: "Tom&Darein",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/kqpj4i80/hair-styling/o/f/e/hair-wax-50-hair-styling-wax-beoman-original-imag4nrjfyjwuyxw.jpeg?q=70",
                      offer: "Assure Product",
                      title: "Be O Man",

                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/kiow6fk0/moisturizer-cream/x/s/5/100-creme-cream-nivea-original-imafyf68z9mzxykx.jpeg?q=70",
                      title: "NIVEA",
                      offer: "Min.70% Off",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/hair-oil/t/o/i/-original-imagqwzz2hmpbbwb.jpeg?q=70",
                      title: "Indulekha",
                      offer: "Scrab & Get",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Image.network("https://blog.getdistributors.com/wp-content/uploads/2020/11/Kalpshree.jpg"),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://t3.ftcdn.net/jpg/03/27/85/64/360_F_327856427_5etgMi261q5lAWAUrOntieHfLOZcPMKL.webp"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Make Ups & Fragrance',
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
                      physics:  const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 22.0,
                        mainAxisSpacing: 22.0,
                      ),
                      itemCount: snapshot.data!.products.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data!.products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  product: product,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            child: GridTile(
                              footer: GridTileBar(
                                backgroundColor: Colors.white,
                                title: Text(
                                  product.title,
                                  style: const TextStyle(color: Colors.black, fontSize: 12),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price:₹${product.price}',
                                      style: const TextStyle(color: Colors.green, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                    FavoriteHeartIcon(size: 20,product: product,), // Use the toggleable heart icon here
                                  ],
                                ),
                              ),
                              child: Image.network(product.image,fit: BoxFit.cover,),
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
        ),
      ),
    );
  }
}

class PersonalOfferSlider extends StatelessWidget {
  const PersonalOfferSlider({
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
                "https://i.ytimg.com/vi/XJLT0vAwqvU/maxresdefault.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://rukminim1.flixcart.com/image/850/1000/jm9hfgw0/combo-kit/u/g/y/palmolive-complete-care-combo-5141710529100104-colgate-original-imaf97dnney9gzyr.jpeg?q=90"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://rukminim1.flixcart.com/fk-p-flap/850/400/image/1881b7871a1a80bd.jpeg?q=20"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://rukminim2.flixcart.com/fk-p-flap/1100/500/image/644f22e65039870e.jpeg?q=90"),
          ),
        ],
      ),
    );
  }
}