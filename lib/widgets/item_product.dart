import 'package:flutter/material.dart';

import '../themes/Color_themes.dart';

class ItemProduct extends StatelessWidget {
  final String? name;
  final String? image;
  final String? price;
  final int? index;
  const ItemProduct({
    super.key,
    this.name,
    this.image,
    this.price,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 101,
            decoration: BoxDecoration(
              color: index! % 2 == 0
                  ? const Color.fromRGBO(67, 37, 27, 1)
                  : const Color.fromRGBO(67, 49, 27, 1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(70),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -35,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    image ?? '',
                    fit: BoxFit.cover,
                    height: 130,
                    width: 142,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 142,
            padding: const EdgeInsets.only(
              left: 20,
              right: 8,
              top: 8,
              bottom: 10,
            ),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FRUIT',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorThemes.primaryOrange,
                    fontSize: 12,
                    letterSpacing: 5,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  name ?? '',
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  price ?? '0',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ColorThemes.primaryBrown3,
                    fontSize: 20,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'per Kg',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: ColorThemes.textGrey40,
                      fontSize: 12,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
