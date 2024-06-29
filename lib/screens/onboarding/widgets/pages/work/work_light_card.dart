import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../icon_container.dart';

class WorkLightCard extends StatelessWidget {
  const WorkLightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconContainer(iconData: Icons.event_seat, padding: kPaddingS),
        IconContainer(iconData: Icons.business_center, padding: kPaddingM),
        IconContainer(iconData: Icons.assessment, padding: kPaddingS),
      ],
    );
  }
}
