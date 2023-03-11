import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paygo_sdk_example/commons/widgets/style/application_colors.dart';

class ButtonDefault extends StatelessWidget {
  final String? label;
  final IconData? icone;
  final Color? primaryColor;
  final Color? secondaryColor;
  final void Function()? onTap;

  const ButtonDefault({
    Key? key,
    this.label = 'label',
    this.icone,
    this.primaryColor,
    this.secondaryColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color currentPrimaryColor = primaryColor ?? ApplicationColors.paygoYellow;
    final Color currentSecondaryColor = secondaryColor ?? ApplicationColors.paygoDark;

    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        return Container(
          decoration: BoxDecoration(
            color: currentPrimaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: currentSecondaryColor.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(
                  1,
                  1,
                ),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                highlightColor: currentPrimaryColor.withOpacity(0.2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      color: currentSecondaryColor,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(constraints.maxWidth * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: icone != null,
                            child: Expanded(
                              flex: 1,
                              child: Center(
                                child: FaIcon(
                                  icone,
                                  color: ApplicationColors.paygoDark,
                                  size: 25,
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            child: Expanded(
                              flex: 4,
                              child: Text(
                                label ?? 'label',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: ApplicationColors.paygoDark,
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
