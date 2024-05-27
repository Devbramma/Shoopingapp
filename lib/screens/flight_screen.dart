import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';




class FlightScreen extends StatelessWidget {
  const FlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
         /* leading: InkWell(onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoriesIcon()));
          },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),*/
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
              Icons.airplanemode_active,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 25,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const FlightsOfferSlider(),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250, width: 350,
                    //color: Colors.red,
                    child: Image.asset('assets/images/flights.png'),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  'Book Your Flight',
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 00,
              ),
              Center(
                child: SizedBox(
                  height: 200,
                  // color: Colors.red,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: SizedBox(
                          height: 60,
                          // color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Transform.rotate(
                                  angle: 180 * pi / 180,
                                  child: const Icon(
                                    Icons.airplanemode_active,
                                    size: 30,color: Colors.blue,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'From',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                      Text(
                                        'United States',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 105),
                        child: SizedBox(
                          height: 60,
                          // color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Transform.rotate(
                                  angle: 0,
                                  child: const Icon(
                                    Icons.location_on,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'To',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                      Text(
                                        'England',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 250, top: 80),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 50,
                          width: 50,
                          child: const Icon(
                            Icons.swap_horiz,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 280,
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        'Check Seat Availability',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              const HotelsOfferSlider(),
              const SizedBox(height: 12,),
              const Center(
                child: Text(
                  'Book Your Hotels',
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                ),
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
                        'New Arrivals',
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
              Image.network("https://www.cleartrip.com/offers/sites/default/files/styles/destination-top/public/offer_page_22.png?itok=FSBFhYRh")
            ],
          ),
        ) );

  }
}


class FlightsOfferSlider extends StatelessWidget {
  const FlightsOfferSlider({
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
                "https://couponswala.com/blog/wp-content/uploads/2022/06/flipkart-flight-booking-696x392.jpg.webp"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://assets.indiadesire.com/images/flipkart%20flight%20ticket%20booking%20offers%202023.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://www.dealnloot.com/wp-content/uploads/2021/09/flipkart-flight-fly600.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://shamnadt.com/wp/wp-content/uploads/2020/02/Flipkart-Travel-Fest-Flat-10-percent-Offer-First-Flight-Booking-Feb-2020.jpg.webp"),
          ),
        ],
      ),
    );
  }
}

class HotelsOfferSlider extends StatelessWidget {
  const HotelsOfferSlider({
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
                "https://www.cleartrip.com/offers/sites/default/files/styles/destination-top/public/ct_axis_offer_page.png?itok=tZDIdUn_"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://www.cleartrip.com/offers/sites/default/files/styles/destination-top/public/_op_au_bank_hotels_copy_2.png?itok=NJg83XgA"),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
                "https://www.cleartrip.com/offers/sites/default/files/styles/destination-top/public/offer_banner.png?itok=5_q3imYn"),
          ),
        ],
      ),
    );
  }
}