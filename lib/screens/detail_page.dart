import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o3d/o3d.dart';

import '../themes/Color_themes.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> food;
  const DetailPage({super.key, required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  O3DController o3dController = O3DController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.uIGray80,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          weight: 700,
                          color: Color.fromRGBO(168, 168, 168, 1),
                        ),
                      ),
                      Container(
                        height: 57,
                        width: 57,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(73, 73, 73, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/shopping-bag.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 29),
                const Text(
                  'FRUIT',
                  style: TextStyle(
                    color: Color.fromRGBO(210, 174, 130, 1),
                    fontSize: 16,
                    fontFamily: 'lato',
                    letterSpacing: 7,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.food['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorThemes.uIGray100,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(170),
                    topLeft: Radius.circular(170),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 120),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.food['price'],
                                      style: const TextStyle(
                                        color: Color.fromRGBO(210, 174, 130, 1),
                                        fontSize: 40,
                                        fontFamily: 'lato',
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        RatingBarIndicator(
                                          itemPadding: const EdgeInsets.only(
                                            right: 5,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20,
                                          rating: widget.food['rate'],
                                          itemBuilder: (context, index) {
                                            return Icon(
                                              Icons.star,
                                              size: 20,
                                              color: ColorThemes.primaryOrange,
                                            );
                                          },
                                        ),
                                        Text(
                                          widget.food['rate'].toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontFamily: 'lato',
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  'per Kg',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: ColorThemes.textGrey40,
                                    fontSize: 16,
                                    fontFamily: 'lato',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            _buildCirclesButton(
                              SvgPicture.asset(
                                'assets/icons/love.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCirclesButton(
                              SvgPicture.asset(
                                'assets/icons/like.svg',
                                fit: BoxFit.contain,
                              ),
                              name: 'Quality\nAssurance',
                            ),
                            _buildCirclesButton(
                              SvgPicture.asset(
                                'assets/icons/delivery.svg',
                                fit: BoxFit.contain,
                              ),
                              name: 'Fast\nDelivery',
                            ),
                            _buildCirclesButton(
                              SvgPicture.asset(
                                'assets/icons/food-teste.svg',
                                fit: BoxFit.contain,
                              ),
                              name: 'Best-in\nTaste',
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              height: 57,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: ColorThemes.uIGray80,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: const Center(
                                      child: Icon(
                                        Icons.minimize,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    '7',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                      child: const Text(
                                    '+',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                height: 57,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(238, 172, 92, 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Go to Cart',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Transform.scale(
              scale: 0.5,
              alignment: Alignment.center,
              child: O3D.asset(
                src: widget.food['model'],
                controller: o3dController,
                autoPlay: false,
                cameraControls: true,
                ar: false,
                disableZoom: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCirclesButton(Widget icon, {String? name}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            color: ColorThemes.uIGray80,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
        const SizedBox(height: 10),
        name != ''
            ? Text(
                name ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'lato',
                  fontWeight: FontWeight.w900,
                ),
              )
            : Container(),
      ],
    );
  }
}
