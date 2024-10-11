import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real/theme/theme.dart';
import 'package:real/utils/assests.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(1.0, 0.0),
              radius: 1.0,
              colors: [
                EstateColors.orange.withOpacity(.5),
                EstateColors.orange.withOpacity(.1),
                // Colors.white,
              ],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                    decoration: BoxDecoration(
                      color: EstateColors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          EIcons.locationIcon,
                          colorFilter: const ColorFilter.mode(EstateColors.primary, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 5),
                        const Text('Saint Petersburg', style: TextStyle(fontSize: 16, color: EstateColors.primary, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(EImages.profile),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Hi, Marina', style: TextStyle(fontSize: 24, color: EstateColors.primary, fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("let's select your\nperfect place",
                  style: TextStyle(fontSize: 34, color: EstateColors.dark.withOpacity(.9), fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width - 50) / 2,
                              height: (MediaQuery.of(context).size.width - 50) / 2,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(color: EstateColors.orange, shape: BoxShape.circle),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('BUY', style: TextStyle(fontSize: 12, color: EstateColors.white)),
                                      ],
                                    ),
                                  ),
                                  Text('1 034', style: TextStyle(fontSize: 34, color: EstateColors.white, fontWeight: FontWeight.w600)),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('offers', style: TextStyle(fontSize: 12, color: EstateColors.white)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width - 50) / 2,
                              height: (MediaQuery.of(context).size.width - 50) / 2,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(color: EstateColors.white.withOpacity(.4), borderRadius: BorderRadius.circular(30)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('RENT', style: TextStyle(fontSize: 12, color: EstateColors.primary)),
                                      ],
                                    ),
                                  ),
                                  Text('2 212', style: TextStyle(fontSize: 34, color: EstateColors.primary, fontWeight: FontWeight.w600)),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text('offers', style: TextStyle(fontSize: 12, color: EstateColors.primary)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: EstateColors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(image: AssetImage(EImages.one), fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    image: DecorationImage(image: AssetImage(EImages.two), fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(22),
                                          image: DecorationImage(image: AssetImage(EImages.three), fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Expanded(
                                      child: Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(22),
                                          image: DecorationImage(image: AssetImage(EImages.four), fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
