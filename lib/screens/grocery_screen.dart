import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shoppingapp/models/randomProductModel.dart';

import 'package:shoppingapp/resources/product_list_json.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/screens/cart_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';


class GroceryScreen extends StatelessWidget {
  ProductList? productList;

  GroceryScreen({super.key});

  void initState() {
    fetchProducts();
  }

  Future<ProductList> fetchProducts() async {
    await Future.delayed( const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().groceryJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
          InkWell(onTap: (){
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
             // const SearchBar1(),
              const SizedBox(height: 8,),
              const GroceryOfferSlider(),
              const SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.solidbackgrounds.com/images/1920x1080/1920x1080-light-green-solid-color-background.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Best Seller Squad',
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
                      "https://supergroci.com/wp-content/uploads/2022/11/Grocery-Staples.webp",
                      offer: "Scrab & Get",
                      title: "Staples",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://d1sl07a7h3d3fr.cloudfront.net/common/category/snacks.jpeg",
                      title: "Snacks",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://www.kindpng.com/picc/m/241-2413612_grocery-png-image-high-quality-indian-grocery-transparent.png",
                      title: "Packed Food",
                      offer: "Premium Brand",
                      price: "299",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://theneonproject.in/wp-content/uploads/2019/11/960-Comfort-PKG.jpg",
                      title: "Beverages",
                      offer: "Min.70% Off",
                    ),
                    ItemCard(
                      imageUrl:
                      "https://images.jdmagicbox.com/quickquotes/images_main/cool-drinks-381807276-fqwuz.jpeg",
                      title: "Cool Drinks",
                      offer: "Min.60% Off",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6,),
              Column(
                children: [
                  Image.network(
                    "https://cdn.winsightmedia.com/platform/files/public/inline-images/target-private_label_1573161733.jpg?zO5D_pGm_86eY9rzZuOZpnkv24mczkEF",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    "https://images.ctfassets.net/kidaokduxm8m/3LB7eBLzeVkybsxPKqb00Z/f18d5af61d2bbe2e1e040acf3f07589a/Joe_V-s_App_Kids_1000x500.jpg",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://rukminim1.flixcart.com/fk-p-ads/1100/500/dp-doc/1683147913902-clh86t67i0naj0q3oo5mamgf4-Kellogg%27s-SB-creatives_01.jpg?q=90"),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://penji.co/wp-content/uploads/2019/03/Mcdonalds-Food-Ad-Designs.jpg"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.solidbackgrounds.com/images/1920x1080/1920x1080-light-green-solid-color-background.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cooking Essential Corner',
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
                  const SizedBox(height: 16,),
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
                                       SizedBox(height: 8)
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.solidbackgrounds.com/images/1920x1080/1920x1080-light-green-solid-color-background.jpg"),
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
                  const SizedBox(height: 8,),
                  const GroceryOfferSlider1(),
                  const SizedBox(height: 8,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.solidbackgrounds.com/images/1920x1080/1920x1080-light-green-solid-color-background.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Top Picks',
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

            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar1 extends StatelessWidget {
  const SearchBar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
           // borderRadius: BorderRadius.circular(2.0), // You can add a border radius if needed
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green), // Change border color when the TextField is focused
           // borderRadius: BorderRadius.circular(2.0),
          ),
          disabledBorder: InputBorder.none,
          hintText: "Search for atta....",
          fillColor: Colors.white60,
          filled: true,
          suffixIcon: Icon(
            Icons.search,size: 25,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class GroceryOfferSlider extends StatelessWidget {
  const GroceryOfferSlider({
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
                "https://assets.indiadesire.com/images/Flipkart%20Supermart%20Offers%202021.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://i.ytimg.com/vi/X7cuaY3PWvA/maxresdefault.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://media.licdn.com/dms/image/C4E12AQE6PeAGDdUBVw/article-cover_image-shrink_720_1280/0/1605595427446?e=2147483647&v=beta&t=c_vUslYxYuo2KTb6Zx9sWeCsj5-Ek-JtGD3QBv2Qn08"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://i.gadgets360cdn.com/large/flipkart_grocery_expands_service_1643024096767.jpg"),
          ),
        ],
      ),
    );
  }
}

class GroceryOfferSlider1 extends StatelessWidget {
  const GroceryOfferSlider1({
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
                "https://m.media-amazon.com/images/I/71KrB-itjoL._AC_UF894,1000_QL80_.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://i.ytimg.com/vi/9QoKRGNHBcY/maxresdefault.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://study.com/cimages/videopreview/9kkd8ofas7.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://exchange4media.gumlet.io/news-photo/97941-GoCheesead.jpg?w=400&dpr=2.6"),
          ),
        ],
      ),
    );
  }
}
