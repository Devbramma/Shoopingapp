import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/screens/Categories_icon.dart';
import 'package:shoppingapp/screens/accessories_screen.dart';
import 'package:shoppingapp/screens/electronics_screen.dart';
import 'package:shoppingapp/screens/fashion.dart';
import 'package:shoppingapp/screens/flight_screen.dart';
import 'package:shoppingapp/screens/grocery_screen.dart';
import 'package:shoppingapp/screens/medicine_screen.dart';
import 'package:shoppingapp/screens/mobile_screen.dart';
import 'package:shoppingapp/screens/nutritions.dart';
import 'package:shoppingapp/screens/personal.dart';
import 'package:shoppingapp/screens/Language_Screen.dart';
import 'package:shoppingapp/screens/notification_Screen.dart';
import 'package:shoppingapp/screens/orders_screen.dart';
import 'package:shoppingapp/screens/product_detail_screen.dart';
import 'package:shoppingapp/resources/product_list_json.dart';
import 'package:shoppingapp/screens/profile_screen.dart';
import 'package:shoppingapp/screens/shoes_screen.dart';
import 'package:shoppingapp/screens/topoffers.dart';
import 'package:shoppingapp/screens/trending_stores.dart';
import 'package:shoppingapp/screens/whislist_screen.dart';
import 'package:shoppingapp/screens/sports_screen.dart';
import 'package:shoppingapp/screens/toys_screen.dart';
import '../models/randomProductModel.dart';
import 'cart_screen.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  ProductList? productList;

  int badgeCount = 0;
  bool _isFromSearch = false;
  List<ProductList>? _searchedData;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    fetchProducts();
    fetchShoes();
    fetchBikes();
    fetchHome();
    fetchSports();
    fetchMedicine();
    fetchElectronics();
    fetchMobiles();
    fetchFurniture();
    fetchAccessories();
    fetchFashion();
    fetchPersonal();
    fetchNutrition();
    fetchTopOffers();
    // getCartItems();
    super.initState();
  }

  Future<ProductList> fetchTopOffers() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().topoffersJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchNutrition() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().nutritionsJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchPersonal() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().personalJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchFashion() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().fashionJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchAccessories() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().accessoriesJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().productJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchFurniture() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().furnitureJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchMobiles() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().mobileJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchElectronics() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().electronicsJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchMedicine() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().medicineJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchShoes() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().shoesJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchHome() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().homeJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchSports() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().sportsJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Future<ProductList> fetchBikes() async {
    await Future.delayed(const Duration(seconds: 2));
    List<dynamic> jsonList = jsonDecode(ProductResources().bikesJsonData);
    ProductList productList = ProductList.fromJson(jsonList);
    return productList;
  }

  Widget _mediumSpacing() {
    return const SizedBox(
      height: 16,
    );
  }

  void _searchProducts() {
    _searchedData = searchList
        .where((element) => element.key!.toLowerCase().contains(
              _searchController.text.toLowerCase(),
            ))
        .map((e) => ProductList.fromJson(json.decode(e.data!)))
        .toList();

    setState(() {
      _isFromSearch = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.blue,
              title: Container(
                height: 50.0,
                width: 130.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/namecard1.png"),
                      fit: BoxFit.contain),
                ),
              ),
              actions: [
                const SizedBox(
                  width: 10.0,
                ),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    if (badgeCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            badgeCount.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  if (_isFromSearch == true) ...[
                    GestureDetector(
                        onTap: () {
                          _isFromSearch = false;
                          _searchController.clear();
                          _searchController.text = '';
                          setState(() {});
                        },
                        child: const Icon(Icons.arrow_back)),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText:
                            "Search for Products,brands and new products..",
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _searchProducts();
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 24.0),
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 25),
                      Padding(
                        padding: EdgeInsets.only(top: 24.0),
                        child: Text(
                          "Home",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                height: 1.0,
              ),
              ListTile(
                leading: const Icon(Icons.assistant_sharp),
                title: const Text("Flipkart Plus Zone"),
                onTap: () {},
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                height: 1.0,
              ),
              ListTile(
                leading: const Icon(Icons.apps_rounded),
                title: const Text("All Categories"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoriesIcon()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.trending_up_rounded),
                title: const Text("Trending Stores"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrendingStores()),
                  );
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.category_rounded),
              //   title: const Text("More on Flipkat"),
              //   onTap: () {},
              // ),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                height: 1.0,
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("Choose Language"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LanguageScreen()),
                  );
                },
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                height: 1.0,
              ),
              SizedBox(height: 10,),
              // ListTile(
              //   leading: const Icon(Icons.local_offer),
              //   title: const Text("Offer Zone"),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => topoffers()),
              //     );
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.sell_rounded),
              //   title: const Text("Sell on Flipkart"),
              //   onTap: () {},
              // ),
              // ListTile(
              //   leading: const Icon(Icons.discount),
              //   title: const Text("Coupons"),
              //   onTap: () {},
              // ),
              ListTile(
                leading: const Icon(Icons.book_rounded),
                title: const Text("My Orders"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text("My Whislist"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WhishlistScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text("My Cart"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("My Account"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.notifications),
              //   title: const Text("My Notifications"),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const NotificationScreen()),
              //     );
              //   },
              // ),
              const Divider(

                color: Colors.grey,
                thickness: 1.0,
                height: 1.0,
              ),
              SizedBox(height: 50),
              ListTile(
                title: const Text("Network Preferences"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Help Centre"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Privacy Policy"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Legal"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetContainer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              if (_isFromSearch == false) ...[
                const MenuStripe(),
                _mediumSpacing(),
                const OfferSlider(),
                _mediumSpacing(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/281260/pexels-photo-281260.jpeg?cs=srgb&dl=pexels-francesco-ungaro-281260.jpg&fm=jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'TopPicks For You',
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
                _mediumSpacing(),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ItemCard(
                        imageUrl:
                            "https://media.istockphoto.com/id/178716575/photo/mobile-devices.jpg?s=612x612&w=0&k=20&c=9YyINgAbcmjfY_HZe-i8FrLUS43-qZh6Sx6raIc_9vQ=",
                        offer: "Scrab & Get",
                        title: "Mi-36 Inch TV",
                      ),
                      ItemCard(
                        imageUrl:
                            "https://upload.wikimedia.org/wikipedia/commons/6/65/Product_Photography.jpg",
                        title: "Beauty Bonaza",
                      ),
                      ItemCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                        title: "Bluetooth Headset",
                        offer: "Premium Brand",
                        price: "299",
                      ),
                      ItemCard(
                        imageUrl:
                            "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
                        title: "Sonata Watch",
                        offer: "Min.70% Off",
                      ),
                      ItemCard(
                        imageUrl:
                            "https://media.istockphoto.com/id/489937474/photo/home-appliances.jpg?s=612x612&w=0&k=20&c=x9MfsuwtJlNhq8uLWOpisy16b9JHfeqqxmeyP4nXoHw=",
                        title: "Kitchen Items",
                        offer: "Min.60% Off",
                      ),
                    ],
                  ),
                ),
                _mediumSpacing(),
                const AccessoriesOfferSlider(),
                _mediumSpacing(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/281260/pexels-photo-281260.jpeg?cs=srgb&dl=pexels-francesco-ungaro-281260.jpg&fm=jpg"),
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
                _mediumSpacing(),
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
                                "https://media.istockphoto.com/id/1262617201/vector/butterflies-flying-from-the-indian-tricolour-flag-hoisted-by-a-person-an-indian-independence.jpg?s=612x612&w=0&k=20&c=ZDljC2ZPQ7e3GcghutWvbUD4-ByFpARs2ryVG23Ofrg="),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Independence Day Specials',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://st3.depositphotos.com/1971587/35383/i/450/depositphotos_353833826-stock-photo-vibrant-color-paper-abstract-geometric.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchSports(),
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
                              itemCount: 4,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MedicineOfferSlider(),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHZQf_PhPo6FdGE6ryxpepK_q3lv2TjOhq_w&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Top HealthCare Picks',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    FutureBuilder<ProductList>(
                      future: fetchMedicine(),
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
                            itemCount: 4,
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
                                      builder: (context) => ProductDetailScreen(
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
                                        const SizedBox(
                                          height: 8,
                                        ),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlyKb74SVBtBQkq0ZzmcDQXgpfj_ohdeC3nLbxYH9CEj2BzsxRvB0DXoH_LP3DrQ8vYdI&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Hot Deals For You',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://cdn.vectorstock.com/i/preview-1x/23/95/plain-stripped-pastel-color-wall-background-vector-46132395.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchElectronics(),
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
                              itemCount: 4,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpQzv54Zb-8eQQTRn1Wn-oj2Idfb-PfxHJzaUsABi-k-3OSFr-iZ4YQALySCDrHuYlaEk&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'SpotLights On',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://img.freepik.com/premium-vector/hand-drawn-flat-design-bright-color-pattern_23-2149376810.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchBikes(),
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
                              itemCount: 4,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://www.shutterstock.com/shutterstock/photos/765646816/display_1500/stock-photo-blurred-christmas-snow-lights-on-background-design-effect-focus-happy-holiday-party-glow-texture-765646816.jpg"),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const GroceryOfferSlider1(),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/736x/ab/6d/70/ab6d70aa684f8262313dff2897398949.jpg"),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/1200x/52/cd/14/52cd14d7873f55f229a66a0cbe94ad2c.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchHome(),
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
                              itemCount: 6,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    _mediumSpacing(),
                    const ShoesOfferSlider(),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/281260/pexels-photo-281260.jpeg?cs=srgb&dl=pexels-francesco-ungaro-281260.jpg&fm=jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Branded Products For You',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.cdn3.stockunlimited.net/clipart450/background-with-a-circular-spot-light-in-middle_1378149.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchShoes(),
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
                              itemCount: 4,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/281260/pexels-photo-281260.jpeg?cs=srgb&dl=pexels-francesco-ungaro-281260.jpg&fm=jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Mobiles For You',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://as2.ftcdn.net/v2/jpg/00/52/78/87/1000_F_52788772_nqrRuBaTJKiD0VhEJMDywVi7PAw5YYmC.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchMobiles(),
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
                              itemCount: 4,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://www.tradeuno.com/cdn/shop/products/PeachColorGeorgetteFabric_2.jpg?v=1651488718&width=1168"),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://as1.ftcdn.net/v2/jpg/02/63/75/56/1000_F_263755638_YvoCec5Rs2023qVgqvV82JaKFhkzRnaq.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
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
                              itemCount: 8,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://c4.wallpaperflare.com/wallpaper/463/936/963/material-style-abstract-wallpaper-preview.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Mega Discounts',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    const NutritionOfferSlider(),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://w0.peakpx.com/wallpaper/927/958/HD-wallpaper-premium-vector-abstract-shapes-colorful-aqua-peach-background.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Premium Brands For You',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs4wxv9PToOPSUxrqkJSvxqJn_TTdlllW4I6tNl1eP9Bt52xGjCvt2phkyTixbfTinpxE&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchFurniture(),
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
                              itemCount: 6,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    _mediumSpacing(),
                    const ToysOfferSlider(),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://e1.pxfuel.com/desktop-wallpaper/369/853/desktop-wallpaper-paper-planes-by-pimpmaster64-paper-plane-thumbnail.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Monsoon Essential',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbY-rG2_NbYx8N3L16rTIQhlCRBOYJMsMrOA&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchAccessories(),
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
                              itemCount: 4,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    const SizedBox(height: 10),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://img.freepik.com/premium-photo/blank-paper-color-text-with-flower-surrounding-color-background_756748-13223.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'On Everybody List',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTwaCcZS5s5VhuYe7zx9EI5AFWIxSOkKG1sA&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchPersonal(),
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
                              itemCount: 4,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://e0.pxfuel.com/wallpapers/518/58/desktop-wallpaper-colorful-bicycle-geometric-minimal-minimal-colour.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Fragrance Product Finder',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    const PersonalOfferSlider(),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://img.lovepik.com/background/20211027/medium/lovepik-atmospheric-minimalist-party-building-poster-background-image_401509253.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Curated Collection',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTegInkEkCLi4ojpgwkAnDNLSuskdcp-l7aQ9z-xTows5mj8o3Q5yoloqh7srMISt4Bsw&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchFashion(),
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
                              itemCount: 4,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                                              _mediumSpacing(),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROSNJ0UkTknF4NC2fhnOXIv0vUCE_41av91_TJuGA5X2bYtT8pk5uLhDf4TvAnWAHs4Gs&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Diet Nutritions',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR63PQm3ZZn_4SGWPJYWnSBZASl1yr13tk84A&usqp=CAU"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchNutrition(),
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
                              itemCount: 6,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                                              _mediumSpacing(),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/268415/pexels-photo-268415.jpeg?cs=srgb&dl=pexels-pixabay-268415.jpg&fm=jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Top Offers',
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _mediumSpacing(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPB4-bf_txxaQZYbxNzLfZhYrn1azzoUhHpQ_AqBr7zN3LCrHu8AqQ0Q&s=0"),
                            fit: BoxFit.cover),
                      ),
                      child: FutureBuilder<ProductList>(
                        future: fetchTopOffers(),
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
                              itemCount: 4,
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
                                          const SizedBox(
                                            height: 8,
                                          ),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ]
              else ...[
                if (_searchedData!.isEmpty) ...[
                  Center(
                    child: Text(
                        'No products found for ${_searchController.text.toUpperCase()} !'),
                  )
                ] else ...[
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 22.0,
                      mainAxisSpacing: 22.0,
                    ),
                    itemCount: _searchedData?[0].products.length,
                    itemBuilder: (context, index) {
                      final product = _searchedData?[0].products[index];
                      return GestureDetector(
                        onTap: () {
                          List<Product> filteredProducts = _searchedData![0]
                              .products
                              .where((element) =>
                                  element.number == product?.number)
                              .toList();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                product: product!,
                                filteredProducts: filteredProducts,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          child: GridTile(
                            footer: GridTileBar(
                              backgroundColor: Colors.white,
                              title: Text(
                                product?.title ?? "",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price:₹${product?.price}',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FavoriteHeartIcon(
                                    size: 20,
                                    product: product,
                                  ),
                                ],
                              ),
                            ),
                            child: Image.network(product?.image ?? ""),
                          ),
                        ),
                      );
                    },
                  )
                ]
              ],
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllCategories()));
            },
            child: Icon(
              Icons.home,
              color: Colors.blue[900],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoriesIcon()),
              );
            },
            child: Icon(
              Icons.grid_view,
              color: Colors.blue[900],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationScreen()),
              );
            },
            child: Icon(
              Icons.notifications,
              color: Colors.blue[900],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Icon(
              Icons.person_2,
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuStripe extends StatelessWidget {
  const MenuStripe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: const BoxDecoration(color: Colors.white),
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 0.7,
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue[900]),
                  child: const Center(
                    child: Icon(
                      Icons.apps_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  'All Categories',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.0),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => topoffers()));
            },
            child: const MenuStripeItem(
              imageUrl: 'offers',
              itemLabel: 'Top Offers',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccessoriesScreen()));
            },
            child: const MenuStripeItem(
              imageUrl: 'appliance',
              itemLabel: 'Appliance',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MobileScreen()));
            },
            child: const MenuStripeItem(
              itemLabel: 'Mobiles',
              imageUrl: 'mobiles',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ElectronicsScreen()));
            },
            child: const MenuStripeItem(
              itemLabel: 'Electronics',
              imageUrl: 'electronics',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FashionScreen()));
            },
            child: const MenuStripeItem(
              itemLabel: 'Fashion',
              imageUrl: 'fashion',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GroceryScreen()));
            },
            child: const MenuStripeItem(
              itemLabel: 'Grocery',
              imageUrl: 'grocery',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ToysScreen()));
            },
            child: const MenuStripeItem(
              itemLabel: 'Toys',
              imageUrl: 'toys',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FlightScreen()));
            },
            child: const MenuStripeItem(
              itemLabel: 'Travels',
              imageUrl: 'travel',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SportsScreen()));
            },
            child: const MenuStripeItem(
              itemLabel: 'Sports',
              imageUrl: 'sports',
            ),
          ),
        ],
      ),
    );
  }
}

