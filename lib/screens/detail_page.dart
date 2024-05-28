import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o3d/o3d.dart';

import '../themes/Color_themes.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    O3DController o3dController = O3DController();

    return Scaffold(
      backgroundColor: ColorThemes.uIGray80,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(
                  'FRUIT',
                  style: TextStyle(
                    color: ColorThemes.primaryOrange,
                    fontSize: 16,
                    fontFamily: 'lato',
                    letterSpacing: 5,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Pinneaple',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorThemes.uIGray100,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(500),
                  topLeft: Radius.circular(500),
                ),
              ),
              child: SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: O3D.network(
                  src:
                      'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                  controller: o3dController,
                  autoPlay: true,
                  cameraControls: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
