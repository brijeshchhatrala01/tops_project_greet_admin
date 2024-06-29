import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../icon_container.dart';

class CommunityLightCard extends StatelessWidget {
  const CommunityLightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconContainer(iconData: Icons.person, padding: kPaddingS),
        IconContainer(iconData: Icons.group, padding: kPaddingM),
        IconContainer(iconData: Icons.insert_emoticon, padding: kPaddingS),
      ],
    );
  }
}
