import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real/src/widgets/home.dart';
import 'package:real/src/widgets/map.dart';
import 'package:real/theme/theme.dart';
import 'package:real/utils/assests.dart';
import 'package:real/utils/constants.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  bool isHome = true;
  ESCreen activeScreen = ESCreen.home;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Constants.basicDuration);
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateController();
    });
    super.initState();
  }

  void animateController() async {
    await Future.delayed(const Duration(seconds: 8));
    _animationController.forward();
  }

  void onNavigate(ESCreen screen) {
    setState(() {
      activeScreen = screen;

      if (screen == ESCreen.home) {
        isHome = true;
      } else {
        isHome = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: isHome ? EstateColors.orange.withOpacity(.1) : EstateColors.dark,
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              AnimatedCrossFade(
                firstChild: const Home(),
                secondChild: const Search(),
                crossFadeState: isHome ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Constants.basicDuration,
              ),

              //BottomNav
              Positioned(
                bottom: -65,
                right: 0,
                left: 0,
                child: AnimatedBuilder(
                  animation: _animation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .70,
                        height: 65,
                        decoration: BoxDecoration(
                          color: EstateColors.dark,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () => onNavigate(ESCreen.search),
                              child: NavItem(screen: ESCreen.search, activeScreen: activeScreen, svg: EIcons.search),
                            ),
                            GestureDetector(
                              onTap: () => onNavigate(ESCreen.message),
                              child: NavItem(screen: ESCreen.message, activeScreen: activeScreen, svg: EIcons.message),
                            ),
                            GestureDetector(
                              onTap: () => onNavigate(ESCreen.home),
                              child: NavItem(screen: ESCreen.home, activeScreen: activeScreen, svg: EIcons.home),
                            ),
                            GestureDetector(
                              onTap: () => onNavigate(ESCreen.fav),
                              child: NavItem(screen: ESCreen.fav, activeScreen: activeScreen, svg: EIcons.heart),
                            ),
                            GestureDetector(
                              onTap: () => onNavigate(ESCreen.profile),
                              child: NavItem(screen: ESCreen.profile, activeScreen: activeScreen, svg: EIcons.profile),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, -85 * double.parse(_animation.value.toString())),
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.screen, required this.activeScreen, required this.svg});
  final ESCreen screen;
  final ESCreen activeScreen;
  final String svg;
  @override
  Widget build(BuildContext context) {
    bool isActive = screen == activeScreen;
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: Constants.basicDuration,
      width: isActive ? 56 : 48,
      height: isActive ? 56 : 48,
      decoration: BoxDecoration(color: isActive ? EstateColors.orange : Colors.black.withOpacity(.2), shape: BoxShape.circle),
      child: Center(child: SvgPicture.asset(svg)),
    );
  }
}

enum ESCreen { search, message, home, fav, profile }
