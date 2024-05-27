import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:shoppingapp/screens/Bikes_Screen.dart';
import 'package:shoppingapp/screens/accessories_screen.dart';
import 'package:shoppingapp/screens/camera_screen.dart';
import 'package:shoppingapp/screens/electronics_screen.dart';
import 'package:shoppingapp/screens/fashion.dart';
import 'package:shoppingapp/screens/flight_screen.dart';
import 'package:shoppingapp/screens/furniture_screen.dart';
import 'package:shoppingapp/screens/grocery_screen.dart';
import 'package:shoppingapp/screens/homescreen.dart';
import 'package:shoppingapp/screens/medicine_screen.dart';
import 'package:shoppingapp/screens/mobile_screen.dart';

import 'package:shoppingapp/screens/nutritions.dart';
import 'package:shoppingapp/screens/personal.dart';
import 'package:shoppingapp/screens/shoes_screen.dart';

import 'package:shoppingapp/screens/topoffers.dart';

import 'package:shoppingapp/screens/sports_screen.dart';
import 'package:shoppingapp/screens/toys_screen.dart';

class CategoriesIcon extends StatelessWidget {
  const CategoriesIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blue,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => topoffers()));
                    },
                      child: const MenuStripesItem(
                        imageUrl: 'offers',
                        itemLabel: 'Offer Zone',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MobileScreen()));
                      },
                      child: const MenuStripesItem(
                        imageUrl: 'mobiles',
                        itemLabel: 'Mobiles',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FashionScreen()));
                    },
                      child: const MenuStripesItem(
                        imageUrl: "fashion",
                        itemLabel: 'Fashion',
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),),
                        );
                      },
                      child: const MenuStripesItem(
                        imageUrl: 'home',
                        itemLabel: 'Home',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => PersonalScreen(),),);
                    },
                      child: const MenuStripesItem(
                        imageUrl: 'personal',
                        itemLabel: 'Personal',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NutritionsScreen(),),
                      );
                    },
                      child: const MenuStripesItem(
                        imageUrl: "health",
                        itemLabel: 'Nutritions',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FurnitureScreen(),),
                      );

                    },
                      child: const MenuStripesItem(
                        imageUrl: 'furniture',
                        itemLabel: 'Furniture',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FlightScreen(),),
                      );
                    },
                      child: const MenuStripesItem(
                        imageUrl: 'flight',
                        itemLabel: 'Travels',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccessoriesScreen(),),
                      );
                    },
                      child: const MenuStripesItem(
                        imageUrl: "accessories",
                        itemLabel: 'Accessories',
                      ),
                    ),


                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BikesScreen(),),
                      );
                    },
                      child: const MenuStripesItem(
                        itemLabel: 'Bikes',
                        imageUrl: 'bikes',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ToysScreen(),),
                      );
                    },
                      child: const MenuStripesItem(
                        imageUrl: 'toys',
                        itemLabel: 'Toys',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicineScreen(),),
                      );
                    },
                      child: const MenuStripesItem(
                        imageUrl: "medicine",
                        itemLabel: 'Medicine',
                      ),
                    ),


                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GroceryScreen(),),
                        );
                      },
                      child: const MenuStripesItem(
                        imageUrl: 'grocery',
                        itemLabel: 'Grocery',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoesScreen(),),);
                    },
                      child: const MenuStripesItem(
                        imageUrl: 'shoe',
                        itemLabel: 'Shoes',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ElectronicsScreen(),),
                      );
                    },
                      child: const MenuStripesItem(
                        imageUrl: "electronics",
                        itemLabel: 'Electronics',
                      ),
                    ),


                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SportsScreen(),),
                          );
                        },
                        child: const MenuStripesItem(
                          imageUrl: 'sports',
                          itemLabel: 'Sports',
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 30,),



                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'More on Flipkart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const MenuStripesItem1(
                      imageUrl: 'supercoin',
                      itemLabel: 'SuperCoin',
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(onTap: (){
                      scratchDialog(context);
                    },
                      child: const MenuStripesItem1(
                        imageUrl: 'coupons',
                        itemLabel: 'Coupons',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const InkWell(
                      child:  MenuStripesItem1(
                        imageUrl: 'levelup',
                        itemLabel: 'LevelUp',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   const MenuStripesItem1(
                      imageUrl: 'liveshop',
                      itemLabel: 'LiveShop+',
                    ),
                    const SizedBox(
                      width: 30,
                    ),

                    InkWell(onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GalleryAccess()));
                    },
                      child: const MenuStripesItem1(
                        imageUrl: "camera",
                        itemLabel: 'Camera',
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => topoffers()));
                      },
                      child: const MenuStripesItem1(
                        imageUrl: 'seller',
                        itemLabel: 'Seller',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuStripesItem extends StatelessWidget {
  final String? imageUrl;
  final String? itemLabel;

  const MenuStripesItem({super.key, this.imageUrl, this.itemLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/${imageUrl ?? 'offers'}.png'))),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          itemLabel ?? "Top Offers",
          style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class MenuStripesItem1 extends StatelessWidget {
  final String? imageUrl;
  final String? itemLabel;

  const MenuStripesItem1({super.key, this.imageUrl, this.itemLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/${imageUrl ?? 'offers'}.png'))),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          itemLabel ?? "Top Offers",
          style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

Future<void> scratchDialog(BuildContext context) {
  double opacity = 0.0;
  return showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("You Earned Gift",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          ),

          content: StatefulBuilder(builder: (context, StateSetter setState) {
            return Scratcher(
              color: Colors.red,
              accuracy: ScratchAccuracy.low,
              threshold: 30,
              brushSize: 40,
              onThreshold: () {
                setState(() {
                  opacity = 1;
                });
              },
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: opacity,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Column(
                    children: [
                      const Text("Hurray! you won",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Expanded(child: Image.asset("assets/images/gift.png",))
                    ],
                  ),
                ),
              ),

            );
          }),
        );
      }
  );
}