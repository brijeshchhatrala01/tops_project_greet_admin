import 'package:flutter/material.dart';

import '../../constants.dart';

class Header extends StatelessWidget {
  final void Function()? onTap;
  const Header({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Ink.image(
          image: const AssetImage('images/logo_png.png'),
          height: 50,
          width: 50,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: kLightGold,
                ),
          ),
        )
      ],
    );
  }
}