class MenuStripeItem extends StatelessWidget {
  final String? imageUrl;
  final String? itemLabel;

  const MenuStripeItem({super.key, this.imageUrl, this.itemLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[900],
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/${imageUrl ?? 'offers'}.png'))),
        ),
        Text(
          itemLabel ?? "Top Offers",
          style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class OfferSlider extends StatelessWidget {
  const OfferSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.0,
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 0.6,
        scrollDirection: Axis.horizontal,
        children: const [
          OfferSliderItem(),
          OfferSliderItem1(
              imageUrl:
                  "https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/d6c2c00726dda91d.png?q=20"),
          OfferSliderItem(),
          OfferSliderItem1(
            imageUrl:
                "https://gumlet.assettype.com/afaqs%2F2022-06%2Fa43ee35b-18cb-4c7f-ac17-63c14a79207f%2FAlia_Bhatt_Flipkart_Fashion_EOSS.jpg?w=1200&auto=format%2Ccompress&ogImage=true",
          ),
        ],
      ),
    );
  }
}

class OfferSliderItem extends StatelessWidget {
  final String? imageUrl;
  final String? offerLabel;
  final String? offerPercentage;

  const OfferSliderItem(
      {super.key, this.imageUrl, this.offerLabel, this.offerPercentage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.network(
                  imageUrl ??
                      "https://images.unsplash.com/photo-1522198734915-76c764a8454d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: Image.asset(
                        'assets/images/loader.webp',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ).image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offerLabel ??
                    "Computers Bestsellers \n Laptops,Printers,Monitors",
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 30,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
                child: Center(
                    child: Text(
                  offerPercentage ?? "30-70% OFF",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Container(
                  color: Colors.yellow,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "No Cost EMI Durability Certified",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class OfferSliderItem1 extends StatelessWidget {
  final String? imageUrl;

  const OfferSliderItem1({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(
                    imageUrl ??
                        "https://images.unsplash.com/photo-1522198734915-76c764a8454d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                  ).image,
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final String? imageUrl;
  final String? offer;
  final String? title;
  final String? price;

  const ItemCard({Key? key, this.imageUrl, this.offer, this.title, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.0),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl ??
                        "https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/d6c2c00726dda91d.png?q=20"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      title ?? "Paintings",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Text(
                          offer ?? "Min 50% off",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
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

class ItemCard1 extends StatelessWidget {
  final String? imageUrl;
  final String? offer;
  final String? title;
  final String? price;

  const ItemCard1({Key? key, this.imageUrl, this.offer, this.title, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 165,
          width: 130,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      imageUrl ??
                          "https://rukminim1.flixcart.com/fk-p-flap/1600/270/image/d6c2c00726dda91d.png?q=20",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      title ?? "Paintings",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Text(
                          offer ?? "Min 50% off",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                            color: Colors.brown,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
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

class ItemCategory1 extends StatefulWidget {
  const ItemCategory1({super.key});

  @override
  State<ItemCategory1> createState() => _ItemCategory1State();
}

class _ItemCategory1State extends State<ItemCategory1> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FavoriteHeartIcon extends StatefulWidget {
  final double size;
  final Product? product;

  const FavoriteHeartIcon({
    super.key,
    required this.size,
    required this.product,
  });

  @override
  _FavoriteHeartIconState createState() => _FavoriteHeartIconState();
}

class _FavoriteHeartIconState extends State<FavoriteHeartIcon> {
  bool isFavorite = false;

  Future<void> addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('add_to_liked');

    print('step 1---$cartItems');

    // If cart_items_key does not exist, create an empty list
    cartItems ??= [];

    print('step 2---$cartItems');

    print('step 3-------${widget.product}');
    // Convert the product to JSON string and add it to the list
    cartItems.add(json.encode(widget.product?.toJson()));

    print('step 4---$cartItems');
    // Save the updated list to SharedPreferences
    await prefs.setStringList('add_to_liked', cartItems);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isFavorite = !isFavorite;
          });
          if (isFavorite) {
            await addToCart();
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    backgroundColor: Colors.orange,
                    content: Center(
                        child: Text(
                      'Product added to whish list!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ))),
              );
            }
          } else {}
        },
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
          color: isFavorite ? Colors.red : Colors.grey,
          size: widget.size,
        ),
      ),
    );
  }
}
