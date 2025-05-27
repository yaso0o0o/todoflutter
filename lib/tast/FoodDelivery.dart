import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tast/SplashScreen.dart';

class RestaurantHeaderWidget extends StatelessWidget {
  RestaurantHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            "assets/image/background.jpg",
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                  builder: (context) => SplashScreen(),
              ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape:  CircleBorder(),
            ),
            child:  Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:  EdgeInsets.symmetric(horizontal: 16),
              padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    trailing:  Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    ),
                    horizontalTitleGap: 0,
                    minLeadingWidth: 64,
                    title:  Text(
                      "Bazoka",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Burger, chickens,",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "4.9",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "(100 Ratings)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.zero,
                    visualDensity:  VisualDensity(
                      vertical: VisualDensity.maximumDensity,
                      horizontal: VisualDensity.maximumDensity,
                    ),
                    leading: Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image:  DecorationImage(
                          image: AssetImage("assets/image/bazooka.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DeliveryOptionsDetails(
                          title: "Delivery fee",
                          subTitle: "EGP 19.99",
                        ),
                        SizedBox(width: 16),
                        Container(
                          width: 1,
                          height: double.infinity,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        DeliveryOptionsDetails(
                          title: "Delivery time",
                          subTitle: "24 min",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );

  }
}

class RestaurantProductViewScreen extends StatelessWidget {
   RestaurantProductViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: tapBar.length,
          child: Column(
            children: [
              RestaurantHeaderWidget(),
              TabBar(
                isScrollable: true,
                dragStartBehavior: DragStartBehavior.start,
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.orange,
                labelColor: Colors.orange,
                labelStyle:  TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                indicatorWeight: 3,
                tabs: List.generate(
                  tapBar.length,
                      (index) {
                    return Tab(
                      text: tapBar[index],
                    );
                  },
                ),
              ),
               SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    tapBar.length,
                        (i) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return  FoodItemWidget(
                            image: AssetImage("assets/image/food.jpg"),
                            title: 'Chicken Schezwan Fried Rice',
                            description:
                            'Golden fried Chicken pieces wok-tossed with hot and spicy schezwan fried rice with vegetables like green',
                            price: 'EGP 120.00',
                          );
                        },
                        separatorBuilder: (context, index) {
                          return  SizedBox(
                            height: 6,
                          );
                        },
                        itemCount: 8,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
      Container(
        height: 50,
        width: 300,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Add to basket' , style: TextStyle(fontSize: 20),),
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class FoodItemWidget extends StatelessWidget {
  final AssetImage image ;
  final String title;
  final String description;
  final String price;

  FoodItemWidget({
    Key? key,
    required this.image ,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding:  EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 14,),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style:  TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                   SizedBox(height: 8),
                  Text(
                    price,
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/image/food.jpg" ,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class DeliveryOptionsDetails extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

   DeliveryOptionsDetails({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: titleStyle ??
               TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
        ),
        Text(
          subTitle,
          style: subTitleStyle ??
               TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),

      ],

    );
  }
}

List<String> tapBar = [
  "ALL",
  "Trending",
  "Starters",
  "Free soup",
  "Offers",
  "Top seller",
];
