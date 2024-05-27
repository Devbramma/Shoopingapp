import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:shoppingapp/models/randomProductModel.dart';

import 'package:shoppingapp/resources/product_list_json.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';

class MobileScreen extends StatelessWidget {
  ProductList? productList;

  MobileScreen({super.key});

  void initState() {
    fetchProducts();
  }

  Future<ProductList> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().mobileJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        //leading: Icon(Icons.arrow_back,color: Colors.white,),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const MobileOfferSlider(),
              const SizedBox(
                height: 16,
              ),
              const MobileMenuStripe(),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  Image.network(
                    "https://images.news18.com/ibnlive/uploads/2021/04/1618895227_vivo_v21_5g.jpg?im=FitAndFill=(1200,675)",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    "https://images.indianexpress.com/2017/11/redmiy1_new_1.jpg",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://pbs.twimg.com/media/E3CnZYdVcAElyps.jpg"),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://images.indianexpress.com/2020/01/oppo-f15-759-1.jpg"),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://static-cse.canva.com/blob/572626/1.magebyRodionKutsaevviaUnsplash.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Best Selling Phones',
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
              const SizedBox(
                height: 16,
              ),
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
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price:₹${product.price}',
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    FavoriteHeartIcon(
                                      size: 20,
                                      product: product,
                                    ),
                                    // Use the toggleable heart icon here
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

class MobileOfferSlider extends StatelessWidget {
  const MobileOfferSlider({
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
                "https://s3b.cashify.in/gpro/uploads/2021/09/15140000/Best-Smartphone-Deals-on-Flipkart-Big-Billion-Day-Sale.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://gumlet.assettype.com/afaqs%2F2022-06%2Fa43ee35b-18cb-4c7f-ac17-63c14a79207f%2FAlia_Bhatt_Flipkart_Fashion_EOSS.jpg?w=1200&auto=format%2Ccompress&ogImage=true"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://i.gadgets360cdn.com/large/flipkart_big_saving_days_sale_1651580570504.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://awbi.org/wp-content/uploads/2023/01/Flipkart-Upcoming-Sale-February-2023.jpg.webp"),
          ),
        ],
      ),
    );
  }
}

class MobileMenuStripe extends StatelessWidget {
  const MobileMenuStripe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: const BoxDecoration(color: Colors.white),
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 0.7,
        scrollDirection: Axis.horizontal,
        children: const [
          MenuStripeItem(
            imageUrl: 'samsung',
            itemLabel: 'SAMSUNG',
          ),
          MenuStripeItem(
            imageUrl: 'asus',
            itemLabel: 'ASUS',
          ),
          MenuStripeItem(
            itemLabel: 'POCO',
            imageUrl: 'poco',
          ),
          MenuStripeItem(
            itemLabel: 'real me',
            imageUrl: 'realme',
          ),
          MenuStripeItem(
            itemLabel: 'VIVO',
            imageUrl: 'vivo',
          ),
          MenuStripeItem(
            itemLabel: 'mi',
            imageUrl: 'mi',
          ),
        ],
      ),
    );
  }
}
