import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shoppingapp/models/randomProductModel.dart';
import 'package:shoppingapp/resources/product_list_json.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';

class ToysScreen extends StatelessWidget {
  ProductList? productList;

  ToysScreen({super.key});





  void initState() {
    fetchProducts();
  }

  Future<ProductList> fetchProducts() async {
    await Future.delayed( const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().toysJsonData);
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
              const ToysOfferSlider(),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQevXTTDAtF4LhYuwKpx512SUKgH3cjfuiMBg&usqp=CAU"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sponsored',
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
                      "https://rukminim2.flixcart.com/image/832/832/koudfgw0/block-construction/d/v/o/building-blocks-pimi-trends-original-imag37xzyghf8rmq.jpeg?q=70",
                      offer: "Free Delivery",
                      title: "JUSTICE LEAGUE",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/k2dm7bk0/puzzle/w/c/e/18-frozen-2-first-puzzles-frank-original-imafhqv8fsyvrhwp.jpeg?q=70",
                      offer: "Min 20% Off",
                      title: "Frank Frozen",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/card-game/u/t/9/10-uno-playing-card-game-for-kids-pack-of-1-multicolor-spiritual-original-imagh56guwukqrqg.jpeg?q=70",
                      offer: "Assure Product",
                      title: "AL ATASH UNO",

                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/block-construction/l/5/a/best-buy-happy-house-building-blocks-creative-learning-toy-original-imagmxmx8fd4g8wz.jpeg?q=70",
                      title: "Kluzie BEST BUY",
                      offer: "Min.70% Off",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/kctf0cw0/remote-control-toy/w/g/p/360-degree-rotation-stunt-racing-car-rc-cars-flip-and-roll-stunt-original-imaftu8zehu7n9y7.jpeg?q=70",
                      title: "Ruhani",
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
                          "https://marketplace.canva.com/EAD2962NKnQ/2/0/1600w/canva-rainbow-gradient-pink-and-purple-virtual-background-_Tcjok-d9b4.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Rated Product',
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
              Column(
                children: [
                  Image.network(
                    "https://www.dailyneeds247.com/wp-content/uploads/2020/05/babycare-prod-banner-1_r.jpg",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    "https://www.mommypure.com/cdn/shop/collections/Category_Banner-_Combos.jpg?v=1625718792",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://cdn.trendhunterstatic.com/phpthumbnails/205/205990/205990_1_800.jpeg"),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://cdn.create.vista.com/downloads/3acc7682-a007-443e-9a85-d23605a395b0_1024.jpeg"),
                  const SizedBox(
                    height: 10,
                  ),


                ],
              ),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/free-vector/abstract-blue-geometric-shapes-background_1035-17545.jpg?w=2000"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Most Viewed Products',
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
                                      SizedBox(height: 8),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/free-vector/watercolor-sugar-cotton-clouds-background_52683-80661.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Company Products',
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
              Image.network("https://cdn.create.vista.com/downloads/3acc7682-a007-443e-9a85-d23605a395b0_640.jpeg"),
              SizedBox(height: 16,)




            ],
          ),
        ),
      ),
    );
  }
}
class ToysOfferSlider extends StatelessWidget {
  const ToysOfferSlider({
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
                "https://rukminim1.flixcart.com/fk-p-flap/850/400/image/1bf15e7241f093c9.jpg?q=90"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://www.kidstoys.us/cdn/shop/files/Slide-1_3f38560b-8351-45dc-89bf-7abee706ddbd_x800.jpg?v=1614294043"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://i.ytimg.com/vi/mpuuJ7PJLwk/maxresdefault.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://www.socialsamosa.com/wp-content/uploads/2017/12/New-Pinch-Days-campaign.jpg"),
          ),
        ],
      ),
    );
  }
}