import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shoppingapp/models/randomProductModel.dart';
import 'package:shoppingapp/resources/product_list_json.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';

class AccessoriesScreen extends StatelessWidget {
  ProductList? productList;

  AccessoriesScreen({super.key});




  void initState() {
    fetchProducts();
  }

  Future<ProductList> fetchProducts() async {
    await Future.delayed( const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().accessoriesJsonData);
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
              const AccessoriesOfferSlider(),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfjogj_WFpnH1ylMI9iSjKN4nGO8jMrgp2Hw&usqp=CAU"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Deals For You',
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
                        childAspectRatio: 0.55,
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
                                    FavoriteHeartIcon(size: 20,product: product,),
                                  ],
                                ),
                              ),
                              child: Image.network(product.image),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/rm422-073.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=ef48caa87980815f77343e682d6324ee"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sponsored You',
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/l0zm64w0/car-interior-cleaner/k/o/y/1000-microfiber-car-cleaning-cloth-for-detailing-polishing-800-original-imagcnjzhymxwpbg.jpeg?q=70",
                      offer: "Free Delivery",
                      title: "E-Generics",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/hose-pipe/1/i/d/1-12-5-30-meter-100-feet-1-2-inch-12-5mm-3-layered-braided-water-original-imagqz3grjf5s6mx.jpeg?q=70",
                      offer: "Min 20% Off",
                      title: "MASKHI",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/jc7z0y80/mobile-accessories-combo/f/k/u/fast-charging-4-kooniv-original-imaexww3ryrgezjd.jpeg?q=70",
                      offer: "Assure Product",
                      title: "KAY-KON",

                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/kwgpz0w0/shopsy-headphone/p/e/x/yes-combo-selfie-stick-tripod-bluetooth-headphone-with-mic-original-imag95y6mz3vrwkg.jpeg?q=70",
                      title: "REE-PUD",
                      offer: "Min.70% Off",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/l4ssfww0/battery-charger/r/e/s/-original-imagfm8gqyf5nqug.jpeg?q=70",
                      title: "ZEBRONICS",
                      offer: "Scrab & Get",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
            Image.network('https://www.paisabazaar.com/wp-content/uploads/2022/11/Flipkart-Axis-Bank-CC.jpg'),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfjogj_WFpnH1ylMI9iSjKN4nGO8jMrgp2Hw&usqp=CAU"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Offers For You',
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
                                    FavoriteHeartIcon(size: 20,product: product,),
                                  ],
                                ),
                              ),
                              child: Image.network(product.image),
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


class AccessoriesOfferSlider extends StatelessWidget {
  const AccessoriesOfferSlider({
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
                "https://media.fashionnetwork.com/m/9bbd/9239/870e/e447/99b3/8373/ab91/11fa/889e/3896/3896.jpeg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://images.livemint.com/img/2022/05/07/1600x900/Flipkart_1651933581405_1651933593333.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://static-ai.asianetnews.com/images/01fy17tz5xmc6g1mj65sw3qa3m/untitled-design--22-_710x400xt.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://www.exchange4media.com/news-photo/99713.Realme.jpg"),
          ),
        ],
      ),
    );
  }
}