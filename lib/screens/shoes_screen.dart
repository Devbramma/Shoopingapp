import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shoppingapp/models/randomProductModel.dart';
import 'package:shoppingapp/resources/product_list_json.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';

class ShoesScreen extends StatelessWidget {
  ProductList? productList;

  ShoesScreen({super.key});



  void initState() {
    fetchProducts();
  }

  Future<ProductList> fetchProducts() async {
    await Future.delayed( const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().shoesJsonData);
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
            const ShoesOfferSlider(),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://venngage-wordpress.s3.amazonaws.com/uploads/2018/09/Colorful-Circle-Simple-Background-Image-1.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TopBrands For You',
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
                      "https://hungamadeal.co.in/wp-content/uploads/2016/06/flipkart-offer-9-848x477.jpg",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      "https://www.flashsaletricks.com/wp-content/uploads/2016/12/Flipkart_Fashion_Sale_24-26Dec.png",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                        "https://i.pinimg.com/1200x/a4/65/94/a465940be66c0ddeeace1e5e286a2639.jpg"),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                        "https://i.ytimg.com/vi/qEwFR-pDtYI/maxresdefault.jpg"),
                    const SizedBox(
                      height: 10,
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
                          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v546batch3-mynt-34-badgewatercolor_1.jpg?w=1200&h=1200&dpr=1&fit=clip&crop=default&fm=jpg&q=75&vib=3&con=3&usm=15&cs=srgb&bg=F4F4F3&ixlib=js-2.2.1&s=f04d2786c16b18e1ee49ca8128b65221"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shoes For You',
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
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/shoe/p/6/u/-original-imagg3c7jsyvwajn.jpeg?q=70",
                      offer: "Free Delivery",
                      title: "Absolute Comfort",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/l0cr4i80/shoe/1/7/j/7-3129-41-bross-navy-original-imagc536pncfxyzu.jpeg?q=70",
                      offer: "Min 20% Off",
                      title: "BROS",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/shoe/1/i/u/-original-imaggcb7ndjv7fue.jpeg?q=70",
                      offer: "Assure Product",
                      title: "BRUTON",

                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/xif0q/shoe/d/n/2/-original-imagk26u5nmdzfkz.jpeg?q=70",
                      title: "NIKE",
                      offer: "Min.70% Off",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://rukminim2.flixcart.com/image/832/832/kqse07k0/shoe/z/c/f/11-hgq12-11-adidas-ngtsky-original-imag4q3hq2ufxrhy.jpeg?q=70",
                      title: "ADIDAS",
                      offer: "Scrab & Get",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v546batch3-mynt-34-badgewatercolor_1.jpg?w=1200&h=1200&dpr=1&fit=clip&crop=default&fm=jpg&q=75&vib=3&con=3&usm=15&cs=srgb&bg=F4F4F3&ixlib=js-2.2.1&s=f04d2786c16b18e1ee49ca8128b65221"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Picks For You',
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
              const SizedBox(height: 12,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v546batch3-mynt-34-badgewatercolor_1.jpg?w=1200&h=1200&dpr=1&fit=clip&crop=default&fm=jpg&q=75&vib=3&con=3&usm=15&cs=srgb&bg=F4F4F3&ixlib=js-2.2.1&s=f04d2786c16b18e1ee49ca8128b65221"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sponsored For You',
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
              Image.network("https://i.pinimg.com/736x/d2/e0/36/d2e036c416b32e04be2d56bf6bdde4a2.jpg"),
              const SizedBox(height: 8,),
              Image.network("https://sportslounge.co.in/file/2022/07/adidas.jpg"),
              const SizedBox(height: 8,),



            ],
          ),
        ),
      ),
    );
  }
}

class ShoesOfferSlider extends StatelessWidget {
  const ShoesOfferSlider({
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
                "https://i.ytimg.com/vi/Xg--lBFNOqM/maxresdefault.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://cdna.artstation.com/p/assets/images/images/036/002/188/large/m-n-vinit-img-20210322-204116-186.jpg?1616482578"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://cms.upcomer.com/wp-content/uploads/2020/11/feel-the-future-hp-mh-d_tcm205-555715.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://i.ytimg.com/vi/aBRJUdGdn00/maxresdefault.jpg"),
          ),
        ],
      ),
    );
  }
}