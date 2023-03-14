import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../commons/widgets/buttons/button_default.dart';
import '../../../commons/widgets/style/application_colors.dart';

class MenuItemWidget extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const MenuItemWidget({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: ButtonDefault(
          label: label,
          icone: FontAwesomeIcons.idCard,
          primaryColor: ApplicationColors.paygoYellow,
          secondaryColor: ApplicationColors.paygoDark,
          onTap: onTap,
        ),
      ),
    );
  }
}
