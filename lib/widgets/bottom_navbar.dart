import 'package:flutter/material.dart';
import 'package:flutter_ngekos/theme.dart';

class BottomNavBar extends StatelessWidget {
  final String? imageUrl;
  final bool isActive;

  const BottomNavBar({Key? key, required this.imageUrl, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl ?? '',
          width: 25,
        ),
        Spacer(),
        if (isActive)
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: purpleColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(100))),
          )
      ],
    );
  }
}
