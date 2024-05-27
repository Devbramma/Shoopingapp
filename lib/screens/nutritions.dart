import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shoppingapp/models/randomProductModel.dart';
import 'package:shoppingapp/resources/product_list_json.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';

class NutritionsScreen extends StatelessWidget {
  ProductList? productList;

  NutritionsScreen({super.key});

  void initState() {
    fetchProducts();
  }
  Future<ProductList> fetchProducts() async {
    await Future.delayed( const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().nutritionsJsonData);
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
              const NutritionOfferSlider(),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://c4.wallpaperflare.com/wallpaper/165/275/593/colorful-windows-10-gradient-minimalism-soft-gradient-hd-wallpaper-preview.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Global Brands',
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
              Image.network("https://mms.businesswire.com/media/20140423006424/en/412514/5/RSPSignatureGraphic.jpg"),
              const SizedBox(height: 8,),
              Image.network("https://alpha-mos.com/sites/default/files/styles/image_une/public/alphamos/reference-client/images/optimum_nutrition_products.png?itok=BU5t5gFS"),
              const SizedBox(height: 8,),

              const SizedBox(height: 8,),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/l3t2fm80/protein-supplement/o/x/1/bcaa-rapid-energy-pro-500g-orange-glutamine-citrulline-multi-original-imageuaymhyngmkw.jpeg?q=70",
                      offer: "Free Delivery",
                      title: "STAR-X",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/klmmrgw0/protein-supplement/k/v/a/shredz-pre-preworkout-15-servings-lean-muscles-building-strength-original-imagypmzc26sgwg8.jpeg?q=70",
                      offer: "Min 20% Off",
                      title: "BIG MUSCLES",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/kskotjk0/protein-supplement/0/w/q/plant-based-protein-weight-loss-single-pack-formula-1-kulfi-original-imag63uz744ztehf.jpeg?q=70",
                      offer: "Assure Product",
                      title: "Herbal Life",

                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/protein-supplement/6/i/p/protein-shake-nutritional-supplements-dha-chocolate-flavour-original-imagh3henqft5fbh.jpeg?q=70",
                      title: "Choco Sure",
                      offer: "Min.70% Off",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/kvifekw0/protein-supplement/o/2/x/whey-protein-diabetes-with-sugar-free-nutrition-health-original-imag8dvq9695xsz5.jpeg?q=70",
                      title: "Damn Sure",
                      offer: "Only 3 Left",
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
                          "https://www.shutterstock.com/shutterstock/photos/1939183975/display_1500/stock-vector-luxury-gray-abstract-background-modern-layout-design-studio-room-business-report-with-smooth-1939183975.jpg"),
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
              const SizedBox(height: 12,),
              Column(
                children: [
                  Image.network(
                    "https://www.kreedon.com/wp-content/uploads/2022/08/TARA-NUTRICARE-Category-Banner.jpg.webp",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    "https://2.bp.blogspot.com/-na_-BoE882M/WvH9ofEoGLI/AAAAAAAA5PY/5BNSL07vKjQvj9nIEchDeTtNz3IoGFL_ACKgBGAs/s1600/Post%2B20%2B-%2BImage%2B1%252C%2B2018.jpg",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://ml2dwfurbb2e.i.optimole.com/cb:NyRb.2a170/w:auto/h:auto/q:mauto/f:avif/https://shrednutrition.in/wp-content/uploads/2023/07/IMG_3524.png"),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://www.grocianutrition.com/wp-content/uploads/2022/05/Website-Banner1-1-1024x455.jpg"),
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
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4-FSM4GGBy84S3X7DkO7NkLFAamQSYrz1qg&usqp=CAU"),
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
class NutritionOfferSlider extends StatelessWidget {
  const NutritionOfferSlider({
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
                "https://www.unitedlabs.co.in/wp-content/uploads/2023/01/Nutrition-Supplements-Manufacturers-.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://www.fitbiz.in/wp-content/uploads/diet-and-nutrition-products.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://www.kreedon.com/wp-content/uploads/2022/08/Nutrabay-All-HomePage-Mobile-Banner.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://www.blackmores.com.sg/-/media/project/blackmores/singapore/version-2/health-hub-articles/nutrient-rich-diet.jpg"),
          ),
        ],
      ),
    );
  }
}

