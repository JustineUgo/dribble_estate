import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real/theme/theme.dart';
import 'package:real/utils/assests.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: EstateColors.dark,
        image: DecorationImage(image: AssetImage(EImages.map), fit: BoxFit.cover),
      ),
    );
  }
}
