import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_shop/screens/detail_page.dart';
import 'package:fruit_shop/themes/Color_themes.dart';
import 'package:fruit_shop/widgets/item_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> recommendeds = [];

  @override
  void initState() {
    super.initState();
    recommendeds = [
      {
        'name': 'Pinneaple',
        'price': 'Rp. 80.000',
        'rate': 5.0,
        'image': 'assets/images/pinneaple.png',
        'model': 'assets/models/carton_pineapple.glb'
      },
      {
        'name': 'Banana',
        'price': 'Rp. 25.000',
        'rate': 4.7,
        'image': 'assets/images/banana.png',
        'model': 'assets/models/carton_banana.glb'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.uIGray100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAppBar(),
              const SizedBox(height: 30),
              _buildProductCard(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended Fruits',
                      style: TextStyle(
                        color: ColorThemes.textGrey40,
                        fontFamily: 'lato',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: ColorThemes.primaryBrown2,
                        fontFamily: 'lato',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  height: 220,
                  child: ListView.builder(
                    itemCount: recommendeds.length,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> recommended = recommendeds[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                food: recommended,
                              ),
                            ),
                          );
                        },
                        child: ItemProduct(
                          index: index + 1,
                          name: recommended['name'],
                          price: recommended['price'],
                          image: recommended['image'],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icons/burger.svg',
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/shopping-bag.svg',
              ),
              const SizedBox(
                width: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                  height: 35,
                  width: 35,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      width: double.infinity,
      height: 222,
      decoration: BoxDecoration(
        color: ColorThemes.uIGray80,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -35,
            top: -20,
            child: Image.asset(
              'assets/images/fruit-card.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(44, 44, 44, 0.35),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'OFFER',
                    style: TextStyle(
                      color: ColorThemes.primaryBrown2,
                      fontFamily: 'lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 10,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Discount up to 40% Off afdfsdfsdf',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'lato',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'In honor of World Health Day\nWe’d like to give you this amazing\noffers.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorThemes.textGrey40,
                      fontFamily: 'lato',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 9,
                        horizontal: 23,
                      ),
                      decoration: BoxDecoration(
                        color: ColorThemes.primaryOrange,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'View Offers',
                        style: TextStyle(
                          fontFamily: 'lato',
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
