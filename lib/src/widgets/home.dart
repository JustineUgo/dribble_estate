import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real/theme/theme.dart';
import 'package:real/utils/assests.dart';
import 'package:real/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _appBarController;
  late Animation _appBarAnimation;
  late AnimationController _greetingController;
  late Animation _greetingAnimation;
  late AnimationController _header1Controller;
  late Animation _header1Animation;
  late AnimationController _header2Controller;
  late Animation _header2Animation;
  late AnimationController _ctaController;
  late Animation _ctaAnimation;
  late AnimationController _countController;
  late Animation _countAnimation;
  late AnimationController _bottomController;
  late Animation _bottomAnimation;

  @override
  void initState() {
    super.initState();
    _appBarController = AnimationController(vsync: this, duration: Constants.singleDuration);
    _greetingController = AnimationController(vsync: this, duration: Constants.basicDuration);
    _header1Controller = AnimationController(vsync: this, duration: Constants.singleDuration);
    _header2Controller = AnimationController(vsync: this, duration: Constants.singleDuration);
    _ctaController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _countController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _bottomController = AnimationController(vsync: this, duration: Constants.basicDuration);

    _appBarAnimation = CurvedAnimation(parent: _appBarController, curve: Curves.easeInOut);
    _greetingAnimation = CurvedAnimation(parent: _greetingController, curve: Curves.easeInOut);
    _header1Animation = CurvedAnimation(parent: _header1Controller, curve: Curves.easeInOut);
    _header2Animation = CurvedAnimation(parent: _header2Controller, curve: Curves.easeInOut);
    _ctaAnimation = CurvedAnimation(parent: _ctaController, curve: Curves.easeInOut);
    _countAnimation = CurvedAnimation(parent: _countController, curve: Curves.easeInOut);
    _bottomAnimation = CurvedAnimation(parent: _bottomController, curve: Curves.easeInOut);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _appBarController.forward();
    });
  }

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
              ],
              stops: const [0.0, 1.0],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedBuilder(
                    animation: _appBarAnimation,
                    builder: (context, child) {
                      if (_appBarAnimation.isCompleted) {
                        _greetingController.forward();
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * (_appBarAnimation.value * 0.55),
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                                decoration: BoxDecoration(
                                  color: EstateColors.white.withOpacity(.6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(''),
                              ),
                              Positioned.fill(
                                child: Opacity(
                                  opacity: double.parse(_appBarAnimation.value.toString()) < 0.8 ? 0 : double.parse(_appBarAnimation.value.toString()),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                              )
                            ],
                          ),
                          Transform.scale(
                            scale: _appBarAnimation.value,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(EImages.profile),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedBuilder(
                    animation: _greetingAnimation,
                    builder: (context, child) {
                      if (_greetingAnimation.value >= 0.5) {
                        _header1Controller.forward();
                      }
                      return Opacity(
                        opacity: _greetingAnimation.value,
                        child: const Text('Hi, Marina', style: TextStyle(fontSize: 24, color: EstateColors.primary, fontWeight: FontWeight.w400)),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedBuilder(
                    animation: _header1Animation,
                    builder: (context, snapshot) {
                      double dy = 55 - (double.parse(_header1Animation.value.toString()) * 55);
                      if (_header1Animation.value >= .3) {
                        _header2Controller.forward();
                      }
                      if (_header1Animation.value >= .6) {
                        _ctaController.forward();
                        _countController.forward();
                      }

                      return Transform.translate(
                        offset: Offset(0, dy),
                        child: Opacity(
                          opacity: _header1Animation.value,
                          child: Text(
                            "let's select your",
                            style: TextStyle(fontSize: 34, color: EstateColors.dark.withOpacity(.9), fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedBuilder(
                    animation: _header2Animation,
                    builder: (context, snapshot) {
                      double dy = 55 - (double.parse(_header2Animation.value.toString()) * 55);
                      return Transform.translate(
                        offset: Offset(0, dy),
                        child: Opacity(
                          opacity: _header1Animation.value,
                          child: Text(
                            "perfect place",
                            style: TextStyle(fontSize: 34, color: EstateColors.dark.withOpacity(.9), fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          AnimatedBuilder(
                              animation: _ctaAnimation,
                              builder: (context, snapshot) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.scale(
                                      scale: _ctaAnimation.value,
                                      child: Container(
                                        width: (MediaQuery.of(context).size.width - 50) / 2,
                                        height: (MediaQuery.of(context).size.width - 50) / 2,
                                        padding: const EdgeInsets.all(20),
                                        decoration: const BoxDecoration(color: EstateColors.orange, shape: BoxShape.circle),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Expanded(
                                              child: Column(
                                                children: [
                                                  Text('BUY', style: TextStyle(fontSize: 12, color: EstateColors.white)),
                                                ],
                                              ),
                                            ),
                                            AnimatedBuilder(
                                              animation: _countAnimation,
                                              builder: (context, child) {
                                                return Text((_countAnimation.value * 1034).toString().split('.').first,
                                                    style: const TextStyle(fontSize: 34, color: EstateColors.white, fontWeight: FontWeight.w600));
                                              },
                                            ),
                                            const Expanded(
                                              child: Column(
                                                children: [
                                                  Text('offers', style: TextStyle(fontSize: 12, color: EstateColors.white)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Transform.scale(
                                      scale: _ctaAnimation.value,
                                      child: Container(
                                        width: (MediaQuery.of(context).size.width - 50) / 2,
                                        height: (MediaQuery.of(context).size.width - 50) / 2,
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(color: EstateColors.white.withOpacity(.4), borderRadius: BorderRadius.circular(30)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Expanded(
                                              child: Column(
                                                children: [
                                                  Text('RENT', style: TextStyle(fontSize: 12, color: EstateColors.primary)),
                                                ],
                                              ),
                                            ),
                                            AnimatedBuilder(
                                              animation: _countAnimation,
                                              builder: (context, child) {
                                                if (_countAnimation.value > 0.8) {
                                                  _bottomController.forward();
                                                }
                                                return Text((_countAnimation.value * 2212).toString().split('.').first,
                                                    style: const TextStyle(fontSize: 34, color: EstateColors.primary, fontWeight: FontWeight.w600));
                                              },
                                            ),
                                            const Expanded(
                                              child: Column(
                                                children: [
                                                  Text('offers', style: TextStyle(fontSize: 12, color: EstateColors.primary)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                    AnimatedBuilder(
                        animation: _bottomAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, 550 - (550 * double.parse(_bottomAnimation.value.toString()))),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: EstateColors.white,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: RoomOne(
                                      isDone: double.parse(_bottomAnimation.value.toString()) >= 0.8,
                                      isShowable: double.parse(_bottomAnimation.value.toString()) >= 0.55,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: RoomTwo(
                                            isDone: _bottomAnimation.isCompleted,
                                            isShowable: double.parse(_bottomAnimation.value.toString()) >= 0.9,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: RoomThree(
                                                  isDone: _bottomAnimation.isCompleted,
                                                  isShowable: double.parse(_bottomAnimation.value.toString()) >= 0.7,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Expanded(
                                                child: RoomFour(
                                                  isDone: _bottomAnimation.isCompleted,
                                                  isShowable: double.parse(_bottomAnimation.value.toString()) >= 0.9,
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
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RoomFour extends StatefulWidget {
  const RoomFour({super.key, required this.isDone, required this.isShowable});

  final bool isDone;
  final bool isShowable;
  @override
  State<RoomFour> createState() => _RoomFourState();
}

class _RoomFourState extends State<RoomFour> {
  bool showText = false;
  Future displayText() async {
    await Future.delayed(Constants.singleDuration);
    setState(() {
      showText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDone) {
      displayText();
    }
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(image: AssetImage(EImages.four), fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomLeft,
      child: AnimatedScale(
        duration: Constants.basicDuration,
        scale: widget.isShowable ? 1 : 0,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              height: 40,
              width: !widget.isDone ? 40 : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: EstateColors.primary.withOpacity(.9)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: EstateColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Icon(CupertinoIcons.chevron_forward, size: 12),
                  ),
                ],
              ),
            ),
            if (showText)
              Positioned.fill(
                child: Row(
                  children: [
                    AnimatedOpacity(
                      duration: Constants.basicDuration,
                      opacity: showText ? 1 : 0,
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Sedova St., 22', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class RoomTwo extends StatefulWidget {
  const RoomTwo({super.key, required this.isDone, required this.isShowable});

  final bool isDone;
  final bool isShowable;
  @override
  State<RoomTwo> createState() => _RoomTwoState();
}

class _RoomTwoState extends State<RoomTwo> {
  bool showText = false;
  Future displayText() async {
    await Future.delayed(Constants.singleDuration);
    setState(() {
      showText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDone) {
      displayText();
    }
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(image: AssetImage(EImages.two), fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomLeft,
      child: AnimatedScale(
        duration: Constants.basicDuration,
        scale: widget.isShowable ? 1 : 0,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              height: 40,
              width: !widget.isDone ? 40 : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: EstateColors.primary.withOpacity(.9)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: EstateColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Icon(CupertinoIcons.chevron_forward, size: 12),
                  ),
                ],
              ),
            ),
            if (showText)
              Positioned.fill(
                child: Row(
                  children: [
                    AnimatedOpacity(
                      duration: Constants.basicDuration,
                      opacity: showText ? 1 : 0,
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Gubina St., 11', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class RoomThree extends StatefulWidget {
  const RoomThree({super.key, required this.isDone, required this.isShowable});

  final bool isDone;
  final bool isShowable;
  @override
  State<RoomThree> createState() => _RoomThreeState();
}

class _RoomThreeState extends State<RoomThree> {
  bool showText = false;
  Future displayText() async {
    await Future.delayed(Constants.singleDuration);
    setState(() {
      showText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDone) {
      displayText();
    }
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(image: AssetImage(EImages.three), fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomLeft,
      child: AnimatedScale(
        duration: Constants.singleDuration,
        scale: widget.isShowable ? 1 : 0,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              height: 40,
              width: !widget.isDone ? 40 : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: EstateColors.primary.withOpacity(.9)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: EstateColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Icon(CupertinoIcons.chevron_forward, size: 12),
                  ),
                ],
              ),
            ),
            if (showText)
              Positioned.fill(
                child: Row(
                  children: [
                    AnimatedOpacity(
                      duration: Constants.basicDuration,
                      opacity: showText ? 1 : 0,
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Trefoleva St., 43', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class RoomOne extends StatefulWidget {
  const RoomOne({super.key, required this.isDone, required this.isShowable});
  final bool isDone;
  final bool isShowable;

  @override
  State<RoomOne> createState() => _RoomOneState();
}

class _RoomOneState extends State<RoomOne> {
  bool showText = false;
  Future displayText() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      showText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDone) {
      displayText();
    }
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(image: AssetImage(EImages.one), fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomLeft,
      child: AnimatedScale(
        duration: Constants.basicDuration,
        scale: widget.isShowable ? 1 : 0,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Constants.basicDuration,
              curve: Curves.easeInOut,
              height: 57,
              width: !widget.isDone ? 57 : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: EstateColors.primary.withOpacity(.9)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: EstateColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Icon(CupertinoIcons.chevron_forward, size: 12),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Center(
                child: AnimatedOpacity(
                  duration: Constants.basicDuration,
                  opacity: showText ? 1 : 0,
                  child: const Text('Gladkova St., 25', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
