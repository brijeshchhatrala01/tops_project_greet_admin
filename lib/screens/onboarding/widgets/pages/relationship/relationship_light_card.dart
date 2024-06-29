import 'package:flutter/material.dart';
import 'package:tops_project_greet_admin/screens/constants.dart';

import '../../icon_container.dart';

class RelationshipLightCard extends StatelessWidget {
  const RelationshipLightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconContainer(iconData: Icons.brush, padding: kPaddingS),
        IconContainer(iconData: Icons.camera_alt, padding: kPaddingM),
        IconContainer(iconData: Icons.straighten, padding: kPaddingS),
      ],
    );
  }
}
