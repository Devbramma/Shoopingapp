import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/Categories_Screen.dart';
import 'package:shoppingapp/screens/fashion.dart';
import 'package:shoppingapp/screens/mobile_screen.dart';
import 'package:shoppingapp/screens/shoes_screen.dart';
import 'package:shoppingapp/screens/topoffers.dart';

class TrendingStores extends StatelessWidget {
  const TrendingStores({super.key});

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
                          'Trending Mobiles',
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
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MobileScreen()));
                    },
                    child: const MobileOfferSlider()),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/001/984/892/small/banner-design-geometric-hexagon-colorful-overlapping-with-background-free-vector.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Trending Fashion Products',
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
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FashionScreen()));
                    },
                    child: const FashionOfferSlider()),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2gOp_o0HxgwsnD2iyj3XXC2eFq5Q8KyYD6A&usqp=CAU"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Trending Shoes',
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
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShoesScreen()));
                    },
                    child: const ShoesOfferSlider()),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/free-vector/copy-space-bokeh-spring-lights-background_52683-55649.jpg?w=2000"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Trending Shoes',
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
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => topoffers()));
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://images.news18.com/ibnlive/uploads/2021/04/1618895227_vivo_v21_5g.jpg?im=FitAndFill=(1200,675)",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        "https://flipkartads.azureedge.net/flipkartads/FKadsinfograph1306v21.png",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.network(
                          "https://flipkartads.azureedge.net/flipkartads/ecomm1.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPueoEYdA6TsO_BUEoWobwPPS6pY4XRyo4i-1r966b0qTYlly7cPlkPExHGlIAAk5NWg&usqp=CAU"),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/free-vector/copy-space-bokeh-spring-lights-background_52683-55649.jpg?w=2000"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Orders On Categories',
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
                const SizedBox(
                  height: 10,
                ),
                const MenuStripe(),
              ],
            ),
          ),
        ));
  }
}
