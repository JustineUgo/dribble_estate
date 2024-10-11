import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real/theme/theme.dart';
import 'package:real/utils/assests.dart';
import 'package:real/utils/constants.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  bool isWithoutLayer = false;
  late AnimationController _firstController;
  late Animation _firstAnimation;
  late AnimationController _tagsController;
  late Animation _tagsAnimation;
  late AnimationController _dialogController;
  late Animation _dialogAnimation;

  @override
  void initState() {
    super.initState();

    _firstController = AnimationController(vsync: this, duration: Constants.singleDuration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _tagsController.forward();
        }
      });
    _tagsController = AnimationController(vsync: this, duration: Constants.singleDuration);
    _dialogController = AnimationController(vsync: this, duration: Constants.basicDuration);

    _firstAnimation = CurvedAnimation(parent: _firstController, curve: Curves.easeInOut);
    _tagsAnimation = CurvedAnimation(parent: _tagsController, curve: Curves.easeInOut);
    _dialogAnimation = CurvedAnimation(parent: _dialogController, curve: Curves.easeInOut);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _firstController.forward();
    });
  }

  void updateTagStatus(bool value) {
    setState(() {
      isWithoutLayer = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            decoration: BoxDecoration(
              color: EstateColors.dark,
              image: DecorationImage(image: AssetImage(EImages.map), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AnimatedBuilder(
                  animation: _firstAnimation,
                  builder: (context, child) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Transform.scale(
                                scale: _firstAnimation.value,
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(color: EstateColors.white, borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(EIcons.searchIcon),
                                      const SizedBox(width: 10),
                                      const Text('Saint Petersburg'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Transform.scale(
                              scale: _firstAnimation.value,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: EstateColors.white,
                                child: SvgPicture.asset(EIcons.filterIcon),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                child: Transform.scale(
                                  scale: _firstAnimation.value,
                                  child: InkWell(
                                    onTap: () {
                                      _dialogController.forward();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        EIcons.layerIcon,
                                        colorFilter: const ColorFilter.mode(EstateColors.white, BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: AnimatedBuilder(
                                    animation: _dialogAnimation,
                                    builder: (context, child) {
                                      return Transform.scale(
                                        scale: _dialogAnimation.value,
                                        origin: const Offset(-90, 80),
                                        child: GestureDetector(
                                          onTap: () {
                                            _dialogController.reverse();
                                            updateTagStatus(!isWithoutLayer);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: EstateColors.white,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      EIcons.cosyAreasIcon,
                                                      height: 19,
                                                      colorFilter: ColorFilter.mode(EstateColors.primary.withOpacity(.9), BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      'Cosy areas',
                                                      style: TextStyle(color: EstateColors.primary.withOpacity(.9), fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      EIcons.priceIcon,
                                                      height: 19,
                                                      colorFilter: const ColorFilter.mode(EstateColors.orange, BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      'Price',
                                                      style: TextStyle(color: EstateColors.orange, fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      EIcons.infrastructureIcon,
                                                      height: 19,
                                                      colorFilter: ColorFilter.mode(EstateColors.primary.withOpacity(.9), BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      'Infrastructure',
                                                      style: TextStyle(color: EstateColors.primary.withOpacity(.9), fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      EIcons.layerIcon,
                                                      height: 19,
                                                      colorFilter: ColorFilter.mode(EstateColors.primary.withOpacity(.9), BlendMode.srcIn),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      'Without any layer',
                                                      style: TextStyle(color: EstateColors.primary.withOpacity(.9), fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.scale(
                              scale: _firstAnimation.value,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  EIcons.sendIcon,
                                  colorFilter: const ColorFilter.mode(EstateColors.white, BlendMode.srcIn),
                                ),
                              ),
                            ),
                            Transform.scale(
                              scale: _firstAnimation.value,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      EIcons.listIcon,
                                      colorFilter: const ColorFilter.mode(EstateColors.white, BlendMode.srcIn),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text("List of variants", style: TextStyle(color: EstateColors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 100),
                      ],
                    );
                  }),
            ),
          ),
        ),
        Positioned(
          top: 160,
          left: 120,
          child: MapTag(amount: '10,3', animation: _tagsAnimation, isWithoutLayer: isWithoutLayer),
        ),
        Positioned(
          top: 220,
          left: 140,
          child: MapTag(amount: '11', animation: _tagsAnimation, isWithoutLayer: isWithoutLayer),
        ),
        Positioned(
          top: 250,
          left: 280,
          child: MapTag(amount: '7,8', animation: _tagsAnimation, isWithoutLayer: isWithoutLayer),
        ),
        Positioned(
          top: 400,
          left: 100,
          child: MapTag(amount: '13,3', animation: _tagsAnimation, isWithoutLayer: isWithoutLayer),
        ),
        Positioned(
          top: 380,
          left: 280,
          child: MapTag(amount: '8,5', animation: _tagsAnimation, isWithoutLayer: isWithoutLayer),
        ),
        Positioned(
          top: 500,
          left: 260,
          child: MapTag(amount: '6,95', animation: _tagsAnimation, isWithoutLayer: isWithoutLayer),
        ),
      ],
    );
  }
}

class MapTag extends StatelessWidget {
  const MapTag({super.key, required this.amount, required this.animation, required this.isWithoutLayer});
  final String amount;
  final Animation animation;
  final bool isWithoutLayer;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.scale(
            scale: animation.value,
            child: AnimatedContainer(
              duration: Constants.singleDuration,
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: EstateColors.orange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 2),
                // child: isWithoutLayer
                //     ? SvgPicture.asset(
                //         EIcons.apartmentIcon,
                //         height: 20,
                //         colorFilter: const ColorFilter.mode(EstateColors.white, BlendMode.srcIn),
                //       )
                //     : Row(
                //         children: [
                //           Text('$amount mn', style: const TextStyle(color: EstateColors.white, fontSize: 13)),
                //           const Icon(Icons.currency_ruble, color: EstateColors.white, size: 15),
                //         ],
                //       ),

                child: AnimatedCrossFade(
                  firstChild: Row(
                    children: [
                      Text('$amount mn', style: const TextStyle(color: EstateColors.white, fontSize: 13)),
                      const Icon(Icons.currency_ruble, color: EstateColors.white, size: 15),
                    ],
                  ),
                  secondChild: SvgPicture.asset(
                    EIcons.apartmentIcon,
                    height: 20,
                    colorFilter: const ColorFilter.mode(EstateColors.white, BlendMode.srcIn),
                  ),
                  crossFadeState: !isWithoutLayer ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: Constants.basicDuration,
                ),
              ),
            ),
          );
        });
  }
}
